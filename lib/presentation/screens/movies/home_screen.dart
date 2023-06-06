import 'package:cinemapedia/presentation/screens/views/views.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  // Lista de vistas
  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: IndexedStack(
        index: pageIndex < viewRoutes.length ? pageIndex : 0,
        children: viewRoutes,
      ),
      bottomNavigationBar: const CustomBottonNavigation(),
    );
  }
}
