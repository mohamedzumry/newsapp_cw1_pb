import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_cw1_pb/features/home/presentation/bloc/latest_news/latest_news_bloc.dart';
import '../../../../core/presentation/widgets/news_list.dart';

class LatestNewsWidget extends StatefulWidget {
  const LatestNewsWidget({super.key});

  @override
  State<LatestNewsWidget> createState() => _LatestNewsWidgetState();
}

class _LatestNewsWidgetState extends State<LatestNewsWidget> {
  @override
  void initState() {
    super.initState();
    context.read<LatestNewsBloc>().add(const LoadLatestNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatestNewsBloc, LatestNewsState>(
      builder: (context, state) {
        if (state is LatestNewsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LatestNewsLoadedState) {
          return Expanded(child: NewsList(news: state.latestNews));
        } else if (state is LatestNewsError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
