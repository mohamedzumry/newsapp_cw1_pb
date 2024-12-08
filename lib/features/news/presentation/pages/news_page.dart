import 'package:flutter/material.dart';
import 'package:newsapp_cw1_pb/core/domain/entities/news.dart';

class NewsPage extends StatelessWidget {
  final News news;
  const NewsPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Article"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              news.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Image.network(
              news.imageUrl!,
              height: 200,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return const Image(
                  image: AssetImage('assets/images/no-image-placeholder.png'),
                  fit: BoxFit.cover,
                );
              },
            ),
            const SizedBox(height: 10),
            Text(
              news.content,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
