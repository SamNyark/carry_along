import 'package:carry_along/controllers/general_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controllers/form_controller.dart';
import 'colors.dart';
import 'constants.dart';
import 'dimensions.dart';

class MenuList {
  static String signup = "sign up";
  static String login = "login";

  static List<String> menus = [signup, login];
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final FormController _formController = Get.find();
  final GeneralController _generalController = Get.find();
  String? _username;
  String? _password;

  void actions(choice) {
    if (choice == signup) {
      Get.defaultDialog(
          title: "Sign up",
          titleStyle: Constants.notes,
          backgroundColor: AppColor.bgColor,
          content: Container(
            width: Dimensions.width10 * 30,
            height: Dimensions.height10 * 30,
            child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          width: Dimensions.height10 / 5,
                        )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: Dimensions.height10 / 5,
                                color: Colors.white)),
                        labelText: "username",
                        labelStyle: TextStyle(color: AppColor.containerColor),
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColor.containerColor,
                        ),
                      ),
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "username cannot be empty";
                        }
                      },
                      onSaved: (input) {
                        _username = input;
                      },
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          labelText: "password",
                          labelStyle: TextStyle(color: AppColor.containerColor),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            width: Dimensions.height10 / 5,
                          )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimensions.height10 / 5,
                                  color: Colors.white)),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColor.containerColor,
                          )),
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "password cannot be empty";
                        }
                      },
                      onSaved: (input) {
                        _password = input;
                      },
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimensions.height25)),
                      width: Dimensions.width25 * 10,
                      height: Dimensions.height10 * 4,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              primary: AppColor.containerColor),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              _formController.createUser(_username, _password);
                            }
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(fontSize: Dimensions.height10 * 2),
                          )),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: Dimensions.width10 * 3),
                        child: RichText(
                          text: TextSpan(
                              text: "Already have an account?",
                              children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _generalController.clicked.value =
                                            !(_generalController.clicked.value);
                                      },
                                    text: login,
                                    style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.red,
                                        fontSize: 16,
                                        color: Colors.red))
                              ]),
                        )),
                  ],
                )),
          ));
    } else if (choice == login) {
      Get.defaultDialog(
          title: "Login",
          titleStyle: Constants.notes,
          backgroundColor: AppColor.bgColor,
          content: Container(
            width: Dimensions.width10 * 30,
            height: Dimensions.height10 * 30,
            child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          width: Dimensions.height10 / 5,
                        )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: Dimensions.height10 / 5,
                                color: Colors.white)),
                        labelText: "username",
                        labelStyle: TextStyle(color: AppColor.containerColor),
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColor.containerColor,
                        ),
                      ),
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "username cannot be empty";
                        }
                      },
                      onSaved: (input) {
                        _username = input;
                      },
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          labelText: "password",
                          labelStyle: TextStyle(color: AppColor.containerColor),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            width: Dimensions.height10 / 5,
                          )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimensions.height10 / 5,
                                  color: Colors.white)),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColor.containerColor,
                          )),
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "password cannot be empty";
                        }
                      },
                      onSaved: (input) {
                        _password = input;
                      },
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimensions.height25)),
                      width: Dimensions.width25 * 10,
                      height: Dimensions.height10 * 4,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              primary: AppColor.containerColor),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              _formController.login(_username, _password);
                            }
                          },
                          child: Text(
                            "login",
                            style: TextStyle(fontSize: Dimensions.height10 * 2),
                          )),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: Dimensions.width10 * 3),
                        child: RichText(
                          text: TextSpan(
                              text: "Don't have an account?",
                              children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _generalController.clicked.value =
                                            !(_generalController.clicked.value);
                                      },
                                    text: signup,
                                    style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.red,
                                        fontSize: 16,
                                        color: Colors.red))
                              ]),
                        )),
                  ],
                )),
          ));
      
    }
  }
}
