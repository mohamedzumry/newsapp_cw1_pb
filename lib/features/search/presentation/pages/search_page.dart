import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp_cw1_pb/core/presentation/widgets/news_list.dart';
import 'package:newsapp_cw1_pb/features/search/presentation/cubit/search_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final sortingOptions = ["publishedAt", "relevancy", "popularity"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<SearchCubit, SearchState>(
          bloc: context.read<SearchCubit>(),
          builder: (context, state) {
            if (state is SearchLoading) {
              return const Text("Loading...");
            } else if (state is SearchLoaded) {
              return Text("Results for: ${state.query}");
            } else {
              return const Text("Some error occurred !!!");
            }
          },
        ),
        actions: [
          // Implement sorting bar with sorting options
          BlocBuilder<SearchCubit, SearchState>(
            bloc: context.read<SearchCubit>(),
            builder: (context, state) {
              if (state is SearchLoaded) {
                return IconButton(
                  icon: const Icon(Icons.sort),
                  onPressed: () {
                    showSortDialog(state.query);
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchLoaded) {
            return NewsList(news: state.news);
          } else {
            return const Center(child: Text("Some error occurred !!!"));
          }
        },
      ),
    );
  }

  void showSortDialog(String query) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Sort by:"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                for (String option in sortingOptions)
                  ListTile(
                      title: Text(option),
                      onTap: () {
                        context.read<SearchCubit>().search(
                              query,
                              option,
                            );
                        context.pop();
                      })
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
