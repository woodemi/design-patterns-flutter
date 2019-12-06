import 'package:design_patterns/constants.dart';
import 'package:flutter/material.dart';

class SelectionCard extends StatelessWidget {
  final Color backgroundColor;
  final String backgroundHeroTag;
  final Text contentHeader;
  final Text contentText;
  final VoidCallback onTap;

  final double selectionCardWidth = 400.0;
  final double selectionCardHeight = 240.0;
  final double selectionCardBorderRadius = 10.0;

  const SelectionCard({
    @required this.backgroundColor,
    @required this.backgroundHeroTag,
    @required this.contentHeader,
    @required this.contentText,
    @required this.onTap,
    Key key,
  })  : assert(backgroundColor != null),
        assert(backgroundHeroTag != null),
        assert(contentHeader != null),
        assert(contentText != null),
        super(key: key);

  BorderRadiusGeometry get _selectionCardBorderRadius =>
      BorderRadius.circular(selectionCardBorderRadius);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Material(
          borderRadius: _selectionCardBorderRadius,
          elevation: 8.0,
          child: Hero(
            tag: backgroundHeroTag,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: _selectionCardBorderRadius,
              ),
              width: selectionCardWidth,
              height: selectionCardHeight,
            ),
          ),
        ),
        Material(
          borderRadius: _selectionCardBorderRadius,
          color: Colors.transparent,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.black12,
            borderRadius: _selectionCardBorderRadius,
            child: Container(
              padding: const EdgeInsets.all(paddingL),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  contentHeader,
                  contentText,
                ],
              ),
              width: selectionCardWidth,
              height: selectionCardHeight,
            ),
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
