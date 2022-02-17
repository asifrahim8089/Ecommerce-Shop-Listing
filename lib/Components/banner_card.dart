// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: EdgeInsets.all(15),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 10),
            width: 260,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(15),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                BoxShadow(
                    color: Color(0x48EEEEEE), spreadRadius: 4, blurRadius: 20)
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage('assets/images/market.jpg'),
              ),
            ),
          );
        },
      ),
    );
  }
}
