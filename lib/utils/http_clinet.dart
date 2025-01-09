import 'package:cherry_toast/cherry_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/main.dart';
import 'package:online_shop/screens/auth/auth_scren.dart';
import 'package:online_shop/utils/navigator.dart';

Dio httpClient = Dio(
  BaseOptions(
    baseUrl: 'https://flutter.vesam24.com/api/',
  ),
)..interceptors.add(InterceptorsWrapper(
    onError: (error, handler) async {
      // set GuestUser if token is expire
      if (error.response!.statusCode == 401) {
        await prefs.remove('token');
        isLogin.value = false;
        goScreen(
            context: navigatorKey.currentContext!,
            screen: AuthScreen(),
            fullScreen: true);
      } else if (error.response?.data['errors']) {
        var e = error.response?.data['errors'] as Map<String, dynamic>;
        if (e.isNotEmpty) {
          CherryToast.error(
            toastDuration: Duration(seconds: 2),
            title: Text(
              e.values.first[0].toString(),
              style:
                  Theme.of(navigatorKey.currentContext!).textTheme.bodyMedium,
            ),
          ).show(navigatorKey.currentContext!);
        }
      } else {
        CherryToast.error(
          toastDuration: Duration(seconds: 2),
          title: Text(
            'خطا نا شناس',
            style: Theme.of(navigatorKey.currentContext!).textTheme.bodyMedium,
          ),
        ).show(navigatorKey.currentContext!);
      }
      throw Exception('');
    },
    onRequest: (options, handler) {
      String? userToke = prefs.getString('token');

      if (userToke != null && isLogin.value) {
        options.headers['Authorization'] = 'Bearer $userToke';
      }
      handler.next(options);
    },
  ));
