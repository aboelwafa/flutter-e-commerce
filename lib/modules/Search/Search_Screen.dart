// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Search screen',style: Theme.of(context).textTheme.bodyText1,)),
    );
  }
}