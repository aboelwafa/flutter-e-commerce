// ignore_for_file: prefer_const_constructors, file_names, file_names, duplicate_ignore

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Settings Screen',
        style: Theme.of(context).textTheme.bodyText1
      ),
    );
  }
}