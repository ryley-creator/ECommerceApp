// import 'package:ecommerce/pages/bottom_pages/pages.dart';
// import 'package:flutter/material.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});
//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int currentIndex = 0;
//   final List<Widget> pages = [
//     HomePage(),
//     WishlistPage(),
//     CartPage(),
//     SearchPage(),
//     SettingsPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(index: currentIndex, children: pages),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         currentIndex: currentIndex,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.black,
//         showSelectedLabels: true,
//         onTap: (value) {
//           setState(() {
//             currentIndex = value;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             activeIcon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_border),
//             activeIcon: Icon(Icons.favorite),
//             label: 'Favorite',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart_outlined),
//             activeIcon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search_outlined),
//             activeIcon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings_outlined),
//             activeIcon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:ecommerce/pages/bottom_pages/pages.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, this.currentIndex = 0});
  final int currentIndex;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  final List<Widget> pages = [
    HomePage(),
    WishlistPage(),
    CartPage(),
    SearchPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
