// ignore_for_file: file_names, camel_case_types, unnecessary_null_in_if_null_operators, null_check_always_fails

class shopLoginModel
{
  late bool status;
  late String message;
  late  UserData data;
//  named constractor
shopLoginModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    message=json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null! ;
    
    // data لو مش بنل هات الداتا دي فجيسون 

  }
}
class UserData 
{
 late int id;
late String name;
late String email;
late String phone;
late String image;
late int points;
late int credit;
late  String token;

// constractor
// مش هستخدمه هعمله كومنت 
// UserData({
//  required this.id,
//  required this.name,
//  required this.email,
//  required this.phone,
//  required this.image,
//  required this.points,
//  required this.credit,
//  required this.token,

// });
// named constractor
  UserData.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    points=json['id'];
    credit=json['credit'];
    token=json['token'];

  }
}