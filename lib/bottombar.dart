import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.search,), label: 'Search',),
          BottomNavigationBarItem(icon: Icon(Icons.library_books,), label: 'My Library',),
        ],
        elevation: 0,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: colorTheme.onPrimary,
        unselectedItemColor: colorTheme.onPrimary.withOpacity(0.5), //Colors.grey,
        onTap: (index) {},
      ),
    );
  }
}