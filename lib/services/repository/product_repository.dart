import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:thurisatest/models/product_detail_model.dart';
import 'package:thurisatest/models/product_model.dart';

class ProductRepository {
  String url = 'https://api.escuelajs.co/api/v1';


  Future<List<ProductModel>> getProducts() async {
    List<ProductModel>? productModel = [];
    http.Response response = await http.get(Uri.parse('$url/products'));

    if (response.statusCode == 200) {
      List responseBody = json.decode(response.body);
      if (responseBody.isNotEmpty) {
        for (var i in responseBody) {
          productModel.add(ProductModel.fromJson(i));
        }
      }
    } else {
      throw Exception('Failed to load data');
    }
    return productModel;
  }

  Future<ProductDetailModel> getProductsDetail(int id) async {
    ProductDetailModel productDetail =ProductDetailModel();
    http.Response response = await http.get(Uri.parse('$url/products/$id'));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody !=null) {
        log(responseBody.toString());
     productDetail= ProductDetailModel.fromJson(responseBody);
      }
    } else {
      throw Exception('Failed to load data');
    }
    return productDetail;
  }


}
