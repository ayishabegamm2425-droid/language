// models/country_model.dart
class Country {
  final String name;
  final String code;
  final String dialCode;
  final String flag;

  Country({
    required this.name,
    required this.code,
    required this.dialCode,
    required this.flag,
  });

  @override
  String toString() => "$dialCode $name";
}