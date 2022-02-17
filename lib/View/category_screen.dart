// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_project/Components/category_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                )),
          ],
        ),
        SizedBox(
          height: 120,
          child: GridView.builder(
            itemCount: 1,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: categoryCard(
                  item: "Mobile",
                  context: context,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
