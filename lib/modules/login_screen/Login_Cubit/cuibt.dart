// ignore_for_file: avoid_print, unnecessary_string_interpolations, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/models/Shop_App/Login_Model.dart';
import 'package:market/modules/login_screen/Login_Cubit/state.dart';
import 'package:market/shared/network/endPoint.dart';
import 'package:market/shared/network/remote/Dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit():super(ShopLoginIntialStates());
  

  static ShopLoginCubit get(context)=>BlocProvider.of(context);

 
    // هنا اخد اوبجكت من 
    // shopLoginModel
    late shopLoginModel loginModel;
      // اوبجكت فاضي وهملاه تحت
  Future<void> userLogin({
    required String? email,
    required String? password,
  })
  async {
   
   
    emit(ShopLoginLoadingStates());
  //  go to data and return //span
   await DioHelper.postData(
        
      // end point on postman url login
      url: LOGIN,
      // data in postman login(email,password)
      // map (key:value)
       data: {
        'email':'$email',
        'password':'$password',
        // هاخد الداتا دي من user
       }
       ).then((value) {
        print(value.data);
       loginModel= shopLoginModel.fromJson(value.data);
        // كدا مليت الاوبجكت قيم جاهز اطبع منه اي حاجة
        // print(loginModel.message);
        // print(loginModel.status);
        // print(loginModel.data.email);
        // print(value.data['message']);
        emit(ShopLoginSucessStates(loginModel));
       }).catchError((error){
        print(loginModel.message);
        emit(ShopLoginErrorStates());
       });
    
  }

// to swap password hide password and visiable
  IconData suffix=Icons.visibility_outlined;
  bool ispassword=true;
  void changepassword(){
    
    ispassword=!ispassword;
    suffix= ispassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ChangePasswordState());
  }
}
// finaly go to login screen and convert it to blocprovider an consumer