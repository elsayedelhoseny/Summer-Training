import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/category_model.dart';
import 'package:dio/dio.dart';

import 'dart:convert';
import 'dart:ffi';

class CategoryProvider with ChangeNotifier {
  categories? category;
  String? token;
  Future<dynamic> getAllData() async {
    var dio = Dio();
    dio.options.headers = {
      "lang": "en",
      "Content-Type": "application/json",
      "Authorization": token,
    };

    final response =
        await dio.get("https://student.valuxapps.com/api/categories");
    category = categories.fromJson(response.data);
    notifyListeners();
  }
}
