import '../entities/news.dart';

abstract class NewsRepository {
  Future<List<News>> getTopHeadlines();
  Future<List<News>> getLatestNews();
  Future<List<News>> getNewsByQuery(String query, String sortBy);
  Future<List<News>> getNewsByCategory(String category);
}
