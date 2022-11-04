// ignore_for_file: file_names, empty_constructor_bodies, non_constant_identifier_names, unnecessary_question_mark, null_check_always_fails, curly_braces_in_flow_control_structures

class HomeModel {
  bool? status;
  String? message;
  DataModel? data;
  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = DataModel.fromJson(json['data']);
  }
}
class DataModel {
  late List<ProductModel> products = [];
  late List<BannerModel> banners = [];

  DataModel.fromJson(Map<String, dynamic> json) {
    json['products'].forEach((element) {
      products.add(ProductModel.fromJson(element));
    });
    json['banners'].forEach((element) {
      if (BannerModel.fromJson(element).id == 11 ||
          BannerModel.fromJson(element).id == 26 ||
          BannerModel.fromJson(element).id == 17 ||
          BannerModel.fromJson(element).id == 19 ||
          BannerModel.fromJson(element).id == 24  
          )
        banners.add(BannerModel.fromJson(element));
    });
  }
}
class BannerModel {
  int? id;
  String? image;
  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}
// class ProductModel
// {
//   dynamic id;
//   dynamic price;
//   dynamic old_price;
//   dynamic discount;
//   dynamic image;
//   dynamic name;
//  late bool in_favorites;
//  late bool in_cart;             
//   // named constarctor
// ProductModel.fromJson(Map<String,dynamic>json)
// {
//   id=json['id'];
//   price=json['price'];
//   old_price=json['old_price'];
//   discount=json['discount'];
//   image=json['image'];
//   name=json['name'];
//   in_favorites=json['in_favorites'];
//   in_cart=json['in_cart'];
// }
// }
class ProductModel {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  bool? inFav;
  bool? inCart;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    inFav = json['in_favorites'];
    inCart = json['in_cart'];
  }
}