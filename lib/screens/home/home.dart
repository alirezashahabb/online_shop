import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/screens/home/bloc/home_bloc.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/widget/home_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeInitEvent());
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
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeSuccessState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // slider section
                  HomeSlider(
                    homeModel: state.homeModel,
                  ),
                ],
              ),
            );
          } else if (state is HomeErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            throw Exception('state is not support');
          }
        },
      ),
    );
  }
}
