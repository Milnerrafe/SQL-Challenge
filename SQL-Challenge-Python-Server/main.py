from flask import Flask, render_template, redirect, url_for, request, send_from_directory, render_template_string, jsonify
import mysql.connector
import sqlparse
import sqlite3


def startuppythondb():
    con = sqlite3.connect("python.db")
    cur = con.cursor()
    cur.execute("CREATE TABLE IF NOT EXISTS maindb(name TEXT, data TEXT)")
    con.commit()
    con.close()

def mysqlinfo(type):
    con = sqlite3.connect("python.db")
    cur = con.cursor()
    res = cur.execute(f"SELECT data FROM maindb WHERE name='mysql{type}'")
    row = res.fetchone()
    con.close()
    return row[0] if row else None

def makedb():
    conn = mysql.connector.connect(
        host=mysqlinfo('host'),
        user=mysqlinfo('user'),
        password=mysqlinfo('password'),
    )

    cursor = conn.cursor()

    stmt = 'CREATE DATABASE IF NOT EXISTS sqlchallengedb;'

    try:
        cursor.execute(stmt)
    except mysql.connector.Error as err:
        print(f"Error executing statement:\n{stmt}\n\nMySQL Error: {err}")

    conn.commit()
    cursor.close()
    conn.close()


app = Flask(__name__)


@app.route('/api')
def index():
    return 'hello world'


@app.route('/api/setup', methods=['POST'])
def setup():

    json_data = request.get_json()

    if not json_data:
        return jsonify({'error': 'No JSON received'}), 400

    host = json_data.get('host')
    username = json_data.get('username')
    password = json_data.get('password')

    con = sqlite3.connect("python.db")
    cur = con.cursor()
    cur.executemany("INSERT INTO maindb (name, data) VALUES (?, ?);", [
                ("mysqlhost", host),
                ("mysqlusername", username),
                ("mysqlpassword", password)
            ])
    con.commit()
    con.close()

    makedb()
    return 'success'





if __name__ == "__main__":
    startuppythondb()
    app.run(host='0.0.0.0', port=8000)
