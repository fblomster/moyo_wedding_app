import 'package:flutter/cupertino.dart';
import 'package:moyo/l10n/supported_locale.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale = const Locale('sv');
  Locale? get locale => _locale;
  void setLocale(Locale loc) {
    if (!L10n.support.contains(loc)) return;
    _locale = loc;
    notifyListeners();
  }
  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}