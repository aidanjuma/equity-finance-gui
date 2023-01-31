import 'package:flutter/material.dart';

// TODO: Complete this UI element.
class NewsArticlePanel extends StatelessWidget {
  final double width;
  final double height;
  static const TextStyle _commonStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  const NewsArticlePanel({
    required this.width,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: width * 0.305,
          height: height * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: const <Widget>[
                  Text("The Times ", style: _commonStyle),
                  Text(
                    "•",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(" 6 hrs ago", style: _commonStyle),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
