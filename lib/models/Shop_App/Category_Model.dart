// // ignore_for_file: file_names

// class CategoriesModel {
//   bool? status;
//   DataCategoriesModel? data;
//   CategoriesModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = DataCategoriesModel.fromJson(json['data']);
//   }
// }

// class DataCategoriesModel {
//   late List<DataModelcat> categories = [];

//   DataCategoriesModel.fromJson(Map<String, dynamic> json)
//   {
//     json['data'].forEach((element) {
//       categories.add(DataModelcat.fromJson(element));
//     });
//   }
// }

// class DataModelcat {
//   int? id;
//   String? name;
//   String? image;

//   DataModelcat.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//   }
// }
// 

// ignore_for_file: unnecessary_new, use_function_type_syntax_for_parameters, unused_field, prefer_final_fields, unused_import, file_names

import 'package:market/models/Shop_App/Home_Model.dart';

class CateogriesModel {
  bool? status;
  CatogryDataModel? data;
  CateogriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new CatogryDataModel.fromJson(json['data']) : null;
  }
}
class CatogryDataModel {
  int? _currentPage;
  List<DataCategoryModel>? data=[];
  CatogryDataModel.fromJson(Map<String, dynamic> json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data!.add(new DataCategoryModel.fromJson(v));});}}}
class DataCategoryModel {
  int? id;
  String? name;
  String? image;

  DataCategoryModel.fromJson(Map<String, dynamic> json) {
  id = json['id'];
    name = json['name'];
    image = json['image'];
  }

}
