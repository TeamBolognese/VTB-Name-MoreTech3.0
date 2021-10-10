import 'dart:convert';

class User {
  String name;
  String sex;
  String age;
  String crazyStatus;
  String target;
  double? count;
  int? balance = 0;
  int? water = 0;
  int? heart = 0;
  int? sun = 0;

  User({
    required this.name,
    required this.sex,
    required this.age,
    required this.crazyStatus,
    required this.target,
    this.count,
    this.balance,
    this.water,
    this.heart,
    this.sun,
  });

  String flowerName() {
    return count! >= 2.8
        ? "Роза"
        : count! >= 2.3
            ? "Тюльпан"
            : "Ромашка";
  }

  factory User.fromRawJson(String str) => User.fromJson(jsonDecode(str));

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        sex: json["sex"],
        age: json["age"],
        crazyStatus: json["crazy_status"],
        target: json["target"],
        count: json["count"],
        balance: json["balance"],
        water: json["water"],
        heart: json["heart"],
        sun: json["sun"],
      );

  String toRawJson() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => {
        "name": name,
        "sex": sex,
        "age": age,
        "crazy_status": crazyStatus,
        "target": target,
        "count": count,
        "balance": balance,
        "water": water,
        "heart": heart,
        "sun": sun,
      };
}
