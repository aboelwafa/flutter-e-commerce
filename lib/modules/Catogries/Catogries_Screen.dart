// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/layout/Shop_App/cubit/cubit.dart';
import 'package:market/layout/Shop_App/cubit/states.dart';
import 'package:market/models/Shop_App/Category_Model.dart';
import 'package:market/shared/Components/components.dart';

class CatogriesScreen extends StatelessWidget {
  const CatogriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,shopStates>(
      listener: (context, state) {},
      builder: (context, state) {
       return
        ListView.separated(
        itemBuilder: (context, index) => buildCatItem(ShopCubit.get(context).categoryModel.data!.data![index]),
         separatorBuilder:(context, index) =>mydivider()  ,
          itemCount: ShopCubit.get(context).categoryModel.data!.data!.length);
      },

      
    ) ;
  }

  Widget buildCatItem(DataCategoryModel model)=>
   Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image(
          image: NetworkImage('${model.image}'),
          width: 150.0,
          height: 150.0,
          fit: BoxFit.cover,
          ),
          SizedBox(width: 20.0,),
          Text('${model.name}',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          ),
          Spacer(),
          Icon((Icons.arrow_forward_ios)),
        ],
      ),
    );
}