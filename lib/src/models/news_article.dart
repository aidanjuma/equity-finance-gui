/* Base Class: NewsArticle */
class NewsArticle {
  // Link (URL) to the news page; i.e. https://bbc.co.uk/news/...
  final String link;

  // Name of the source where the news came from, i.e. BBC.
  final String publisher;

  // Title of the news article, i.e. 'GBP drops 1.2% since yesterday'.
  final String title;

  NewsArticle({
    required this.link,
    required this.publisher,
    required this.title,
  });
}
