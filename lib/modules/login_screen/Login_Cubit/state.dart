import 'package:market/models/Shop_App/Login_Model.dart';

abstract class ShopLoginStates{}

class ShopLoginIntialStates extends ShopLoginStates{}

class ShopLoginLoadingStates extends ShopLoginStates{}

class ShopLoginSucessStates extends ShopLoginStates{
   final shopLoginModel loginModel;

   ShopLoginSucessStates(this.loginModel);
}

class ShopLoginErrorStates extends ShopLoginStates{
  // final String error;

  // ShopLoginErrorStates(this.error);
}

class ChangePasswordState extends ShopLoginStates{}
