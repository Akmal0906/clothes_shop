import 'dart:convert';

import 'package:clothes_shop/domain/models/all_products/all_product_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import '../../utils/resource/data_state.dart';

class FetchData {
  final dio = Dio();
  static const String allProducts = 'https://fakestoreapi.com/products';
  static const String firstCateUrl =
      'https://fakestoreapi.com/products/category/jewelery';
  static const String cateUrl = 'https://fakestoreapi.com/products/categories';
  static const String baseUrl = 'https://fakestoreapi.com/products/category/';

  Future<DataState> fetchItemModel(String str) async {
    List<AllProductModel> res = [];
    try {
      final response =
          await dio.get(str.isEmpty ? allProducts : '$baseUrl$str');
      print(response.statusCode);
      if (response.statusCode == 200) {
        final List json1;
        json1 = response.data;

        res = json1.map((e) => AllProductModel.fromJson(e)).toList();

        return DataSuccess(res);
      } else {
        throw DioException(
            requestOptions: response.requestOptions, response: response);
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  Future<DataState> fetchCateName() async {
    try {
      final response = await dio.get(cateUrl);
      print(response.statusCode);
      if (response.statusCode==200) {
         List json1=[];
         if(response.data[0] is String){
           print(true);
         }
       
        json1 = response.data;
        print(json1);
        return DataSuccess(json1);
      } else {
        print('ERRONG');
        return DataError(response.data.toString());
      }
    } catch (e,s) {
      print('catch ishlavotti');
      print('e=$e, s=$s');
      return DataError(e.toString());
    }
  }
}
