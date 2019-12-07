import 'package:design_patterns/pages/CategoryPage.dart';
import 'package:design_patterns/pages/DesignPatternDetails.dart';
import 'package:design_patterns/pages/MainMenu.dart';
import 'package:design_patterns/pages/patterns/singleton/SingletonExample.dart';
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
    case '/singleton':
      return _buildDesignPatternDetailsPageRoute(
        settings,
        SingletonExample(),
      );
    case '/':
    default:
      return MaterialPageRoute(builder: (_) => MainMenu());
  }
}

Route _buildDesignPatternDetailsPageRoute(RouteSettings settings,
    Widget example,) {
  return MaterialPageRoute(
    builder: (_) =>
        DesignPatternDetails(
          designPattern: settings.arguments,
          example: example,
        ),
  );
}