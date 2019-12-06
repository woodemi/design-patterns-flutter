import 'package:design_patterns/pages/CategoryPage.dart';
import 'package:design_patterns/pages/MainMenu.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design Patterns App',
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/category':
      return MaterialPageRoute(
        builder: (_) => CategoryPage(
          category: settings.arguments,
        ),
      );
      break;
    case '/':
    default:
      return MaterialPageRoute(builder: (_) => MainMenu());
  }
}
