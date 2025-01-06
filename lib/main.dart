import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:online_shop/data/services/home_service.dart';
import 'package:online_shop/data/services/product_service.dart';
import 'package:online_shop/screens/home/bloc/home_bloc.dart';
import 'package:online_shop/screens/product/PopularBloc/popular_bloc_bloc.dart';
import 'package:online_shop/screens/product/latestbloc/product_bloc.dart';
import 'package:online_shop/screens/productDetail/bloc/prodcut_detail_bloc.dart';
import 'package:online_shop/screens/root/root.dart';
import 'package:online_shop/them.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => HomeBloc(
          HomeService(),
        ),
      ),
      BlocProvider(
        create: (context) => ProductLatestBloc(
          ProductService(),
        ),
      ),
      BlocProvider(
        create: (context) => PopularBloc(
          ProductService(),
        ),
      ),
      BlocProvider(
        create: (context) => ProductDetailBloc(
          ProductService(),
        ),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa'), // farsi
        // Spanish
      ],
      title: 'online_shop',
      theme: lightThemeData(),
      home: const RootScreen(),
    );
  }
}
