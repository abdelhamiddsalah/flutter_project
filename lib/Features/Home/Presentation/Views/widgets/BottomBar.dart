import 'package:flutter/material.dart';
import 'package:flutter_project/Core/Constants/Colors.dart';
import 'package:flutter_project/Features/Authentication/Presentation/Views/Profile_view.dart';
import 'package:flutter_project/Features/Home/Presentation/Views/Home_view.dart';
// Import your other views here, for example:
// import 'package:flutter_project/Features/Cart/Presentation/Views/Cart_view.dart';
// import 'package:flutter_project/Features/Search/Presentation/Views/Search_view.dart';
// import 'package:flutter_project/Features/Favorites/Presentation/Views/Favorites_view.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _currentindex = 0;
  void _itemselect(int index) {
    setState(() {
      _currentindex = index;
    });
  }
  final List<Widget> pages = <Widget>[
     HomeView(),
     HomeView(),
     HomeView(),
     HomeView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(_currentindex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _currentindex,
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey,
        onTap: _itemselect,
      ),
    );
  }
}
