// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../cubit/main_bnb/main_bnb_cubit.dart';
// import '../cubit/main_bnb/main_bnb_state.dart';

// class MainBNB extends StatelessWidget {
//   final List<BottomNavigationBarItem> items = [
//     const BottomNavigationBarItem(
//       icon: Icon(Icons.home),
//       label: 'Home',
//     ),
//     const BottomNavigationBarItem(
//       icon: Icon(Icons.category),
//       label: 'Categories',
//     ),
//     const BottomNavigationBarItem(
//       icon: Icon(Icons.bookmark),
//       label: 'Saved',
//     ),
//     const BottomNavigationBarItem(
//       icon: Icon(Icons.search),
//       label: 'Search',
//     )
//   ];

//   MainBNB({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MainBnbCubit, MainBnbState>(
//       builder: (context, state) {
//         int currentIndex = 0;
//         if (state is MainBnbTabChanged) {
//           currentIndex = state.currentIndex;
//         } else if (state is SearchState) {
//           currentIndex = 2;
//         }
//         return BottomNavigationBar(
//           unselectedItemColor: Colors.grey[600],
//           selectedItemColor: Colors.amber[800],
//           showUnselectedLabels: false,
//           showSelectedLabels: true,
//           currentIndex: currentIndex,
//           items: items,
//           onTap: (index) {
//             context.read<MainBnbCubit>().changeTab(index);
//             switch (index) {
//               case 3:
//                 context.read<MainBnbCubit>().startSearch();
//                 break;
//               default:
//                 context.read<MainBnbCubit>().stopSearch();
//             }
//           },
//         );
//       },
//     );
//   }
// }
