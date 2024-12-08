import 'package:flutter/material.dart';
import 'package:newsapp_cw1_pb/features/home/presentation/widgets/latest_news.dart';
import 'package:newsapp_cw1_pb/features/home/presentation/widgets/top_headlines.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopHeadlinesWidget(),
          Divider(),
          SizedBox(height: 8),
          Text(
            'Latest News',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          LatestNewsWidget(),
        ],
      ),
    );
  }
}
