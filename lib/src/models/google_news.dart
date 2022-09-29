import './news.dart';

/* Child Class: GoogleNews (for news sourced from Google Finance) */
class GoogleNews extends News {
  // Returns time since published; i.e. 12 hours ago.
  final String whenPublished;

  // The URL for the thumbnail...
  final String thumbnailUrl;

  GoogleNews(
      {required super.link,
      required super.sourceName,
      required super.title,
      required this.thumbnailUrl,
      required this.whenPublished});
}
