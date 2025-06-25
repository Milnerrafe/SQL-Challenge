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
          "name": "MissionBriefing",
          "questionnumber": 1,
          "question": {
            "title": "Mission Briefing",
            "p1": "You are the manager of all Heroes on the planet, and there’s just been an incident! Unfortunately, the world’s government funding has all been invested into Funko Pops, and they can’t afford to hire any SQL developers. So, we need you to become one very fast. You will need to learn how to effectively navigate an SQL database through a Python interface to complete this task.",
            "p2": "Some of the things you might have to do using SQL (without us giving everything away) include: Select database, view tables, filter and sort outputs, and insert data.",
            "p3": "Note that we will be using specifically MySQL for this work. It is one of the many variants of SQL and other ones might have slightly different syntax. So, make sure you specify MySQL during your research.",
            "p4": "To get started, you will want to review the most recent incident logged in the database. You will need to write the right query to extract it from the database. For your first challenge, you will need to identify the fiendish villains behind this dastardly plot! Find the database you need to access and read the descriptions of each table in it to figure out where the information you need is stored, and how to submit your answers.",
            "p5": "You will need to do a lot of Googling to crack this case, detective! If you are ever truly stuck, ask Leanna or Serhat for help and they can point you in the right direction. If you use ChatGPT, then the world will explode and you’ll be out of a job, so don’t do that. Good luck!"
          },
          "submitbutton": "Submit",
          "answersresponse": {
            "iscorrect": "You identified them! It's time to put together a hero team to defeat them in Scenario 2! Review the files, and try to form a team who can really exploit each of their weaknesses.",
            "redherring": "It seems like it could be these evildoers... but something doesn't add up. Dig into their history a little more, check the tables to see if there is something else on them. It might crack this case wide open."
          }
        }
        return jsonify(question1)
    if res == '2':
        question2 = {
          "name": "HeroTeam",
          "questionnumber": 2,
          "question": {
            "title": "Assemble a Team",
            "p1": "Now that you've identified the villains, it's time to put together a hero team to defeat them! Review the files and try to form a team who can really exploit each of their weaknesses.",
            "p2": "There is one small problem, and I mean very small... our budget. We can only afford to pay up to 25,000 for this job, and not a cent more. I have this stick of gum in my pocket we could maybe throw in too... you know, if we're desperate.",
            "p3": "Your answer for Scenario 2 will need to be a query that returns a single number that is the total cost of the team you have chosen. Insert this query into the Answer column of the Solutions table, like before.",
            "p4": "null",
            "submitbutton": "Submit"
          },
          "answersresponse": {
            "iscorrect": "You've found the heroes for the job, now, you just have to find where those wretched rogues are holed up. There are quite a few locations in the Locations table, but an anonymous tipster has said that the Sector with the highest average EvilVibeScore houses our villains!"
          }
        }
        return jsonify(question2)
    if res == '3':
        question3 = {
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
            "iscorrect": "Congratulations, you found the averages for each sector! Remember the hideout we are after is in the sector with the highest average EvilVibeScore."
          }
        }
        return jsonify(question3)
    if res == '4':
        question4 = {
          "name": "CorrectLocation",
          "questionnumber": 4,
          "question": {
            "title": "Location",
            "p1": "Congratulations, you found the averages for each sector! Remember the hideout we are after is in the sector with the highest average EvilVibeScore.",
            "p2": "Review the evidence, study the locations, and determine the location of those conniving bandits to submit as the answer for Scenario 4!",
            "p3": "null",
            "p4": "null",
            "submitbutton": "Submit"
          },
          "answersresponse": {
            "iscorrect": "The Celadon Cathedral, of course! We will dispatch the heroes immediately! The heroes arrive at the cathedral, tripping the villains' security system and alerting them to their presence. The villains scramble to their feet, take their marks, and prepare for battle. Evil Her-mes speeds towards the heroes, in her signature bright red puffer. Time Warp slows down time, catches up to Evil Her-mes, and handcuffs her. As Doomba vacuums centuries-old dust from the floor, Man in the Van tries to hack into the heroes' comms from his van, which is strangely inside. Doomba delivers an EMP blast, disabling his equipment, and trapping him in his van. He knocks on the door for a while but soon gives up. Freeze Tag runs towards the heroes and tries to tag them. Pyra fires off a burst of flame straight towards Freeze Tag. Freeze Tag's ice melts, and he is left standing in a lukewarm puddle, his powers cancelled out. Hellakinetic grabs a chair from rows of chairs in the cathedral and telekinetically flings it at an astonishing speed towards Prop. Prop morphs into the chair and sends it flying back towards Hellakinetic. The chair crashes into Hellakinetic, sending him flying into a wall and knocking him unconscious. The victorious heroes bring the defeated villains to the time out corner to stay and think about what they’ve done before searching for the bags of stolen money. They find it in the crypt. The heroes bring it back to the bank, and the bank workers are overjoyed. They thank the heroes profusely. The heroes thank them, and take their leave. Congratulations, you’ve solved the mystery! Go and let Leanna or Serhat know so they can tell you what to do next."
          }
        }
        return jsonify(question4)
    if res == '0':
        setupneeded = {'setupneeded':'yes'}
        return jsonify(setupneeded)
    if res == '5':
        welldone = {'welldone':'yes'}
        return jsonify(welldone)
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
    if qnumber == 2:
        conn = mysql.connector.connect(
            host=mysqlinfo('host'),
            user=mysqlinfo('username'),
            password=mysqlinfo('password'),
            database='sqlchallengedb'
        )

        cursor = conn.cursor()

        stmt = """SELECT Answer from Solutions WHERE Scenario='2';"""

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

        conn = mysql.connector.connect(
            host=mysqlinfo('host'),
            user=mysqlinfo('username'),
            password=mysqlinfo('password'),
            database='sqlchallengedb'
        )

        cursor = conn.cursor()

        stmt = sanwr

        try:
            cursor.execute(stmt)
        except mysql.connector.Error as err:
            return f"Error executing statement:\n{stmt}\n\nMySQL Error: {err}", 500

        row = cursor.fetchall()

        answer2 = row[0]

        sanwr2 = str(answer2)

        conn.commit()
        cursor.close()
        conn.close()

        if sanwr2 == '24000':
            con = sqlite3.connect("python.db")
            cur = con.cursor()
            cur.execute("""UPDATE "maindb" SET "data" = '3' WHERE "name" = 'progress';""")
            con.commit()
            con.close()
            return 'yes'
    if qnumber == 3:
        conn = mysql.connector.connect(
            host=mysqlinfo('host'),
            user=mysqlinfo('username'),
            password=mysqlinfo('password'),
            database='sqlchallengedb'
        )

        cursor = conn.cursor()

        stmt = """SELECT Answer from Solutions WHERE Scenario='3';"""

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

        conn = mysql.connector.connect(
            host=mysqlinfo('host'),
            user=mysqlinfo('username'),
            password=mysqlinfo('password'),
            database='sqlchallengedb'
        )

        cursor = conn.cursor()

        stmt = sanwr

        try:
            cursor.execute(stmt)
        except mysql.connector.Error as err:
            return f"Error executing statement:\n{stmt}\n\nMySQL Error: {err}", 500

        answer2 = cursor.fetchall()

        conn.commit()
        cursor.close()
        conn.close()


        conn = mysql.connector.connect(
            host=mysqlinfo('host'),
            user=mysqlinfo('username'),
            password=mysqlinfo('password'),
            database='sqlchallengedb'
        )

        cursor = conn.cursor()

        stmt = '''SELECT Sector, AVG(EvilVibeScore) from locations group by sector'''

        try:
            cursor.execute(stmt)
        except mysql.connector.Error as err:
            return f"Error executing statement:\n{stmt}\n\nMySQL Error: {err}", 500

        answer3 = cursor.fetchall()

        conn.commit()
        cursor.close()
        conn.close()

        if answer2 == answer3:
            con = sqlite3.connect("python.db")
            cur = con.cursor()
            cur.execute("""UPDATE "maindb" SET "data" = '4' WHERE "name" = 'progress';""")
            con.commit()
            con.close()
            return 'yes'
        else:
            return 'no'










    else:
        return 'error', 400






























if __name__ == "__main__":
    startuppythondb()
    app.run(host='0.0.0.0', port=8000)
