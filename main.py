import psycopg2


def create_db(conn):
    with conn.cursor() as cur:
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
        conn.commit()


def add_client(conn, name, surname, mail, phone=None):
    with conn.cursor() as cur:
        cur.execute("INSERT INTO client(name, surname, mail) VALUES (%s, %s, %s)", (name, surname, mail))
        cur.execute("SELECT id FROM client WHERE mail=%s", (mail,))
        client_id = cur.fetchone()[0]
        cur.execute("INSERT INTO phone(phone, client_id) VALUES (%s, %s)", (phone, client_id))
        conn.commit()


def add_phone(conn, client_id, phone=None):
    with conn.cursor() as cur:
        cur.execute("INSERT INTO phone(phone, client_id) VALUES (%s, %s)", (phone, client_id))
        conn.commit()


def change_client(conn, id, name, surname, mail, phone):
    with conn.cursor() as cur:
        cur.execute("UPDATE client SET name = %s, surname = %s, mail = %s WHERE id=%s", (name, surname, mail, id))
        cur.execute("UPDATE phone SET phone = %s WHERE id=%s", (phone, id))
        conn.commit()


def delete_phone(conn, id, phone):
    with conn.cursor() as cur:
        cur.execute("UPDATE phone SET phone=NULL WHERE id = %s AND phone = %s", (id, phone))
        conn.commit()


def delete_client(conn, id):
    with conn.cursor() as cur:
        cur.execute("DELETE FROM phone WHERE client_id = %s", (id,))
        cur.execute("DELETE FROM client WHERE id = %s", (id,))
        conn.commit()


def find_client(conn, name=None, surname=None, mail=None, phone=None):
    with conn.cursor() as cur:
        if name and surname:
            cur.execute(
                """SELECT name, surname, mail, p.phone FROM client
                    JOIN phone p on client.id = p.client_id
                    WHERE name = %s AND surname = %s OR mail = %s OR p.phone = %s
                """,
                (name, surname, mail, phone)
            )
        else:
            cur.execute(
                """SELECT name, surname, mail, p.phone FROM client
                    JOIN phone p on client.id = p.client_id
                    WHERE name = %s OR surname = %s OR mail = %s OR p.phone = %s
                """,
                (name, surname, mail, phone)
            )
        print(cur.fetchall())


if __name__ == "__main__":
    with psycopg2.connect(database="postgres", user="postgres", password="postgres", host="localhost",
                          port="5432") as conn:
        create_db(conn)
        add_client(conn, "Mike", "Tyson", "tyson@google.com", "124545")
        add_client(conn, "Like", "Tompson", "tompson@google.com")
        add_phone(conn, 1, "131313")
        change_client(conn, 2, "Bike", "Jonson", "jonson@bk.ru", "456")
        delete_phone(conn, 2, "456")
        delete_client(conn, 2)
        find_client(conn, phone="124545")
