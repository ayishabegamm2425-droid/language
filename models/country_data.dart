// data/country_data.dart

import 'package:mandobakadmin/models/country_model.dart';

class CountryData {
  static List<Country> countries = [
    Country(name: "Qatar", code: "QA", dialCode: "+974", flag: "🇶🇦"),
    Country(name: "India", code: "IN", dialCode: "+91", flag: "🇮🇳"),
    Country(name: "Saudi Arabia", code: "SA", dialCode: "+966", flag: "🇸🇦"),
    Country(name: "United Arab Emirates", code: "AE", dialCode: "+971", flag: "🇦🇪"),
    Country(name: "Kuwait", code: "KW", dialCode: "+965", flag: "🇰🇼"),
    Country(name: "Oman", code: "OM", dialCode: "+968", flag: "🇴🇲"),
    Country(name: "Bahrain", code: "BH", dialCode: "+973", flag: "🇧🇭"),
    Country(name: "Pakistan", code: "PK", dialCode: "+92", flag: "🇵🇰"),
    Country(name: "Bangladesh", code: "BD", dialCode: "+880", flag: "🇧🇩"),
    Country(name: "Sri Lanka", code: "LK", dialCode: "+94", flag: "🇱🇰"),
    Country(name: "Egypt", code: "EG", dialCode: "+20", flag: "🇪🇬"),
    Country(name: "Jordan", code: "JO", dialCode: "+962", flag: "🇯🇴"),
    Country(name: "Lebanon", code: "LB", dialCode: "+961", flag: "🇱🇧"),
    Country(name: "United States", code: "US", dialCode: "+1", flag: "🇺🇸"),
    Country(name: "United Kingdom", code: "GB", dialCode: "+44", flag: "🇬🇧"),
    Country(name: "Canada", code: "CA", dialCode: "+1", flag: "🇨🇦"),
    Country(name: "Australia", code: "AU", dialCode: "+61", flag: "🇦🇺"),
    Country(name: "France", code: "FR", dialCode: "+33", flag: "🇫🇷"),
    Country(name: "Germany", code: "DE", dialCode: "+49", flag: "🇩🇪"),
    Country(name: "Italy", code: "IT", dialCode: "+39", flag: "🇮🇹"),
    Country(name: "Spain", code: "ES", dialCode: "+34", flag: "🇪🇸"),
    Country(name: "China", code: "CN", dialCode: "+86", flag: "🇨🇳"),
    Country(name: "Japan", code: "JP", dialCode: "+81", flag: "🇯🇵"),
    Country(name: "South Korea", code: "KR", dialCode: "+82", flag: "🇰🇷"),
  ];

  static Country getDefaultCountry() {
    return countries.firstWhere((country) => country.code == "QA");
  }

  static Country getCountryByCode(String code) {
    return countries.firstWhere(
      (country) => country.code == code,
      orElse: () => getDefaultCountry(),
    );
  }

  static Country getCountryByDialCode(String dialCode) {
    return countries.firstWhere(
      (country) => country.dialCode == dialCode,
      orElse: () => getDefaultCountry(),
    );
  }
}