import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottonNavigation extends StatelessWidget {
  const CustomBottonNavigation({super.key});

  static int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;

    const locations = {
      '/home/0': 0,
      '/home/1': 1,
      '/home/2': 2,
    };

    return locations[location] ?? 0;

    // switch (location) {
    //   case '/':
    //     return 0;
    //   case '/categories':
    //     return 1;
    //   case '/favorites':
    //     return 2;
    //   default:
    //     return 0;
    // }
  }

  void onItemTapped(BuildContext context, int index) {
    const idexes = {
      0: '/home/0',
      1: '/home/0',
      2: '/home/2',
    };

    context.go(idexes[index] ?? '/');

    // switch (index) {
    //   case 0:
    //     context.go('/');
    //     break;
    //   case 1:
    //     context.go('/');
    //     break;
    //   case 2:
    //     context.go('/favorites');
    //     break;
    //   default:
    //     context.go('/');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: getCurrentIndex(context),
      onTap: (index) => onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorias',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
        ),
      ],
    );
  }
}
