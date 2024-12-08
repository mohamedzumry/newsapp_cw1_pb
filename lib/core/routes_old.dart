// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:newsapp_cw1_pb/features/category/presentation/pages/category_list_page.dart';
// import 'package:newsapp_cw1_pb/features/category/presentation/pages/category_page.dart';
// import 'package:newsapp_cw1_pb/features/home/presentation/pages/home_page.dart';
// import 'package:newsapp_cw1_pb/features/news/presentation/pages/news_page.dart';
// import 'package:newsapp_cw1_pb/features/search/presentation/pages/search_page.dart';

// class RouterConfiguration {
//   final GoRouter router = GoRouter(
//     routes: <RouteBase>[
//       GoRoute(
//         name: 'home',
//         path: '/',
//         builder: (BuildContext context, GoRouterState state) {
//           return const HomePage(
//             title: "News App",
//           );
//         },
//       ),
//       GoRoute(
//         path: 'search/:query',
//         name: 'search',
//         builder: (context, state) {
//           String query = state.pathParameters['query']!;
//           return SearchPage(
//             title: "Results for $query",
//           );
//         },
//       ),
//       GoRoute(
//         path: '/saved',
//         name: 'saved',
//         builder: (context, state) {
//           return const SearchPage(
//             title: "Saved Articles",
//           );
//         },
//       ),
//       GoRoute(
//           path: '/categories',
//           name: 'categories',
//           builder: (context, state) {
//             return const CategoryListPage(
//               title: "All Categories",
//             );
//           },
//           routes: <RouteBase>[
//             GoRoute(
//               path: ':category',
//               name: 'category',
//               builder: (context, state) {
//                 String category = state.pathParameters['category']!;
//                 return CategoryPage(
//                   title: "Category: $category",
//                   category: category,
//                 );
//               },
//               routes: <RouteBase>[
//                 GoRoute(
//                   path: ':news',
//                   name: 'newsSingle',
//                   builder: (context, state) {
//                     return const NewsPage();
//                   },
//                 ),
//               ],
//             ),
//           ]),
//     ],
//   );
// }
