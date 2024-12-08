import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp_cw1_pb/core/domain/entities/news.dart';
import 'package:newsapp_cw1_pb/core/presentation/pages/main_page.dart';
import 'package:newsapp_cw1_pb/features/category/presentation/pages/category_list_page.dart';
import 'package:newsapp_cw1_pb/features/category/presentation/pages/category_page.dart';
import 'package:newsapp_cw1_pb/features/news/presentation/pages/news_page.dart';
import 'package:newsapp_cw1_pb/features/search/presentation/pages/search_page.dart';

class RouterConfiguration {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          name: 'main',
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const MainPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: '/search',
              name: 'search',
              builder: (context, state) {
                return const SearchPage();
              },
            ),
            GoRoute(
              path: '/news',
              name: 'news',
              builder: (context, state) {
                return NewsPage(
                  news: state.extra as News,
                );
              },
            ),
          ]),
      GoRoute(
        path: '/categories',
        name: 'categories',
        builder: (context, state) {
          return const CategoryListPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: ':category',
            name: 'category',
            builder: (context, state) {
              String category = state.pathParameters['category']!;
              return CategoryPage(
                category: category,
              );
            },
          ),
        ],
      ),
    ],
  );
}
