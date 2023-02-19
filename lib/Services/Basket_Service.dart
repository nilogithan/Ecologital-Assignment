// ignore_for_file: use_rethrow_when_possible, file_names

import 'dart:convert';

import 'package:ecologital_assignment/Models/Place_Order_Model.dart';
import 'package:ecologital_assignment/Services/Http_Service.dart';
import 'package:flutter/material.dart';

class BasketService {
  static Future<PlaceOrderModel> placeOrder() async {
    try {
      var obj = {"id": "something"};
      final response = await post('/placeorder',obj);
      var data = json.decode(response.body.toString());
       var res = PlaceOrderModel.fromJson(data);
      debugPrint(res.toString());
      return res;
    } catch (ex) {
      debugPrint(ex.toString());
      throw ex;
    }
  }
}
