import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp_cw1_pb/core/presentation/cubit/main_bnb/main_bnb_cubit.dart';
import 'package:newsapp_cw1_pb/core/presentation/cubit/main_bnb/main_bnb_state.dart';
import 'package:newsapp_cw1_pb/features/category/presentation/pages/category_list_page.dart';
import 'package:newsapp_cw1_pb/features/home/presentation/pages/home_page.dart';
import 'package:newsapp_cw1_pb/features/search/presentation/cubit/search_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

final List<BottomNavigationBarItem> navBarItems = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.category),
    label: 'Categories',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: 'Search',
  )
];

// Create a list of objects containing pages and their titles
final List<Map<String, dynamic>> pages = [
  {
    "title": "News App",
    "page": const HomePage(),
  },
  {
    "title": "Categories",
    "page": const CategoryListPage(),
  },
];

TextEditingController _searchController = TextEditingController();

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<MainBnbCubit, MainBnbState>(
          bloc: context.read<MainBnbCubit>(),
          builder: (context, state) {
            if (state is SearchBarState) {
              return state.isSearching
                  ? TextField(
                      controller: _searchController,
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: "Search...",
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontSize: 18),
                    )
                  : Text(pages[state.oldIndex]["title"]);
            } else if (state is MainBnbTabChanged) {
              return Text(pages[state.currentIndex]["title"]);
            }
            return const Text("News App");
          },
        ),
        actions: [
          BlocBuilder<MainBnbCubit, MainBnbState>(
            bloc: context.read<MainBnbCubit>(),
            builder: (context, state) {
              if (state is SearchBarState) {
                return state.isSearching
                    ? Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              context.read<SearchCubit>().search(
                                  _searchController.text, "publishedAt");
                              context.goNamed("search");
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              context
                                  .read<MainBnbCubit>()
                                  .stopSearch(state.oldIndex);
                            },
                          ),
                        ],
                      )
                    : const SizedBox.shrink();
              }
              return Container();
            },
          ),
        ],
      ),
      bottomNavigationBar: BlocBuilder<MainBnbCubit, MainBnbState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is MainBnbTabChanged) {
            currentIndex = state.currentIndex;
          } else if (state is SearchBarState) {
            currentIndex = state.oldIndex;
          }
          return BottomNavigationBar(
            unselectedItemColor: Colors.grey[600],
            selectedItemColor: Colors.amber[800],
            showUnselectedLabels: false,
            showSelectedLabels: true,
            currentIndex: currentIndex,
            items: navBarItems,
            onTap: (index) {
              if (index == 2) {
                context.read<MainBnbCubit>().startSearch(currentIndex);
              } else {
                context.read<MainBnbCubit>().changeTab(index);
              }
            },
          );
        },
      ),
      body: BlocBuilder<MainBnbCubit, MainBnbState>(
        bloc: context.read<MainBnbCubit>(),
        builder: (context, state) {
          if (state is MainBnbTabChanged && state.currentIndex != 2) {
            return pages[state.currentIndex]["page"];
          } else if (state is SearchBarState) {
            return pages[state.oldIndex]["page"];
          }
          return pages[0]["page"]; // Default to HomePage
        },
      ),
    );
  }
}
