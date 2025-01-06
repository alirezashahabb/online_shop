import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/screens/product/bloc/product_bloc.dart';
import 'package:online_shop/them.dart';

class LatestProductScreen extends StatefulWidget {
  const LatestProductScreen({super.key});

  @override
  State<LatestProductScreen> createState() => _LatestProductScreenState();
}

class _LatestProductScreenState extends State<LatestProductScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(
      ProductLatestInitEvent(),
    );
    super.initState();
  }

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
              colorFilter: const ColorFilter.mode(
                  AppColors.kPrimary500, BlendMode.srcIn),
            ),
            Text(
              'وسام شاپ',
            ),
          ],
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return Container(
            color: Colors.white,
          );
        },
      ),
    );
  }
}
