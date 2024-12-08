import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp_cw1_pb/core/constants.dart';
import '../../domain/entities/news.dart';
import '../../domain/repositories/news_repository.dart';
import '../models/news_model.dart';

class NewsRepositoryImpl implements NewsRepository {
  @override
  Future<List<News>> getTopHeadlines() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&pageSize=10&apiKey=$newsAPIKey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['articles'] as List)
          .map((article) => NewsModel.fromJson(article))
          .toList();
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  @override
  Future<List<News>> getLatestNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?domains=bbc.com&pageSize=20&language=en&sortBy=publishedAt&apiKey=$newsAPIKey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['articles'] as List)
          .map((article) => NewsModel.fromJson(article))
          .toList();
    } else {
      throw Exception('Failed to load latest news');
    }
  }

  @override
  Future<List<News>> getNewsByQuery(String query, String sortBy) async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q="$query"&pageSize=20&language=en&sortBy=$sortBy&apiKey=$newsAPIKey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['articles'] as List)
          .map((article) => NewsModel.fromJson(article))
          .toList();
    } else {
      throw Exception('Failed to load news by query');
    }
  }

  @override
  Future<List<News>> getNewsByCategory(String category) async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=$category&country=us&pageSize=20&apiKey=$newsAPIKey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['articles'] as List)
          .map((article) => NewsModel.fromJson(article))
          .toList();
    } else {
      throw Exception('Failed to load news by category');
    }
  }
}
