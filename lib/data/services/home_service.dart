import 'package:dio/dio.dart';
import 'package:online_shop/data/model/homw_model.dart';
import 'package:online_shop/utils/http_clinet.dart';

class HomeService {
  Future<HomeModel> getGeneralInfo() async {
    Response response = await httpClient.get('home');
    return HomeModel.fromJson(response.data);
  }
}