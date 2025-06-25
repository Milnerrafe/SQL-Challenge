from flask import Flask, render_template, redirect, url_for, request, send_from_directory, render_template_string, jsonify
import mysql.connector
import sqlparse
import sqlite3
from flask_cors import CORS



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
        user=mysqlinfo('username'),
        password=mysqlinfo('password'),
    )

    cursor = conn.cursor()

    stmt = ['CREATE DATABASE IF NOT EXISTS sqlchallengedb;', ]

    for i in stmt:
        try:
            cursor.execute(i)
        except mysql.connector.Error as err:
            print(f"Error executing statement:\n{i}\n\nMySQL Error: {err}")

    conn.commit()
    cursor.close()
    conn.close()


app = Flask(__name__)
CORS(app)


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
    cur.execute("DELETE FROM maindb WHERE name='mysqlhost' or name='mysqlusername' or name='mysqlpassword';")
    cur.executemany("INSERT INTO maindb (name, data) VALUES (?, ?);", [
                ("mysqlhost", host),
                ("mysqlusername", username),
                ("mysqlpassword", password)
            ])
    con.commit()
    con.close()

    makedb()
    return 'success'


@app.route('/api/question', methods=['get'])
def qestsion():

    con = sqlite3.connect("python.db")
    cur = con.cursor()
    res = cur.execute("SELECT data FROM maindb WHERE name='progress'")
    row = res.fetchone()
    con.close()
    res = row[0] if row else None

    if res == '1':
        question1 = {
          "name": "question-for-render",
          "questionnumber": 1,
          "question": {
            "title": "yourtile",
            "p1": "paragraph-1",
            "p2": "paragraph-2",
            "p3": "paragraph-3",
            "p4": "paragraph-4",
            "submitbutton": "text for submit button"
          },
          "answersresponse": {
            "iscorrect": "text for is correct",
            "ifsomeiscorrect": "text for is some is correct",
            "isalmostcorrect": "text for is some is almost correct",
            "": {}
          }
        }
        return jsonify(question1)
    if res == '2':
        return '2'
    if res == '3':
        return '3'
    if res == '4':
        return '4'
    else:
        return 'error'












if __name__ == "__main__":
    startuppythondb()
    app.run(host='0.0.0.0', port=8000)
