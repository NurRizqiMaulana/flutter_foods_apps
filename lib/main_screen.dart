// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_foods_apps/foods_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tegal Foods Apps",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: const [],
        backgroundColor: Colors.orange,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return const FoodsList();
      }),
    );
  }
}
