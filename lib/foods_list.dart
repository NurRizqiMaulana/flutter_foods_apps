// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_foods_apps/detail_screen.dart';
import 'package:flutter_foods_apps/models/foods.dart';
import 'package:flutter_foods_apps/models/foods_data.dart';

class FoodsList extends StatelessWidget {
  const FoodsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodsList.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      clipBehavior: Clip.none,
      itemBuilder: (context, index) {
        final Foods foods = foodsList[index];
        return InkWell(
          child: SizedBox(
            height: 135,
            child: Card(
              // color: const Color(Colors.blueAccent),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      child: Image.asset(
                        foods.picture,
                        fit: BoxFit.cover,
                        height: 135,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Center(
                              child: Text(
                                foods.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              foods.desc,
                              maxLines: 3,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(food: foods);
            }));
          },
        );
      },
    );
  }
}
