import psycopg2


def create_db(cur):
    cur.execute(
        """
        DROP TABLE client CASCADE;
        DROP TABLE phone CASCADE;
        CREATE TABLE IF NOT EXISTS client(
            id SERIAL PRIMARY KEY,
            name VARCHAR(80) NOT NULL,
            surname VARCHAR(80) NOT NULL,
            mail VARCHAR(80) 
        );
        CREATE TABLE IF NOT EXISTS phone(
            id SERIAL PRIMARY KEY,
            phone VARCHAR UNIQUE,
            client_id INTEGER REFERENCES client(id)
        );
        """
    )


def add_client(cur, name, surname, mail, phone=None):
    cur.execute("INSERT INTO client(name, surname, mail) VALUES (%s, %s, %s)", (name, surname, mail))
    cur.execute("SELECT id FROM client WHERE mail=%s", (mail,))
    client_id = cur.fetchone()[0]
    cur.execute("INSERT INTO phone(phone, client_id) VALUES (%s, %s)", (phone, client_id))


def add_phone(cur, client_id, phone=None):
    cur.execute("INSERT INTO phone(phone, client_id) VALUES (%s, %s)", (phone, client_id))
    conn.commit()


def change_client(cur, id, name=None, surname=None, mail=None, phone=None):
    client_data = {"name": name, "surname": surname, "mail": mail}
    for key, value in client_data.items():
        if value:
            cur.execute(f"UPDATE client SET {key} = %s WHERE id=%s", (value, id))
    if phone:
        cur.execute("UPDATE phone SET phone = %s WHERE id=%s", (phone, id))


def delete_phone(cur, id, phone):
    cur.execute("UPDATE phone SET phone=NULL WHERE id = %s AND phone = %s", (id, phone))


def delete_client(cur, id):
    cur.execute("DELETE FROM phone WHERE client_id = %s", (id,))
    cur.execute("DELETE FROM client WHERE id = %s", (id,))


def find_client(cur, name=None, surname=None, mail=None, phone=None):
    dct = {"name": name, "surname": surname, "mail": mail, "phone": phone}
    data = list()
    request = str()
    for key, value in dct.items():
        if value:
            request += f"{key} = %s AND "
            data.append(value)
    if request[-4:-1] == "AND":
        request = request[:-5]
    if data:
        cur.execute(
            f"""
            SELECT name, surname, mail, p.phone FROM client
                JOIN phone p on client.id = p.client_id
                WHERE {request}
            """,
            tuple(data)
        )
        print(cur.fetchall())


if __name__ == "__main__":
    with psycopg2.connect(database="postgres", user="postgres", password="postgres", host="localhost",
                          port="5432") as conn:
        with conn.cursor() as cur:
            create_db(cur)
            add_client(cur, "Mike", "Tyson", "tyson@google.com", "124545")
            add_client(cur, "Like", "Tompson", "tompson@google.com")
            add_phone(cur, 1, "131313")
            change_client(cur, 2, name="Bike", phone="555")
            find_client(cur, name="Bike", phone="555")
            delete_phone(cur, 2, "456")
            delete_client(cur, 2)
