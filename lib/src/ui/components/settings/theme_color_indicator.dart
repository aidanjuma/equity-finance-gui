import 'package:flutter/material.dart';
// Local
import 'package:equity/src/types/appearance.dart';

class ThemeColorIndicator extends StatelessWidget {
  final double width;
  final double height;
  final Appearance colorMode;

  const ThemeColorIndicator({
    super.key,
    this.width = 48,
    this.height = 48,
    this.colorMode = Appearance.dark,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorMode == Appearance.dark
              ? const Color(0xff1c2128)
              : const Color(0xffffffff),
          borderRadius: BorderRadius.circular(9999),
        ),
      ),
    );
  }
}
