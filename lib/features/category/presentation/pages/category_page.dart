import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_cw1_pb/core/presentation/widgets/news_list.dart';
import 'package:newsapp_cw1_pb/features/category/presentation/bloc/category_bloc.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  const CategoryPage({super.key, required this.category});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(LoadNewsByCategory(widget.category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<CategoryBloc, CategoryState>(
          bloc: context.read<CategoryBloc>(),
          builder: (context, state) {
            if (state is CategoryPageLoadingState) {
              return const Text("Loading...");
            } else if (state is CategoryPageLoadedState) {
              return Text("Results for: ${state.category} Category");
            } else if (state is CategoryPageLoadingErrorState) {
              return Text(state.message);
            } else {
              return const Text("Some error occurred !!!");
            }
          },
        ),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryPageLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoryPageLoadedState) {
            return NewsList(news: state.news);
          } else if (state is CategoryPageLoadingErrorState) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text("Some error occurred !!!"));
          }
        },
      ),
    );
  }
}
