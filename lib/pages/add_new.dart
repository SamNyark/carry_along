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
        body: Column(
          children: [
            IconButton(
              iconSize: Dimensions.height10*3,
              padding: EdgeInsets.only(right: 330),
              icon: Icon(Icons.arrow_back),
              onPressed: (() => Get.back()
              )),
              TextField(
                
              ),
              TextField(

              )
          ],
        ),
      ),
    );
  }
}
