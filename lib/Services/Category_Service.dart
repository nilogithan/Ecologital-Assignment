// ignore_for_file: file_names, use_rethrow_when_possible

import 'dart:convert';

import 'package:ecologital_assignment/Models/Cateegory_Model.dart';
import 'package:ecologital_assignment/Services/Http_Service.dart';
import 'package:flutter/material.dart';

class CategoryService {
  static Future<List<CategoryModel>> getAllCategory() async {
    try {
      final response = await get('/categories');

      List<CategoryModel> categoryList = [];
      var data = json.decode(response.toString());
      for (var item in data) {
        var res = CategoryModel.fromJson(item);
        categoryList.add(res);
      }
      return categoryList;
    } catch (ex) {
      debugPrint(ex.toString());
      throw ex;
    }
  }
}
