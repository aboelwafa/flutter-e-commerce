// ignore_for_file: file_names, unused_local_variable, camel_case_types, await_only_futures, body_might_complete_normally_nullable
import 'package:shared_preferences/shared_preferences.dart';

class cacheHelper
{
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences= await SharedPreferences.getInstance();
  }
  static Future<bool> putData
  ({required  String key,required bool value})
  async {
   return await  sharedPreferences.setBool(key,value, );
  }
  
   static dynamic getData({required  String key})
   {
   
   return   sharedPreferences.get(key );
  }

  static Future<bool?> saveData({
      required  String key,
      required dynamic value
      }) async
  {
    if(value is String)  return await  sharedPreferences.setString(key,value );
     if(value is int)  return await  sharedPreferences.setInt(key,value );
      if(value is bool)  return await  sharedPreferences.setBool(key,value );
   
      return await  sharedPreferences.setDouble(key,value);
  }

 static Future<bool> removeData({
    required String key,
  })
  async {
    return await sharedPreferences.remove(key );

  }
}