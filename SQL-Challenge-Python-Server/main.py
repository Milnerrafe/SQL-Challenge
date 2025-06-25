from flask import Flask, render_template, redirect, url_for, request, send_from_directory, render_template_string, jsonify
import mysql.connector
import sqlparse
import sqlite3
from flask_cors import CORS


def setupmysqldb():
       conn = mysql.connector.connect(
           host=mysqlinfo('host'),
           user=mysqlinfo('username'),
           password=mysqlinfo('password'),
           database='sqlchallengedb'
       )
       cursor = conn.cursor()

       with open('script.sql', 'r') as f:
           sql_script = f.read()

       statements = sqlparse.split(sql_script)

       for statement in statements:
           stmt = statement.strip()
           if stmt:
               try:
                   cursor.execute(stmt)
               except mysql.connector.Error as err:
                   print(f"Error executing statement:\n{stmt}\n\nMySQL Error: {err}")

       conn.commit()
       cursor.close()
       conn.close()





def startuppythondb():
    con = sqlite3.connect("python.db")
    cur = con.cursor()
    cur.execute("CREATE TABLE IF NOT EXISTS maindb (name TEXT PRIMARY KEY, data TEXT );")
    cur.execute("""INSERT INTO "maindb" ("name", "data") VALUES ('progress', '0') ON CONFLICT("name") DO UPDATE SET "data" = '0';""")
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

    setupmysqldb()


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
    con = sqlite3.connect("python.db")
    cur = con.cursor()
    cur.execute("""UPDATE "maindb" SET "data" = '1' WHERE "name" = 'progress';""")
    con.commit()
    con.close()

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
          "name": "AvgEvilVibeScore",
          "questionnumber": 3,
          "question": {
            "title": "Sectors",
            "p1": "You've found the heroes for the job, now, you just have to find where those wretched rogues are holed up. There are quite a few locations in the Locations table, but an anonymous tipster has said that the Sector with the highest average EvilVibeScore houses our villains!",
            "p2": "This might be a tough one... you will have to construct and submit a query that returns two columns. One with each of the Sectors, and one with the average EvilVibeScore for each to complete Scenario 3!",
            "p3": "null",
            "p4": "null",
            "submitbutton": "Submit"
          },
          "answersresponse": {
            "iscorrect": "Congratulations, you found the averages for each sector! Remember the hideout we are after is in the sector with the highest average EvilVibeScore. Review the evidence, study the locations, and determine the location of those conniving bandits to submit as the answer for Scenario 4."
          }
        }
        return jsonify(question1)
    if res == '2':
        return '2'
    if res == '3':
        return '3'
    if res == '4':
        return '4'
    if res == '0':
        setupneeded = {'setupneeded':'yes'}
        return jsonify(setupneeded)
    else:
        setupneeded = {'setupneeded':'yes'}
        return jsonify(setupneeded)


@app.route('/api/check', methods=['post'])
def check():
    json_data = request.get_json()

    if not json_data:
        return jsonify({'error': 'No JSON received'}), 400

    qnumber = json_data.get('qnumber')

    if qnumber == 1 :

            conn = mysql.connector.connect(
                host=mysqlinfo('host'),
                user=mysqlinfo('username'),
                password=mysqlinfo('password'),
                database='sqlchallengedb'
            )

            cursor = conn.cursor()

            stmt = """SELECT Answer from Solutions WHERE Scenario='1';"""

            try:
                cursor.execute(stmt)
            except mysql.connector.Error as err:
                return f"Error executing statement:\n{stmt}\n\nMySQL Error: {err}", 500

            row = cursor.fetchall()

            answer = row[0]

            sanwr = str(answer)

            conn.commit()
            cursor.close()
            conn.close()

            keywords = ["Hellakinetic", "Evil Her-mes", "Man in the Van", "Freeze Tag"]
            redwords = [' MechAneurysm, Rat Run, Blasta la Vista, Never Mist']

            lower_text = sanwr.lower()
            matches = [word for word in keywords if word.lower() in lower_text]
            redmatches = [word for word in redwords if word.lower() in lower_text]

            if len(matches) == len(keywords):
                con = sqlite3.connect("python.db")
                cur = con.cursor()
                cur.execute("""UPDATE "maindb" SET "data" = '2' WHERE "name" = 'progress';""")
                con.commit()
                con.close()
                return 'yes'
            if len(redmatches) == len(redwords):
                return 'red'
            else:
                return 'no'
    else:
        return 'error', 400






























if __name__ == "__main__":
    startuppythondb()
    app.run(host='0.0.0.0', port=8000)
