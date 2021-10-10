import 'dart:convert';

import 'package:moretech_app/flower_model.dart';

class User {
  String name;
  String sex;
  String age;
  String crazyStatus;
  String target;
  int? balance = 0;
  double? count;
  Flower? flower;

  User({
    required this.name,
    required this.sex,
    required this.age,
    required this.crazyStatus,
    required this.target,
    this.balance,
    this.count,
    this.flower,
  });

  String flowerName() {
    return count! >= 2.8
        ? "Бонсай"
        : count! >= 2.3
            ? "Бегония"
            : "Папоротник";
  }

  String flowerEnglishName() {
    return count! >= 2.8
        ? "bonsai"
        : count! >= 2.3
            ? "begonia"
            : "fern";
  }

  factory User.fromRawJson(String str) => User.fromJson(jsonDecode(str));

  factory User.fromJson(Map<String, dynamic> json) => User(
      name: json["name"],
      sex: json["sex"],
      age: json["age"],
      crazyStatus: json["crazy_status"],
      target: json["target"],
      balance: json["balance"],
      count: json["count"],
      flower:
          json["flower"] != null ? Flower.fromRawJson(json["flower"]) : null);

  String toRawJson() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => {
        "name": name,
        "sex": sex,
        "age": age,
        "crazy_status": crazyStatus,
        "target": target,
        "balance": balance,
        "count": count,
        "flower": flower != null ? flower!.toRawJson() : null,
      };
}
