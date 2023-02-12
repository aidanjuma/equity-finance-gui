import './news_article.dart';

/* Child Class: GoogleNews (for news sourced from Google Finance) */
class GoogleNewsArticle extends NewsArticle {
  // Returns time since published; i.e. 12 hours ago.
  final String whenPublished;

  // The URL for the thumbnail...
  final String thumbnailUrl;

  GoogleNewsArticle({
    required super.link,
    required super.publisher,
    required super.title,
    required this.thumbnailUrl,
    required this.whenPublished,
  });
}
