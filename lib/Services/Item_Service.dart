// ignore_for_file: file_names, use_rethrow_when_possible

import 'dart:convert';

import 'package:ecologital_assignment/Models/Item_Model.dart';
import 'package:ecologital_assignment/Services/Http_Service.dart';
import 'package:flutter/material.dart';

class ItemService {
  static Future<List<ItemModel>> getAllItems(int? pageNo,
      {String categoryId = ""}) async {
    try {
      String url =
          "/items${pageNo != null ? "?page=$pageNo" : ""}${categoryId != "" ? "&category_id=$categoryId" : ""}";
      final response = await get(url);

      List<ItemModel> itemList = [];
      var data = json.decode(response.toString());
      for (var pet in data) {
        var res = ItemModel.fromJson(pet);
        itemList.add(res);
      }
      return itemList;
    } catch (ex) {
      debugPrint(ex.toString());
      throw ex;
    }
  }
}
