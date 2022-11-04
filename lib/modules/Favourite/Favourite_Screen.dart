// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favourite Screen',
        style: Theme.of(context).textTheme.bodyText1
      ),
    );
  }
}