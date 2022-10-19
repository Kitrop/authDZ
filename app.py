from flask import Flask, render_template, request
import psycopg2


app = Flask(__name__)


conn = psycopg2.connect(database="auth_db",
                        user="postgres",
                        password="92657792Sha_",
                        host="localhost",

                        port="5432")

cursor = conn.cursor()

# if "".join(username.split()) != "" and "".join(password.split()) != "":
#     error = ""
# else:
#     error = "не вверный логин или пароль"





@app.route('/login/', methods=['POST', 'GET'])
def login():
    error = ''
    username = request.form.get('username')
    password = request.form.get('password')


    if request.method == 'POST':
        cursor.execute("SELECT * FROM auth.users WHERE login=%s AND password=%s", (str(username), str(password)))
        records = list(cursor.fetchall())
        return render_template('account.html', full_name=records[0][1], username=records[0][2], password=records[0][3])

    if username == "" or password == "":
        error = "не вверный логин или пароль"
    else:
        error = ""

    return render_template('login.html', error = error)