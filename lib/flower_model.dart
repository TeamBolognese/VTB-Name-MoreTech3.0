import 'dart:convert';

class Flower {
  String name;
  int? water = 0;
  int? care = 100;
  int? sun = 0;

  Flower({required this.name, this.water, this.care, this.sun});

  String engName(String name) {
    return name == "Бонсай"
        ? "bonsai"
        : name == "Бегония"
            ? "begonia"
            : "fern";
  }

  double calcHearth() => 0;
  String getPath() => "";

  String defaultPath() {
    return "${engName(name)}/${engName(name)}-L-high-health.svg";
  }

  String description() {
    if (name == "Папоротник") {
      return "Тебе подходит спокойный стиль инвестирования. Поэтому твое растение - папоротник.";
    } else if (name == "Бегония") {
      return "Тебе подходит умереный стиль инвестирования. Поэтому твое растение - бегония.";
    } else {
      return "Тебе подходит агрессивный стиль инвестирования. Поэтому твое растение - бонсай.";
    }
  }

  factory Flower.fromRawJson(String str) => Flower.fromJson(jsonDecode(str));

  factory Flower.fromJson(Map<String, dynamic> json) => Flower(
        name: json["name"],
        water: json["water"],
        care: json["care"],
        sun: json["sun"],
      );

  String toRawJson() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => {
        "name": name,
        "water": water,
        "care": care,
        "sun": sun,
      };
}
