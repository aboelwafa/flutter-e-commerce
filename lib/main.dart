// ignore_for_file: prefer_const_constructors, duplicate_ignore, deprecated_member_use, unused_local_variable, avoid_print, empty_constructor_bodies, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, curly_braces_in_flow_control_structures, non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market/layout/Shop_App/Shop_Layout_Screen.dart';
import 'package:market/modules/login_screen/LoginShopScreen.dart';
import 'package:market/modules/on_boarding_screen/on_boarding_screen.dart';
import 'package:market/shared/bloc_observed.dart';
import 'package:market/shared/network/local/Cache_helper.dart';
import 'package:market/shared/network/remote/Dio_helper.dart';

void main() async {
  // الميثود دي عشان 
  //main بقا Aysnc 
  //فكدا ضمنت ان اي حاجة ف المين هتتنفذ

  WidgetsFlutterBinding.ensureInitialized();

Bloc.observer=MyBlocObserver();
  DioHelper.init();
 await cacheHelper.init();
  Widget widget;
 bool? onBoarding=cacheHelper.getData(key: 'onBoarding');
  String? token=cacheHelper.getData(key: 'token');
  if(onBoarding !=null)
  {
    if(token!=null)widget =ShopLayout();
    else widget =ShopLogin();
  }
  else{
    widget =OnBoardingScreen();
  }

 print(onBoarding);
  runApp( MyApp(
    StartWidget: widget,
    ));
}

class MyApp extends StatelessWidget {
   late final bool? onBoarding;
   late final Widget? StartWidget;
MyApp(
  {
    this.StartWidget,
  }
);
  @override

  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme:ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
            backgroundColor:Colors.white,
            elevation: 0.0,
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
              ),
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 25.0,
              ),
              centerTitle: true,
              iconTheme: IconThemeData(
                color: Colors.black,
                size: 30.0
              ),
            ),
            // body text
                textTheme: const TextTheme(
                  bodyText2: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
          
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              unselectedIconTheme: IconThemeData(
                color: Colors.grey,
                size: 30.0
              ),
              selectedIconTheme: IconThemeData(size: 30.0,color: Colors.blue,),
             showUnselectedLabels: true,
             elevation: 20.0,
             
            ),
        ) ,
          
      home:StartWidget ,
    );
  }
}

