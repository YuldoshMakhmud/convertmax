import 'package:convermax/presentation/screens/currency/currency_page.dart';
import 'package:convermax/presentation/screens/exel/exel_page.dart';
import 'package:convermax/presentation/screens/home/home_page.dart';
import 'package:convermax/presentation/screens/home/splash_page.dart';
import 'package:convermax/presentation/screens/lotin_kiril/lotin_kiril_page.dart';
import 'package:flutter/material.dart';

class RouteName {
  static const String splash = "/splash";
  static const String home = '/home';
  static const String currency = '/currency';
  static const String exel = '/exel';
  static const String lotin_kiril = '/lotin_kiril';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RouteName.lotin_kiril:
        return MaterialPageRoute(builder: (context) => const LotinKiril());
      case RouteName.currency:
        return MaterialPageRoute(builder: (context) => CurrencyPage());
      case RouteName.exel:
        return MaterialPageRoute(builder: (context) => const ExelPage());
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
