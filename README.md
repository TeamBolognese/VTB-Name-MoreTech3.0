# API Backend
API is up and working on: https://vtbmt3.teambolognese.ru/

## [app.py](app.py) - bottle web app with sqlite connection
### Endpoints:<br>
<b>/api/hello</b> - Hello world [(Link)](https://vtbmt3.teambolognese.ru/api/hello)
<br><b>/login</b> - Authenticate form [(Link)](https://vtbmt3.teambolognese.ru/login)
<br><b>/register</b> - Registration form [(Link)](https://vtbmt3.teambolognese.ru/register)
<br><b>/api/get/users</b> - Get users table [(Link)](https://vtbmt3.teambolognese.ru/api/get/users)
<br><b>/api/login</b> and <b>/api/register</b> - Login/registration API (POST)

## [db.db](db.db) - sqlite3 database
### Structure:

![image](https://user-images.githubusercontent.com/47640060/136656790-da729cfd-ea7c-401c-96d8-902b57d54c74.png)

TABLE types_tree (type_tree_id INTEGER PRIMARY KEY, name TEXT);

TABLE tree (tree_id INTEGER PRIMARY KEY, health_level INTEGER, type_tree_id INTEGER, FOREIGN KEY(type_tree_id) REFERENCES types_tree(type_tree_id));

TABLE types_risk (type_risk_id INTEGER PRIMARY KEY, name TEXT);

TABLE users (user_id INTEGER PRIMARY KEY, username TEXT NOT NULL UNIQUE, password TEXT NOT NULL, gender INTEGER, age INTEGER, fullname TEXT, type_risk_id INTEGER, tree_id INTEGER, water INTEGER, money INTEGER, FOREIGN KEY(tree_id) REFERENCES tree(tree_id), FOREIGN KEY(type_risk_id) REFERENCES types_risk(type_risk_id));
