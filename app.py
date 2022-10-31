import re

from flask import Flask, render_template, request, redirect
import psycopg2

app = Flask(__name__)

conn = psycopg2.connect(database="auth_db",
                        user="postgres",
                        password="92657792Sha_",
                        host="localhost",
                        port="5432")

cursor = conn.cursor()

pattern = re.compile(r"[,.()|<>/{}[\]~!@#$%^&*+=№;:?`]")


@app.route('/registration/', methods=['POST', 'GET'])
def registration():
    if request.method == 'POST':
        name = request.form.get('name')
        login = request.form.get('login')
        password = request.form.get('password')

        if len("".join(login.split())) == 0 or pattern.search(login) or len(
                "".join(password.split())) == 0 or pattern.search(password) or len(
                "".join(name.split())) or pattern.search(name):
            errorReg = 'Неверно заполненые поля'
            return render_template('registration.html', errorReg=errorReg)

        cursor.execute('INSERT INTO auth.users (full_name, login, password) VALUES (%s, %s, %s);',(str(name), str(login), str(password)))
        conn.commit()

        return redirect('/login/')

    return render_template('registration.html')


@app.route('/login/', methods=['POST', 'GET'])
def login():
    if request.method == 'POST':
        if request.form.get("login"):

            username = request.form.get('username')
            password = request.form.get('password')

            if len("".join(username.split())) == 0 or pattern.search(username) or len("".join(password.split())) == 0 or pattern.search(password):
                error = 'Неверно заполненые поля'
                return render_template('login.html', error=error)

            cursor.execute("SELECT * FROM auth.users WHERE login=%s AND password=%s", (str(username), str(password)))
            records = list(cursor.fetchall())
            if len(records) == 0:
                errorLogin = 'Неверно введеные данные'
                return render_template('login.html', errorLogin=errorLogin)
            print('LENGTH: ', len(records))
            print('RECORDS: ', records)

            return render_template('account.html', full_name=records[0][1], username=records[0][2], password=records[0][3])

        elif request.form.get("registration"):
            return redirect("/registration/")

    return render_template('login.html')
