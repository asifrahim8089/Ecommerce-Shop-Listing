// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

Widget shopsCard({@required item, @required BuildContext context}) {
  print(item);
  return SizedBox(
    width: 170,
    child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 6,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/restaurent.jpg",
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  height: 20,
                  width: 60,
                  color: Colors.yellow,
                  child: Center(
                    child: Text(
                      " ${item.offers} Offer " ?? "0 Offer",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  height: 20,
                  width: 60,
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.white,
                      ),
                      Text(
                        item.ratings ?? "4.5",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              item.shop.shopName,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color: Color.fromARGB(255, 20, 20, 20),
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              item.shop.description,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color: Color.fromARGB(255, 20, 20, 20),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              item.shop.city,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color: Color.fromARGB(255, 20, 20, 20),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          item.shop.isShopClosed == "YES"
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFFFFFFF),
                      border: Border.all(
                        color: Colors.deepPurple,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "CLOSED",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFFFFFFF),
                      border: Border.all(
                        color: Colors.deepPurple,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "OPEN",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
        ],
      ),
    ),
  );
}
