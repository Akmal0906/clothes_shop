import 'dart:convert';

import 'package:clothes_shop/domain/models/all_products/all_product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LcalDatabases{
 saveData(AllProductModel allProductModel)async{

   final List<String>list=List.from([jsonEncode(allProductModel.toJson())]);
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   List<String> list1= prefs.getStringList('item')??[];
   for (var element in list) {list1.add(element);}
   prefs.setStringList('item', list1);
 }

 getData()async{
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   final String musicsString = await prefs.getString('model')??'';
//     List<AllProductModel> list =AllProductModel.decode(musicsString);
//
// print(list.first.title);
 }

 Future<List<AllProductModel>> getTasks() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
final List<String> list= prefs.getStringList('item')??<String>[];
if(list.isNotEmpty){
List<AllProductModel>listAll=list.map((e) => AllProductModel.fromJson(jsonDecode(e))).toList();
print('LIST== $listAll');

return listAll;
}else{
  return <AllProductModel>[];
}
 }

 void clearTask() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.clear();
 }
}