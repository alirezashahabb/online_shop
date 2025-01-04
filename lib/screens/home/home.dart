import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/them.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/img/Logo.svg',
              width: 40,
              height: 40,
              colorFilter:
                  const ColorFilter.mode(AppColors.kAlert50, BlendMode.srcIn),
            ),
            Text(
              'وسام شاپ',
            ),
          ],
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
