import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavBar extends StatelessWidget {
  const MainNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BottomNavigationBar(
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurface.withOpacity(.5),
      showUnselectedLabels: true,
      unselectedFontSize: 14,
      selectedLabelStyle: textTheme.bodySmall,
      unselectedLabelStyle: textTheme.bodySmall,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
  switch (index) {
    case 0:
      context.pushNamed('home');  // Navigate to Home
      break;
    case 1:
      context.pushNamed('post');  // Navigate to Post page
      break;
    case 2:
      context.pushNamed('cart');  // Navigate to Cart
      break;
    case 3:
      context.pushNamed('user-account');  // Navigate to User Account
      break;
    default:
  }
},
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Post',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
    );
  }
}
