// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_project/Model/storemodel.dart';

class StoreProvider extends ChangeNotifier {
  bool loading = true;
  bool isServicable = true;
  int errorCode;
  StoreModel store = StoreModel();

  //* FETCH NEAREST STORES
  Future<StoreModel> fetchStores({latitude, longitude, context}) async {
    loading = true;
    StoreModel result;

    try {
      Map<String, dynamic> body = {
        "latitude": "28.6210",
        "longitude": "77.3812",
        "distance": "20"
      };
      final Uri url =
          Uri.https("pt.frantic.in", "/RestApi/fetch_shops_by_distance");
      var bodyEncoded = body.keys.map((key) => "$key=${body[key]}").join("&");

      final response = await http.post(url, body: bodyEncoded, headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data["error_code"] == 1) {
          store = StoreModel.fromJson(data);
        }
      }
      if (response.statusCode == 404 || response.statusCode == 400) {
        store = StoreModel();
        loading = false;
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }

    return result;
  }
}
