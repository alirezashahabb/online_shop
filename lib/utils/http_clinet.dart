import 'package:dio/dio.dart';

Dio httpClient = Dio(
  BaseOptions(
    baseUrl: 'https://flutter.vesam24.com/api/',
  ),
);
