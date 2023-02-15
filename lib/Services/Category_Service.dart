// ignore_for_file: file_names

import 'dart:convert';

import 'package:ecologital_assignment/Models/Cateegory_Model.dart';
import 'package:ecologital_assignment/Services/Http_Service.dart';

class CategoryService {
  static Future<List<CategoryModel>> getAllCategory() async {
    final response = await get('/categories');

    List<CategoryModel> categoryList = [];
    var data = json.decode(response.toString());
    for (var pet in data) {
      var res = CategoryModel.fromJson(pet);
      categoryList.add(res);
    }
    return categoryList;
  }
}
