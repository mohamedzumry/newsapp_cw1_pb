import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_cw1_pb/features/home/presentation/bloc/top_headlines/top_headlines_bloc.dart';
import 'news_slider.dart';

class TopHeadlinesWidget extends StatefulWidget {
  const TopHeadlinesWidget({super.key});

  @override
  State<TopHeadlinesWidget> createState() => _TopHeadlinesWidgetState();
}

class _TopHeadlinesWidgetState extends State<TopHeadlinesWidget> {
  @override
  void initState() {
    super.initState();
    context.read<TopHeadlinesBloc>().add(const LoadTopHeadlinesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopHeadlinesBloc, TopHeadlinesState>(
      builder: (context, state) {
        if (state is TopHeadlinesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TopHeadlinesLoadedState) {
          return NewsSlider(news: state.topHeadlines);
        } else if (state is TopHeadlinesError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
