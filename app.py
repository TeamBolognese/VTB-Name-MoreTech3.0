#!/usr/bin/python
'''
A basic bottle app
'''
from bottle import default_app, route, response, request, Response, app, run
from hashlib import sha256
from secrets import token_hex
import bottle
import sqlite3

connect = sqlite3.connect("db.db")
cursor = connect.cursor()

app = application = bottle.Bottle()

class StripPathMiddleware(object):
    '''
    Get that slash out of the request
    '''
    def __init__(self, a):
        self.a = a
    def __call__(self, e, h):
        e['PATH_INFO'] = e['PATH_INFO'].rstrip('/')
        return self.a(e, h)

@app.route('/')
def show_index():
    '''
    The front "index" page
    '''
    return '''
<head><title>Hack API</title></head><h2>Hackathon API</h2>
<h3><br>Endpoints:</h3>
<b>/api/hello</b> - Hello world (<a href=\"https://vtbmt3.teambolognese.ru/api/hello\">Link</a>)
<br><b>/login</b> - Authenticate form (<a href=\"https://vtbmt3.teambolognese.ru/login\">Link</a>)
<br><b>/register</b> - Registration form (<a href=\"https://vtbmt3.teambolognese.ru/register\">Link</a>)
<br><b>/api/get/users</b> - Get users table (<a href=\"https://vtbmt3.teambolognese.ru/api/get/users\">Link</a>)
<br><b>/api/login</b> and <b>/api/register</b> - Login/registration API (POST)
<br><br><br><h3>Database structure:</h3>
CREATE TABLE types_tree (type_tree_id INTEGER PRIMARY KEY, name TEXT);
<br>
CREATE TABLE tree (tree_id INTEGER PRIMARY KEY, health_level INTEGER, type_tree_id INTEGER, FOREIGN KEY(type_tree_id) REFERENCES types_tree(type_tree_id));</b>
<br>
CREATE TABLE types_risk (type_risk_id INTEGER PRIMARY KEY, name TEXT);
<br>
CREATE TABLE users (user_id INTEGER PRIMARY KEY, username TEXT NOT NULL UNIQUE, password TEXT NOT NULL, gender INTEGER, age INTEGER, fullname TEXT, type_risk_id INTEGER, tree_id INTEGER, water INTEGER, money INTEGER, FOREIGN KEY(tree_id) REFERENCES tree(tree_id), FOREIGN KEY(type_risk_id) REFERENCES types_risk(type_risk_id));
'''

@app.route('/api/hello')
def api():
    return '{\"text\": \"Hello world!\"}'
    #text = unquote(text).replace

@app.route('/register')
def register():
    return '''
        <form action="/api/register" method="post">
            Username: <input name="username" type="text" />
            Password: <input name="password" type="password" />
            <input value="Register" type="submit" />
        </form>
    '''

@app.route('/api/register', method='POST')
def do_register():
    username = request.forms.get('username')
    password = sha256(request.forms.get('password').encode()).hexdigest()
    if(username.isalnum()):
        # Валидация ввода
        # TODO: переписать на prepared statements
        resp = cursor.execute("INSERT INTO users (username, password) VALUES ('" + username + "','" + password +"');")
        connect.commit()
        if (len(resp.fetchall()) > 0):
            return "{\"result\":\"false\"}"
        else:
            return "{\"result\":\"true\"}"
    else:
        return "{\"result\":\"bad_characters\"}"

@app.route('/login')
def login():
    return '''
        <form action="/api/login" method="post">
            Username: <input name="username" type="text" />
            Password: <input name="password" type="password" />
            <input value="Login" type="submit" />
        </form>
    '''

@app.route('/api/login', method='POST')
def do_login():
    username = request.forms.get('username')
    password = sha256(request.forms.get('password').encode()).hexdigest()
    if(username.isalnum()):
        # Валидация ввода
        # TODO: переписать на prepared statements
        resp = cursor.execute("SELECT user_id FROM users WHERE username='" + username + "' AND password='" + password + "';")
        if (len(resp.fetchall()) == 1):
            return "{\"result\":\"true\",\"token\":\"" + token_hex() + "\"}"
        else:
            return bottle.HTTPResponse(status=403)
    else:
        return "{\"result\":\"bad_characters\"}"

@app.route('/api/get/users')
def users():
    resp = cursor.execute("SELECT * FROM users").fetchall()
    return str(resp)

if __name__ == '__main__':
    bottle.run(app=StripPathMiddleware(app),
        host='0.0.0.0',
        port=8080,
        debug=True)