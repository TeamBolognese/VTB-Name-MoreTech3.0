import 'dart:convert';

import 'package:moretech_app/flower_model.dart';
import 'package:moretech_app/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<User> createUser(Map<String, dynamic> json) async {
    var user = User.fromJson(json);

    Map<String, dynamic> flower = {
      "name": user.flowerName(),
    };
    if (flower["name"] == "Бонсай") {
      flower["water"] = 30;
      flower["care"] = 60;
      flower["sun"] = 45;
    } else if (flower["name"] == "Бегония") {
      flower["water"] = 50;
      flower["care"] = 35;
      flower["sun"] = 35;
    } else if (flower["name"] == "Папоротник") {
      flower["water"] = 75;
      flower["care"] = 15;
      flower["sun"] = 30;
    }
    user.flower = Flower.fromJson(flower);
    return user;
  }

  Future<void> saveUser(Map<String, dynamic> user) async {
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
