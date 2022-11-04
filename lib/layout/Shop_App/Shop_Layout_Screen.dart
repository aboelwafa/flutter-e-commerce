// ignore_for_file: prefer_const_constructors, file_names, unused_local_variable, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/layout/Shop_App/cubit/cubit.dart';
import 'package:market/layout/Shop_App/cubit/states.dart';
import 'package:market/modules/Search/Search_Screen.dart';
import 'package:market/modules/login_screen/LoginShopScreen.dart';
import 'package:market/shared/Components/components.dart';
import 'package:market/shared/network/local/Cache_helper.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..getHomeData()..getCategoryData(),
      child: BlocConsumer<ShopCubit,shopStates>(
        listener: (context, state) {},
        builder: (context, state) {
            ShopCubit cubit= ShopCubit.get(context);
          return 
          Scaffold(
          appBar: AppBar(
            title: Text('Salla'),
            actions: [
              IconButton(onPressed: (){
                navigateTo(context, SearchScreen());
              }, icon: Icon(Icons.search)),
            ],
          ),
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            onTap: (index) 
            {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: 
          [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: 'Home'
            
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps,),
              label: 'Catogries'
            
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite,),
              label: 'Favourite'
            
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,),
              label: 'Settings'
            
            ),
          ],
          ),
        );
        },
        
      ),
    );
  }
}