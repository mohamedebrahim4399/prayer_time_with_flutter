import 'package:dio/dio.dart';
import 'package:flutter_prayer/constants/network_constants.dart';

class DioHelper {
  static Dio? dio;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: url,
        receiveDataWhenStatusError: true,

      ),
    );
  }


  Future<Map<String,dynamic>> getPrayerTime(
      {required Map<String,dynamic> query, required String endPoint}) async {
    try {
      Response response =
          await dio!.get(endPoint, queryParameters: query);
      print(response.realUri);
      return response.data;
    } catch (e) {
      return {};
    }
  }
}

