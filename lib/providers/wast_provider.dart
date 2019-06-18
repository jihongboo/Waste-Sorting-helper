import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:waste_sorting_helper/model/wast_model.dart';
import 'package:dio/dio.dart';
import 'package:waste_sorting_helper/model/wast_search_entity.dart';
import 'package:waste_sorting_helper/model/wast_type_entity.dart';
import 'package:path_provider/path_provider.dart';

class WastProvider with ChangeNotifier {
  List<WastModel> wasts;
  String get searchString => _searchString;
  List<String> get searchKeywords => _searchKeywords;
  WastModel get wastSearch => _wastSearch;

  Dio _dio = Dio();
  String _searchString = "";
  List<String> _searchKeywords = [];
  WastModel _wastSearch;

  set searchString(String value) {
    _searchString = value;
    notifyListeners();

    if (value != "") {
      search(value);
    }
  }

  Future<File> get _localFile async {
    final path = (await getApplicationDocumentsDirectory()).path;
    return File('$path/nameFile.txt');
  }

  WastProvider() {
    wasts = [
      WastModel(WastType.houseHoldFood),
      WastModel(WastType.residual),
      WastModel(WastType.recyclable),
      WastModel(WastType.hazardous)
    ];

    getData();
  }

  getData() async {
    try {
      final data = await readData();
      handelData(data);
    } catch (error) {
      print(error);
    }
    final data = await getCloudData();
    handelData(data);
  }

  search(String keywords) async {
    Response<Map<String, dynamic>> response = await _dio.get(
        "https://sffc.sh-service.com/wx_miniprogram/sites/feiguan/trashTypes_2/Handler/Handler.ashx?a=GET_KEYWORDS&kw=$keywords");
    Map<String, dynamic> data = response.data;
    if (data["kw_list"] != null) {
      List<dynamic> list = data["kw_list"];
      _searchKeywords = list.cast<String>().toList();
      notifyListeners();
    }
  }

  searchWast(String name) async {
    Response<Map<String, dynamic>> response = await _dio.get(
        "https://sffc.sh-service.com/wx_miniprogram/sites/feiguan/trashTypes_2/Handler/Handler.ashx?a=EXC_QUERY&kw=$name");
    Map<String, dynamic> data = response.data;
    var model = WastSearchEntity.fromJson(data);
    _wastSearch = WastModel.fromSearch(model.queryResultType1.trashType);
    notifyListeners();
  }

  clearWastSearch() {
    _wastSearch = null;
    notifyListeners();
  }

  handelData(Map<String, dynamic> data) {
    for (var i = 0; i < WastType.values.length; i++) {
      wasts[i].wasts = [];
      List<dynamic> json = data[(i + 1).toString()];
      json.forEach((e) {
        final wast = Wast.fromJson(e);
        wasts[i].wasts.add(wast);
      });
    }
    notifyListeners();
  }

  saveData(Map<String, dynamic> data) async {
    final file = await _localFile;
    file.writeAsString(json.encode(data));
  }

  Future<Map<String, dynamic>> readData() async {
    final file = await _localFile;
    final jsonString = await file.readAsString();
    return json.decode(jsonString);
  }

  Future<Map<String, dynamic>> getCloudData() async {
    Response<Map<String, dynamic>> response = await _dio.get(
        "https://api.chanjianinc.com/mn/cat_list?ts=1560685658&vv=f33a7c14f66d8972eba982ca82602d16");
    Map<String, dynamic> data = response.data;
    if (data["code"] != 0) {
      return Future.error("code is not 0");
    }
    Map<String, dynamic> jsonData = data["data"];
    saveData(jsonData);
    return jsonData;
  }
}
