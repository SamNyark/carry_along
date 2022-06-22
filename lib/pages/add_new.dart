import 'dart:ui';

import 'package:carry_along/constants/colors.dart';
import 'package:carry_along/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AddNew extends StatelessWidget {
  const AddNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width10 * 2),
          child: Column(
            children: [
              IconButton(
                  iconSize: Dimensions.height10 * 3,
                  padding: EdgeInsets.only(right: 350),
                  icon: Icon(Icons.arrow_back),
                  onPressed: (() => Get.back())),
              TextField(
                cursorColor: AppColor.containerColor,
                decoration: InputDecoration(
                    hintText: "Title",
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: Dimensions.height10 * 2)),
              ),
              TextField(
                decoration: InputDecoration(
                    focusColor: AppColor.containerColor,
                    border: InputBorder.none,
                    hintText: "Start typing"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
