import 'package:design_patterns/data/data.dart';
import 'package:design_patterns/widgets/SelectionCard.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: MainMenuCard(category: categories[0]),
      ),
    );
  }
}

class MainMenuCard extends StatelessWidget {
  final Map<String, dynamic> category;

  MainMenuCard({this.category});

  @override
  Widget build(BuildContext context) {
    var contentHeader = Text(
      category['title'],
      style: Theme.of(context).textTheme.title.copyWith(
            fontSize: 26.0,
            color: Colors.white,
          ),
    );

    List patterns = category['patterns'];
    var contentText = Text(
      patterns.length > 1
          ? '${patterns.length} pattens'
          : '${patterns.length} patten',
      style: Theme.of(context).textTheme.title.copyWith(
            color: Colors.white,
          ),
    );

    return SelectionCard(
      backgroundColor: Color(int.parse(category['color'])),
      backgroundHeroTag: "${category['id']}_background",
      contentHeader: contentHeader,
      contentText: contentText,
    );
  }
}
