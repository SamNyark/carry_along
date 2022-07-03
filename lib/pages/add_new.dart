import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/colors.dart';
import '../helpers/dimensions.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      iconSize: Dimensions.height10 * 3,
                      icon: const Icon(Icons.arrow_back),
                      onPressed: (() => Get.back())),
                  IconButton(
                      iconSize: Dimensions.height10 * 3,
                      icon: const Icon(Icons.check),
                      onPressed: (() {}))
                ],
              ),
              TextField(
                cursorColor: AppColor.containerColor,
                decoration: InputDecoration(
                    hintText: "Title",
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: Dimensions.height10 * 2)),
              ),
              TextField(
                cursorColor: AppColor.containerColor,
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
