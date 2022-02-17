// ignore_for_file: prefer_const_constructors, unnecessary_new, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:task_project/Components/snackbar.dart';
import 'package:task_project/Components/validators.dart';
import 'package:task_project/View/bottom_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String userType = '';
  bool circular = false;
  bool _showPassword = false;

  void validateAndSave() async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      setState(() {
        circular = true;
      });
      Map<String, dynamic> data = {
        "username": _emailController.text,
        "password": _passwordController.text,
        "usertype": userType,
        // "username": "harpreetfrantic@gmail.com",
        // "password": "harry9654",
        // "usertype": "USER",
      };
      final Uri url = Uri.https("pt.frantic.in", "/RestApi/login_user");
      var bodyEncoded = data.keys.map((key) => "$key=${data[key]}").join("&");

      final response = await http.post(url, body: bodyEncoded, headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      });
      if (response.statusCode == 200) {
        Map<String, dynamic> output = json.decode(response.body);
        if (output["error_code"] == 1) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavigation(),
              ),
              (route) => false);
        } else {
          showSnackBar(
            duration: Duration(milliseconds: 10000),
            context: context,
            message: "Not valid",
          );
        }
      } else {
        showSnackBar(
          duration: Duration(milliseconds: 10000),
          context: context,
          message: "Please Enter a Valid Credentials",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Stack(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 300,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: nameValidator,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.deepPurple,
                        controller: _emailController,
                        onChanged: (text) {
                          // mobileNumber = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          // labelStyle: ktext14,
                          labelText: "Email",
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 83, 3, 90),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 83, 3, 90),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: !_showPassword,
                        validator: passwordValidator,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.deepPurple,
                        controller: _passwordController,
                        onChanged: (text) {
                          // mobileNumber = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          focusColor: Colors.greenAccent,
                          // labelStyle: ktext14,
                          labelText: "Password",
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 83, 3, 90),
                              )),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 83, 3, 90),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            child: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                activeColor: Color.fromARGB(255, 83, 3, 90),
                                value: 'USER',
                                groupValue: userType,
                                onChanged: (val) {
                                  setState(() {
                                    userType = val;
                                  });
                                },
                              ),
                              Text(
                                'User',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'QuickSand',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                activeColor: Color.fromARGB(255, 83, 3, 90),
                                value: 'BUSINESS',
                                groupValue: userType,
                                onChanged: (val) {
                                  setState(() {
                                    userType = val;
                                  });
                                },
                              ),
                              Text(
                                'Buissness',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'QuickSand',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'QuickSand',
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: 420,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: RadialGradient(
                                // ignore: prefer_const_literals_to_create_immutables
                                colors: [
                                  Color.fromARGB(255, 83, 3, 90),
                                  Color.fromARGB(255, 83, 3, 90),
                                ],
                                center: Alignment(0, 0),
                                radius: 3.5,
                                focal: Alignment(0, 0),
                                focalRadius: 0.1)),
                        child: new TextButton(
                          onPressed: () {
                            validateAndSave();
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => OtpScreen(
                            //       phoneNumber: '',
                            //       otp: null,
                            //     ),
                            //   ),
                            // );
                          },
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text("or sign in using"),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'Dont have an account?',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'QuickSand',
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Color.fromARGB(255, 131, 27, 141),
                                fontFamily: 'QuickSand',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
