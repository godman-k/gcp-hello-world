from flask import Flask
import psycopg2

app = Flask(__name__)

@app.route('/')
def hello_world():
    conn = psycopg2.connect(
        host="your-db-instance-ip",
        database="hello_world",
        user="your-db-user",
        password="your-db-password"
    )
    cur = conn.cursor()
    cur.execute("SELECT message FROM messages LIMIT 1")
    message = cur.fetchone()[0]
    cur.close()
    conn.close()
    return message

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
