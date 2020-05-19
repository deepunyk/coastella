import 'package:coastella/screens/accountMainScreen.dart';
import 'package:coastella/screens/orderListMainScreen.dart';
import 'package:coastella/screens/shopListMainScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {

  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  final List<Widget> _pages = [OrderListMainScreen(), ShopListMainScreen(),AccountMainScreen()];

  void _selectPage(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffff3f3),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.history, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color(0xfffff3f3),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          _selectPage(index);
        },
      ),
      body: _pages[_selectedIndex],
    );
  }
}
