// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:ecologital_assignment/common/Http_Code_Enum.dart';
import 'package:http/http.dart' as http;

getHeader()  {
  var headers = {
    'Content-Type': 'application/json',
    'api-key': "i8kT9PKntPeaett3fixaBKjLItTMUeML5FcgyKTrxs4MJojCgOxxs3ROkJAEqXXL",
  };
  
  return headers;
}

var BaseUrl = "https://data.mongodb-api.com/app/data-kdspl/endpoint";

post(String url, Map data) async {
  final postUrlWithParam = await http.post(Uri.parse(BaseUrl + url), body: json.encode(data), headers:  getHeader());
  if(postUrlWithParam.statusCode == HttpCodeEnum.Ok.status){
     return postUrlWithParam;
  }
}

get(String url) async {
  final getUrlWithParam = await http.get(Uri.parse(BaseUrl + url), headers:  getHeader());
  if(getUrlWithParam.statusCode == HttpCodeEnum.Ok.status){
     return getUrlWithParam.body;
  }
 
}