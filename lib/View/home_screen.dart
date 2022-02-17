// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task_project/Components/banner_card.dart';
import 'package:task_project/Provider/store_provider.dart';
import 'package:task_project/View/best_shops.dart';
import 'package:task_project/View/category_screen.dart';
import 'package:task_project/View/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<StoreProvider>(context, listen: false).fetchStores();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10.0),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.qr_code_scanner,
            color: Color.fromARGB(255, 112, 31, 119),
          ),
        ),
        title: SvgPicture.asset(
          "assets/svg/best.svg",
          color: Color.fromARGB(255, 112, 31, 119),
          height: 40,
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_bag,
              color: Color.fromARGB(255, 112, 31, 119),
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.settings_power_sharp,
              color: Color.fromARGB(255, 112, 31, 119),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (route) => false);
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.location_on,
                  color: Color.fromARGB(255, 112, 31, 119),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: Text.rich(
                      TextSpan(
                        text: "Home",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <InlineSpan>[
                          TextSpan(
                            text:
                                "\nGurdwara Nanaksar, Gurdwara Ln, Block 1, Old RajinderNagar, Rajinder Nagar, New Delhi, Delhi 110060, India",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Your Rewards",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                height: 30,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: RadialGradient(
                      // ignore: prefer_const_literals_to_create_immutables
                      colors: [
                        Color.fromARGB(255, 134, 5, 146),
                        Color.fromARGB(255, 181, 101, 189),
                      ], radius: 3.5, focal: Alignment(1, 0), focalRadius: 0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(
                        Icons.card_giftcard_sharp,
                        size: 16,
                        color: Colors.white,
                      ),
                      Text(
                        "Your Points: 0",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BannerCard(),
            SizedBox(
              height: 5,
            ),
            CategoryScreen(),
            SizedBox(
              height: 5,
            ),
            BestShop(),
          ],
        ),
      ),
    );
  }
}
