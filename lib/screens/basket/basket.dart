import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/main.dart';
import 'package:online_shop/screens/basket/bloc/basket_bloc.dart';
import 'package:online_shop/screens/guest_screen.dart';
import 'package:online_shop/utils/snack_bar.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
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
            return BlocConsumer<BasketBloc, BasketState>(
              listener: (context, state) {
                if (state is BasketSuccessState) {
                  return showCustomAlert(
                    context,
                    'محصول با موفقیت به سبد خرید اضافه شد',
                  );
                }
              },
              builder: (context, state) {
                return Center(
                  child: Text('User'),
                );
              },
            );
          } else {
            return GuestScreen();
          }
        },
      ),
    );
  }
}
