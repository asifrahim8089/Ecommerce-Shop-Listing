// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_project/Provider/store_provider.dart';

import '../Components/shops_card.dart';

class BestShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(
      builder: (context, getstore, child) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: getstore?.store?.data
                ?.map(
                  (e) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                text: "Best Shops in ",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 59, 59, 59),
                                  fontWeight: FontWeight.w800,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: e.markets.name,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 82, 81, 81),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "See all",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 70, 69, 69),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 240,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 8),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: e.shops.length,
                          itemBuilder: (context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: shopsCard(
                                item: e.shops[index],
                                context: context,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
                ?.toList() ??
            [],
      ),
    );
  }
}
