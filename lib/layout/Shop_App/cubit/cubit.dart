// ignore_for_file: prefer_const_constructors, avoid_print, unused_import, unused_local_variable, unused_field
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/layout/Shop_App/cubit/states.dart';
import 'package:market/models/Shop_App/Category_Model.dart';
import 'package:market/models/Shop_App/Home_Model.dart';
import 'package:market/modules/Catogries/Catogries_Screen.dart';
import 'package:market/modules/Favourite/Favourite_Screen.dart';
import 'package:market/modules/Products/Product_Screen.dart';
import 'package:market/modules/Settings/Setting_Screen.dart';
import 'package:market/shared/Components/constants.dart';
import 'package:market/shared/network/endPoint.dart';
import 'package:market/shared/network/remote/Dio_helper.dart';

class ShopCubit extends Cubit<shopStates>
{
  ShopCubit():super(shopIntialState());

 static ShopCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;

  List<Widget> bottomScreen=
  [
    ProductScreen(),
    CatogriesScreen(),
    FavouriteScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int index)
  {
    currentIndex=index;
    emit(shopBottomNavState());
  }
       
 late HomeModel homeModel;
  getHomeData() {
    emit(shopLoadingHomeState());
    DioHelper.getData(
      url: HOME,
      token: token,
      ).then((value) {
      // print(value.data);
       homeModel=HomeModel.fromJson(value.data);
      //  printFullText(homeModel.toString());
      //  print(homeModel.data!.banners[0].image);
      emit(shopSuccessHomeState());
    }).catchError((error){
      emit(shopErrorHomeState(error));
    });
  }
  
  late CateogriesModel categoryModel;
  getCategoryData() { 
        emit(shopLoadingHomeState());
    DioHelper.getData(
      url: Get_CATEGORIES,
      token: token,
      ).then((value) {
      print(value.data);
        categoryModel=CateogriesModel.fromJson(value.data); 
        print(categoryModel.status);
        print(categoryModel.data?.data![0].image);
      emit(shopSuccessCategoryState());
    }).catchError((error){
      emit(shopErrorCategoryState());
    });
  }

    // homemodel empty
  // get data home 

//   void getHomeData()
//  {
//     emit(shopLoadingHomeState());
//     DioHelper.getData(url: HOME).then((value)
//     {
//        print(value.data);
//        homeModel=HomeModel.fromjson(value.data);

//         printFullText(homeModel.data.banners.toString());
//       emit(shopSuccessHomeState());
//     }).catchError((error)
//     {
//         print(error.toString());
//        emit(shopErrorHomeState(error));

//     });
//  } 
// }


}