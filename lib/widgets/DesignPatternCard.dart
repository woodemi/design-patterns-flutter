import 'package:design_patterns/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'SelectionCard.dart';

class DesignPatternCard extends StatelessWidget {
  final Map<String, dynamic> designPattern;

  const DesignPatternCard({
    @required this.designPattern,
  }) : assert(designPattern != null);

  @override
  Widget build(BuildContext context) {
    var contentHeader = Text(
      designPattern['title'],
      style: Theme.of(context).textTheme.title.copyWith(
            fontSize: 26.0,
          ),
      overflow: TextOverflow.ellipsis,
    );
    var contentText = Text(
      designPattern['description'],
      style: Theme.of(context).textTheme.body1,
      textAlign: TextAlign.justify,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
    var onSelectionCardTap = () => Navigator.pushNamed(
          context,
          designPattern['route'],
          arguments: designPattern,
        );

    return SelectionCard(
      backgroundColor: lightBackgroundColor,
      backgroundHeroTag: "${designPattern['id']}_background",
      contentHeader: contentHeader,
      contentText: contentText,
      onTap: onSelectionCardTap,
    );
  }
}
