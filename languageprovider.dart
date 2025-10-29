// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LanguageProvider extends ChangeNotifier {
//   String _currentLanguage = 'en';
//   TextDirection _textDirection = TextDirection.ltr;

//   String get currentLanguage => _currentLanguage;
//   TextDirection get textDirection => _textDirection;
//   Locale get locale => Locale(_currentLanguage);

//   LanguageProvider() {
//     _loadLanguage();
//   }

//   Future<void> _loadLanguage() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedLanguage = prefs.getString('selected_language') ?? 'en';
//     _currentLanguage = savedLanguage;
//     _textDirection = savedLanguage == 'ar' ? TextDirection.rtl : TextDirection.ltr;
//     notifyListeners();
//   }

//   Future<void> setLanguage(String languageCode) async {
//     if (_currentLanguage == languageCode) return;

//     _currentLanguage = languageCode;
//     _textDirection = languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;

//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('selected_language', languageCode);

//     notifyListeners();
//   }

//   bool get isArabic => _currentLanguage == 'ar';
//   bool get isEnglish => _currentLanguage == 'en';
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator_plus/translator_plus.dart';

class LanguageProvider extends ChangeNotifier {
  String _currentLanguage = 'en';
  TextDirection _textDirection = TextDirection.ltr;
  final GoogleTranslator _translator = GoogleTranslator();

  String get currentLanguage => _currentLanguage;
  TextDirection get textDirection => _textDirection;
  Locale get locale => Locale(_currentLanguage);
  bool get isArabic => _currentLanguage == 'ar';
  bool get isEnglish => _currentLanguage == 'en';
  bool get isRTL => _textDirection == TextDirection.rtl;

  LanguageProvider() {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('selected_language') ?? 'en';
    _currentLanguage = savedLanguage;
    _textDirection = savedLanguage == 'ar' ? TextDirection.rtl : TextDirection.ltr;
    notifyListeners();
  }

  Future<void> setLanguage(String languageCode) async {
    if (_currentLanguage == languageCode) return;

    _currentLanguage = languageCode;
    _textDirection = languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', languageCode);

    notifyListeners();
  }

  /// Translate text from source language to current app language
  Future<String> translateText(String text, {String sourceLanguage = 'en'}) async {
    try {
      if (text.isEmpty) return text;
      
      // If already in target language, return as is
      if (_currentLanguage == sourceLanguage) return text;
      
      var translation = await _translator.translate(
        text, 
        from: sourceLanguage,
        to: _currentLanguage
      );
      return translation.text;
    } catch (e) {
      print('Error translating text: $e');
      return text; // Return original if translation fails
    }
  }

  /// Translate a map of strings
  Future<Map<String, String>> translateMap(Map<String, String> texts, {String sourceLanguage = 'en'}) async {
    if (_currentLanguage == sourceLanguage) return texts;
    
    Map<String, String> translated = {};
    
    for (var entry in texts.entries) {
      translated[entry.key] = await translateText(entry.value, sourceLanguage: sourceLanguage);
    }
    
    return translated;
  }

  /// Translate a list of strings
  Future<List<String>> translateList(List<String> texts, {String sourceLanguage = 'en'}) async {
    if (_currentLanguage == sourceLanguage) return texts;
    
    List<String> translated = [];
    
    for (var text in texts) {
      translated.add(await translateText(text, sourceLanguage: sourceLanguage));
    }
    
    return translated;
  }
}