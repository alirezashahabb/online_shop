import 'package:flutter/material.dart';
import 'package:online_shop/screens/basket/basket.dart';
import 'package:online_shop/screens/home/home.dart';
import 'package:online_shop/screens/profile/profil.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

int _selctedIndex = 0;

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: _selctedIndex,
        onTap: (value) {
          setState(() {
            _selctedIndex = value;
            print(value);
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'خانه',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded), label: 'سبد خرید'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: 'پروفایل',
          ),
        ],
      ),
      body: IndexedStack(
        index: _selctedIndex,
        children: screens,
      ),
    );
  }
}

List<Widget> screens = [
  HomeScreen(),
  BasketScreen(),
  ProfileScreen(),
];
