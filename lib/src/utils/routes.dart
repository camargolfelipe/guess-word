import 'package:flutter/material.dart';
import 'package:guessWord/src/pages/home.dart';
import 'package:guessWord/src/pages/login.dart';
import '../pages/ranking.dart';

final appRoutes = {
  '/': (context) => LoginPage(),
  '/home': (context) => HomePage(),
  '/ranking': (context) => RankingPage(),
};

//FUNCTIONS
class Routes {
  simple(context, String route) {
    return Navigator.pushNamed(context, route);
  }

  constructed(context, Widget route) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );
  }
}
