import 'package:flutter/material.dart';

const TextStyle _commonStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
);

const TextStyle _boldStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

class NewsArticlePanel extends StatelessWidget {
  final String imageUrl;
  final String publisher;
  final String whenPublished;
  final String title;

  const NewsArticlePanel({
    super.key,
    required this.imageUrl,
    required this.publisher,
    required this.whenPublished,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: width * 0.305,
          height: height * 0.1,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(publisher, style: _commonStyle),
                  const Text('•', style: _boldStyle),
                  Text(whenPublished, style: _commonStyle),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 2.5)),
              Text(title, style: _boldStyle),
            ],
          ),
        ),
      ],
    );
  }
}
