import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_cw1_pb/core/presentation/cubit/main_bnb/main_bnb_cubit.dart';
import 'package:newsapp_cw1_pb/core/routes.dart';
import 'package:newsapp_cw1_pb/features/category/presentation/bloc/category_bloc.dart';
import 'package:newsapp_cw1_pb/features/home/presentation/bloc/latest_news/latest_news_bloc.dart';
import 'package:newsapp_cw1_pb/features/home/presentation/bloc/top_headlines/top_headlines_bloc.dart';
import 'package:newsapp_cw1_pb/features/search/presentation/cubit/search_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LatestNewsBloc()),
        BlocProvider(create: (context) => TopHeadlinesBloc()),
        BlocProvider(create: (context) => MainBnbCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => CategoryBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: RouterConfiguration().router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary: Colors.indigo,
            secondary: Colors.blueAccent,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 3,
          ),
        ),
      ),
    );
  }
}
