// ignore_for_file: file_names

import 'package:ecologital_assignment/Services/Storage_Service.dart';

class Common{

  static Future<void> setBasket(String data) async {
    await StorageService.saveToPreferences("BASKET", data);
  }

  static Future<String> getBasket() async {
    final String token = await StorageService.getFromPreferences("BASKET");
    return token;
  }

  static Future<void> removeBasket() async {
    await StorageService.removePreferences("BASKET");
  }
}