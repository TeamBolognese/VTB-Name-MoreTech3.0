# API Backend
API сервер поднят и работает по адресу: https://vtbmt3.teambolognese.ru/.

## [app.py](app.py) - веб-сервер на bottle (API)
### Методы:
<b>/login</b> - Форма авторизации [(Link)](https://vtbmt3.teambolognese.ru/login)
<br><b>/register</b> - Форма регистрации [(Link)](https://vtbmt3.teambolognese.ru/register)
<br><b>/api/get/users</b> - Таблица пользователей [(Link)](https://vtbmt3.teambolognese.ru/api/get/users)
<br><b>/api/token_check/&lt;token&gt;</b> - Проверка токена [(Example)](https://vtbmt3.teambolognese.ru/api/token_check/3fdabf52ca2e83fc72816877bc4f197d635a1477ea56b213ae403c644cd133aa)
<br><b>/change_&lt;name&gt;</b> - Форма обновления money/water/age/tree_id/risk_type_id пользователя [(Example)](https://vtbmt3.teambolognese.ru/change_money)

## [db.db](db.db) - sqlite3 база данных
### Структура:

![image](https://user-images.githubusercontent.com/47640060/136656790-da729cfd-ea7c-401c-96d8-902b57d54c74.png)

TABLE types_tree (type_tree_id INTEGER PRIMARY KEY, name TEXT);

TABLE tree (tree_id INTEGER PRIMARY KEY, health_level INTEGER, type_tree_id INTEGER, FOREIGN KEY(type_tree_id) REFERENCES types_tree(type_tree_id));

TABLE types_risk (type_risk_id INTEGER PRIMARY KEY, name TEXT);

TABLE users (user_id INTEGER PRIMARY KEY, username TEXT NOT NULL UNIQUE, password TEXT NOT NULL, gender INTEGER, age INTEGER, fullname TEXT, type_risk_id INTEGER, tree_id INTEGER, water INTEGER, money INTEGER, FOREIGN KEY(tree_id) REFERENCES tree(tree_id), FOREIGN KEY(type_risk_id) REFERENCES types_risk(type_risk_id));

TABLE tokens (token_id INTEGER PRIMARY KEY, user_id INTEGER, token TEXT, FOREIGN KEY(user_id) REFERENCES users(user_id));
