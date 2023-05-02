import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const TextStyle _commonStyle = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w500,
);

const TextStyle _boldStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w700,
);

class NewsArticlePanel extends StatelessWidget {
  final String link;
  final String imageUrl;
  final String publisher;
  final String whenPublished;
  final String title;

  const NewsArticlePanel({
    super.key,
    required this.link,
    required this.imageUrl,
    required this.publisher,
    required this.whenPublished,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => _launchUrl(Uri.parse(link)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.01),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: width * 0.285,
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
                      const Text(' • ', style: _boldStyle),
                      Text(whenPublished, style: _commonStyle),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 2.5)),
                  SizedBox(
                    width: width * 0.475,
                    child: Text(
                      title,
                      style: _boldStyle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch: "$url"');
    }
  }
}
