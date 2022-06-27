import 'package:carry_along/constants/colors.dart';
import 'package:carry_along/constants/constants.dart';
import 'package:carry_along/constants/dimensions.dart';
import 'package:carry_along/pages/all.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'folder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool clicked = false;
  String? _username, password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width10,
                      vertical: Dimensions.height10),
                  child: Text(
                    "Notes",
                    style: Constants.notes,
                  ),
                ),
                Container(
                  width: Dimensions.width10 * 12,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Edit",
                          style: Constants.edit,
                        ),
                        GestureDetector(
                          onTap: (() {}),
                          child: SvgPicture.asset(
                            "assets/icons/search.svg",
                            height: Dimensions.height25,
                            width: Dimensions.width25,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            clicked
                                ? Get.defaultDialog(
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
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                    width:
                                                        Dimensions.height10 / 5,
                                                  )),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: Dimensions
                                                                      .height10 /
                                                                  5,
                                                              color: Colors
                                                                  .white)),
                                                  labelText: "username",
                                                  labelStyle: TextStyle(
                                                      color: AppColor
                                                          .containerColor),
                                                  prefixIcon: Icon(
                                                    Icons.person,
                                                    color:
                                                        AppColor.containerColor,
                                                  ),
                                                ),
                                                validator: (input) {
                                                  if (input == null ||
                                                      input.isEmpty) {
                                                    return "username cannot be empty";
                                                  }
                                                },
                                                onSaved: (input) {},
                                              ),
                                              SizedBox(
                                                height: Dimensions.height10,
                                              ),
                                              TextFormField(
                                                cursorColor: Colors.white,
                                                decoration: InputDecoration(
                                                    labelText: "password",
                                                    labelStyle: TextStyle(
                                                        color: AppColor
                                                            .containerColor),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                      width:
                                                          Dimensions.height10 /
                                                              5,
                                                    )),
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: Dimensions
                                                                    .height10 /
                                                                5,
                                                            color:
                                                                Colors.white)),
                                                    prefixIcon: Icon(
                                                      Icons.lock,
                                                      color: AppColor
                                                          .containerColor,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: Dimensions.height10 * 2,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                .height25)),
                                                width: Dimensions.width25 * 10,
                                                height: Dimensions.height10 * 4,
                                                child: TextButton(
                                                    style: TextButton.styleFrom(
                                                        primary: AppColor
                                                            .containerColor),
                                                    onPressed: () {},
                                                    child: Text(
                                                      "login",
                                                      style: TextStyle(
                                                          fontSize: Dimensions
                                                                  .height10 *
                                                              2),
                                                    )),
                                              ),
                                              SizedBox(
                                                height: Dimensions.height10,
                                              ),
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: Dimensions.width10 *
                                                          3),
                                                  child: RichText(
                                                    text: TextSpan(
                                                        text:
                                                            "Don't have an account? ",
                                                        children: [
                                                          TextSpan(
                                                              recognizer:
                                                                  TapGestureRecognizer()
                                                                    ..onTap =
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        clicked =
                                                                            false;
                                                                      });
                                                                    },
                                                              text: "Sign up",
                                                              style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                  decorationColor:
                                                                      Colors
                                                                          .red,
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .red))
                                                        ]),
                                                  )),
                                            ],
                                          )),
                                    ))
                                : Get.defaultDialog(
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
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                    width:
                                                        Dimensions.height10 / 5,
                                                  )),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: Dimensions
                                                                      .height10 /
                                                                  5,
                                                              color: Colors
                                                                  .white)),
                                                  labelText: "username",
                                                  labelStyle: TextStyle(
                                                      color: AppColor
                                                          .containerColor),
                                                  prefixIcon: Icon(
                                                    Icons.person,
                                                    color:
                                                        AppColor.containerColor,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: Dimensions.height10,
                                              ),
                                              TextFormField(
                                                cursorColor: Colors.white,
                                                decoration: InputDecoration(
                                                    labelText: "password",
                                                    labelStyle: TextStyle(
                                                        color: AppColor
                                                            .containerColor),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                      width:
                                                          Dimensions.height10 /
                                                              5,
                                                    )),
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: Dimensions
                                                                    .height10 /
                                                                5,
                                                            color:
                                                                Colors.white)),
                                                    prefixIcon: Icon(
                                                      Icons.lock,
                                                      color: AppColor
                                                          .containerColor,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: Dimensions.height10 * 2,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                .height25)),
                                                width: Dimensions.width25 * 10,
                                                height: Dimensions.height10 * 4,
                                                child: TextButton(
                                                    style: TextButton.styleFrom(
                                                        primary: AppColor
                                                            .containerColor),
                                                    onPressed: () {},
                                                    child: Text(
                                                      "sign up",
                                                      style: TextStyle(
                                                          fontSize: Dimensions
                                                                  .height10 *
                                                              2),
                                                    )),
                                              ),
                                              SizedBox(
                                                height: Dimensions.height10,
                                              ),
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: Dimensions.width10 *
                                                          3),
                                                  child: RichText(
                                                    text: TextSpan(
                                                        text:
                                                            "Already have an account? ",
                                                        children: [
                                                          TextSpan(
                                                              recognizer:
                                                                  TapGestureRecognizer()
                                                                    ..onTap =
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        clicked =
                                                                            true;
                                                                      });
                                                                    },
                                                              text: "Login",
                                                              style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                  decorationColor:
                                                                      Colors
                                                                          .red,
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .red))
                                                        ]),
                                                  )),
                                            ],
                                          )),
                                    ));
                          },
                          child: SvgPicture.asset(
                            "assets/icons/menu.svg",
                            height: Dimensions.height25,
                            width: Dimensions.width25,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                )
              ],
            ),
          ),
          TabBar(
              controller: _controller,
              indicatorColor: AppColor.indicatorColor,
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width10 * 2,
                  vertical: Dimensions.height10 * 2),
              labelColor: AppColor.indicatorColor,
              labelPadding: EdgeInsets.all(Dimensions.height10),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: Dimensions.height10 / 5,
              unselectedLabelColor: Colors.white,
              tabs: [
                Text(
                  "All",
                  style: Constants.fs18,
                ),
                Text(
                  "Folder",
                  style: Constants.fs18,
                )
              ]),
          Expanded(
            child: TabBarView(
                controller: _controller, children: const [All(), Folder()]),
          )
        ]),
      ),
    );
  }
}
