import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:internship_task_3/consts/api_const.dart';
import 'package:internship_task_3/models/products_model.dart';

class APIHnadler {
  static Future<List<ProductsModel>> getAllProducts() async {
    var uri = Uri.https(BASE_URL, "/api/v1/products");
    var response = await http.get(uri);

    var data = jsonDecode(response.body);
    List tempList = [];
    for (var i in data) {
      tempList.add(i);
    }
    return ProductsModel.productsFromSnapshot(tempList);
  }
}
