import 'dart:convert';

import 'package:moretech_app/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<void> saveUser(Map<String, dynamic> user) async {
    var count = user["sex"] == "Мужской" ? 0.32 : 0.16;
    count += user["age"] == "До 25"
        ? 0.48
        : user["age"] == "От 26 до 55"
            ? 0.32
            : 0.16;
    count += user["crazy_status"] == "Да"
        ? 1.02
        : user["crazy_status"] == "Не уверен"
            ? 0.68
            : 0.34;
    count += user["target"] == "Всего и сразу"
        ? 1.02
        : user["target"] == "Как пойдет"
            ? 0.68
            : 0.34;

    user["count"] = count;

    var prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));
  }

  Future<bool> userExist() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("user");
  }

  Future<void> removeUserData() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
  }

  Future<User?> getUserData() async {
    if (await userExist()) {
      var prefs = await SharedPreferences.getInstance();
      var str = prefs.getString("user");
      var user = User.fromRawJson(str!);
      return user;
    }

    return null;
  }
}
