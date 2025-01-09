import 'package:flutter/material.dart';
import 'package:online_shop/main.dart';
import 'package:online_shop/screens/guest_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اطلاعات کاربری'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: isLogin,
        builder: (context, value, child) {
          if (value) {
            return Center(
                child: Column(
              children: [
                Text('User'),
                ElevatedButton(
                    onPressed: () async {
                      await prefs.remove('token');
                      isLogin.value = false;
                    },
                    child: Text('LogOut'))
              ],
            ));
          } else {
            return GuestScreen();
          }
        },
      ),
    );
  }
}
