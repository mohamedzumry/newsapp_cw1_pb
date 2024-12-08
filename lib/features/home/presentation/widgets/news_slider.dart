import 'package:flutter/material.dart';
import 'package:newsapp_cw1_pb/core/domain/entities/news.dart';
import 'package:go_router/go_router.dart';

class NewsSlider extends StatelessWidget {
  final List<News> news;

  const NewsSlider({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: news.length,
        itemBuilder: (context, index) {
          final article = news[index];
          return GestureDetector(
            onTap: () => context.pushNamed('news', extra: article),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        article.imageUrl!,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            width: double.infinity,
                            fit: BoxFit.cover,
                            'assets/images/no-image-placeholder.png',
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(article.title,
                        maxLines: 1,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
