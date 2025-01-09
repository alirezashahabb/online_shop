import 'package:dio/dio.dart';
import 'package:online_shop/main.dart';

Dio httpClient = Dio(
  BaseOptions(
    baseUrl: 'https://flutter.vesam24.com/api/',
  ),
)..interceptors.add(InterceptorsWrapper(
    onError: (error, handler) {},
    onRequest: (options, handler) {
      String? userToke = prefs.getString('token');
      print('user toke $userToke');
      if (userToke != null && isLogin.value) {
        options.headers['Authorization'] = 'Bearer $userToke';
      }
      handler.next(options);
    },
  ));
