import 'package:carry_along/constants/colors.dart';
import 'package:carry_along/constants/constants.dart';
import 'package:carry_along/constants/dimensions.dart';
import 'package:carry_along/pages/all.dart';
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

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
                            Get.defaultDialog(
                                title: "Sign up",
                                titleStyle: Constants.notes,
                                backgroundColor: AppColor.bgColor,
                                content: Container(
                                  child: Form(
                                      key: _formkey,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            cursorColor: AppColor.containerColor,
                                            decoration: InputDecoration(
                                              focusColor: Colors.white,
                                              prefixIconColor: AppColor.containerColor,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide:
                                                          BorderSide(width: 2, color: AppColor.containerColor)),
                                              hintText: "username",
                                              prefixIcon: Icon(Icons.person),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Dimensions.height10,
                                          ),
                                          TextFormField(
                                            cursorColor: AppColor.containerColor,
                                            decoration: InputDecoration(
                                              prefixIconColor: AppColor.containerColor,
                                              hintText: "Password",
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 2, color: AppColor.containerColor)),
                                                prefixIcon: Icon(
                                                  Icons.lock,
                                                )),
                                          ),
                                          SizedBox(height: Dimensions.height10,),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(Dimensions.height25)
                                            ),
                                            width: Dimensions.width25*10,
                                            height: Dimensions.height10*4,
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                primary: AppColor.containerColor
                                              ),
                                              onPressed: (){}, child: Text("sign up", style: TextStyle(fontSize: 18),)),
                                          )
                                        ],
                                      )),
                                  width: 300,
                                  height: 300,
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
          Container(
            child: TabBar(
                controller: _controller,
                indicatorColor: Color(0xffdec909),
                padding: EdgeInsets.all(20),
                labelColor: Color(0xffdec909),
                labelPadding: EdgeInsets.all(10),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 2,
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
          ),
          Expanded(
            child: TabBarView(
                controller: _controller, children: [All(), Folder()]),
          )
        ]),
      ),
    );
  }
}
