import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformBackButton extends StatelessWidget {
  final Color color;

  const PlatformBackButton({
    @required this.color,
  }) : assert(color != null);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      color: color,
      onPressed: () => Navigator.pop(context),
    );
  }
}
