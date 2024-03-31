import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:internship_task_3/consts/api_const.dart';
import 'package:internship_task_3/models/categories_model.dart';
import 'package:internship_task_3/models/products_model.dart';

class APIHnadler {
  static Future<List<dynamic>> getData({required String target}) async {
    var uri = Uri.https(BASE_URL, "/api/v1/$target");
    var response = await http.get(uri);

    var data = jsonDecode(response.body);
    List tempList = [];
    for (var i in data) {
      tempList.add(i);
    }
    return tempList;
  }

  static Future<List<ProductsModel>> getAllProducts() async {
    List temp = await getData(target: "products");
    return ProductsModel.productsFromSnapshot(temp);
  }

  static Future<List<CategoriesModel>> getAllCategories() async {
    List temp = await getData(target: "categories");
    return CategoriesModel.categoriesFromSnapshot(temp);
  }
}
