import 'dart:io';
import 'package:bloc_cubit_project/core/config/dio_catch_config.dart';
import 'package:bloc_cubit_project/core/config/dio_config.dart';
import 'package:bloc_cubit_project/core/constant/base_url.dart';
import 'package:bloc_cubit_project/data/model/get_users_model.dart';
import 'package:dio/dio.dart';

class UsersService {
  static Future<dynamic> getUsers() async {
    try {
      Response res = await DioConfig.createRequest().get(BaseUrls.apiUrl);
      if (res.statusCode == HttpStatus.ok) {
        var resData =
            (res.data as List).map((e) => UsersModel.fromJson(e)).toList();
        return resData;
      } else {
        return res.statusMessage.toString();
      }
    } on DioError catch (e) {
      DioCatchConfig.catchError(e);
    }
  }
}
