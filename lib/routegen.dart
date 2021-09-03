import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';
import 'src/doctor.dart';
import 'src/login_screen.dart';
import 'src/report.dart';
import 'main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Login());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/doctor':
        return MaterialPageRoute(builder: (_) => Doctor());
      case '/regre':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/report':
          data argument = args;
          return MaterialPageRoute(builder: (_) => Report(
            bmi: argument.bmi,
            kcal: argument.kcal,
            pro: argument.pro,
            sle: argument.sle,
            wat: argument.wat,
            vitd: argument.vitd,
            carbo: argument.carbo,
            fat: argument.fat,
            iron: argument.iron,
            calcium: argument.calcium,
            diet: argument.diet,
            ));
      default:
        return _errorRoute();

    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}