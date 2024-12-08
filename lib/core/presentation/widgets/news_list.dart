import 'package:flutter/material.dart';
import 'package:newsapp_cw1_pb/core/domain/entities/news.dart';
import 'package:go_router/go_router.dart';

class NewsList extends StatelessWidget {
  final List<News> news;

  const NewsList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        final article = news[index];
        return ListTile(
          onTap: () => context.pushNamed('news', extra: article),
          leading: Image.network(
            article.imageUrl!,
            width: 100,
            height: 150,
            // width: double.infinity,
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) {
              return const Image(
                image: AssetImage('assets/images/no-image-placeholder.png'),
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              );
            },
          ),
          title: Text(
            article.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(article.description,
              maxLines: 2, overflow: TextOverflow.ellipsis),
        );
      },
    );
  }
}
