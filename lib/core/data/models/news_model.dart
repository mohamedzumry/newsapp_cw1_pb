import 'package:newsapp_cw1_pb/core/domain/entities/news.dart';

class NewsModel extends News {
  const NewsModel({
    required super.title,
    required super.imageUrl,
    required super.description,
    required super.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? 'No Title',
      imageUrl: json['urlToImage'] ?? '',
      description: json['description'] ?? 'No Description',
      content: json['content'] ?? 'No Content Found',
    );
  }
}
