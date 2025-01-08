import 'package:flutter/material.dart';
import 'package:online_shop/main.dart';
import 'package:online_shop/screens/guest_screen.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'سبدخرید',
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: isLogin,
        builder: (context, value, child) {
          if (value) {
            return Center(
              child: Text('User'),
            );
          } else {
            return GuestScreen();
          }
        },
      ),
    );
  }
}
