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
    response.add_header('Access-Control-Allow-Origin', '*')
    return '''
<head><title>Hack API</title></head>
<style>
    p {
    font-family: Verdana, Arial, Helvetica, sans-serif; 
    font-size: 13pt;
    }
</style>
<h1>Hackathon API</h1>
<h2><p>Endpoints:</h2> \<token\> \\<token\\>
<b>/api/hello</b> - Hello world (<a href=\"https://vtbmt3.teambolognese.ru/api/hello\">Link</a>)
<br><b>/login</b> - Authenticate form (<a href=\"https://vtbmt3.teambolognese.ru/login\">Link</a>)
<br><b>/register</b> - Registration form (<a href=\"https://vtbmt3.teambolognese.ru/register\">Link</a>)
<br><b>/api/get/users</b> - Get users table (<a href=\"https://vtbmt3.teambolognese.ru/api/get/users\">Link</a>)
<br><b>/api/login</b> and <b>/api/register</b> - Login/registration API (POST)
</p><h2>Database structure:</h2>
<p>CREATE TABLE types_tree (type_tree_id INTEGER PRIMARY KEY, name TEXT);
<br>
CREATE TABLE tree (tree_id INTEGER PRIMARY KEY, health_level INTEGER, type_tree_id INTEGER, FOREIGN KEY(type_tree_id) REFERENCES types_tree(type_tree_id));</b>
<br>
CREATE TABLE types_risk (type_risk_id INTEGER PRIMARY KEY, name TEXT);
<br>
CREATE TABLE users (user_id INTEGER PRIMARY KEY, username TEXT NOT NULL UNIQUE, password TEXT NOT NULL, gender INTEGER, age INTEGER, fullname TEXT, type_risk_id INTEGER, tree_id INTEGER, water INTEGER, money INTEGER, FOREIGN KEY(tree_id) REFERENCES tree(tree_id), FOREIGN KEY(type_risk_id) REFERENCES types_risk(type_risk_id));
</p>'''

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
        resp = cursor.execute("INSERT INTO users (username, password) VALUES ('" + username + "','" + password +"');").fetchall()
        connect.commit()
        if (len(resp) > 0):
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
        resp = cursor.execute("SELECT user_id FROM users WHERE username='" + username + "' AND password='" + password + "';").fetchall()
        if (len(resp) == 1):
            token = token_hex()
            cursor.execute("INSERT INTO tokens (user_id, token) VALUES ('" + str(resp[0][0]) + "','" + token + "');")
            connect.commit()
            return "{\"result\":\"true\",\"token\":\"" + token + "\"}"
        else:
            return bottle.HTTPResponse(status=403)
    else:
        return "{\"result\":\"bad_characters\"}"

@app.route('/api/get/users')
def users():
    resp = cursor.execute("SELECT * FROM users").fetchall()
    return str(resp)

@app.route("/api/token_check/<text>")
def token_check(text):
    resp = cursor.execute("SELECT user_id FROM tokens WHERE token='" +  text + "';").fetchall()
    if(len(resp) == 1):
        username = cursor.execute("SELECT username FROM users WHERE user_id=" + str(resp[0][0]) + ";").fetchall()[0][0]
        return "{\"result\":\"True\",\"username\":\"" + username + "\"}"
    else:
        return "{\"result\":\"False\"}"

@app.route("/change_<name>")
def change(name):
    if(name in ['gender','age','type_risk_id','tree_id','water','money']):
        return '<form action="/api/change_' + name + '" method="post">Username: <input name="username" type="text"/>New ' + name + ' val: <input name="new_value" type="text"/><input value="Change" type="submit"/></form>'
    else:
        return 'Incorrect name for change value'

@app.route('/api/change_<name>', method='POST')
def do_change(name):
    username = request.forms.get('username')
    new_value = request.forms.get('new_value')
    if((username+new_value).isalnum()):
        # Валидация, поменять тоже
        if(name in ['gender','age','type_risk_id','tree_id','water','money']):
            resp = cursor.execute("UPDATE users SET " + name + " = " + new_value + " WHERE username = '" + username + "';")
            connect.commit()
            return "{\"result\":\"Done\"}"
        else:
            return 'Incorrect name for change value'
    else:
        return "{\"result\":\"bad_characters\"}"

if __name__ == '__main__':
    bottle.run(app=StripPathMiddleware(app),
        host='0.0.0.0',
        port=8080,
        debug=True)

