import 'package:carry_along/constants/colors.dart';
import 'package:carry_along/constants/dimensions.dart';
import 'package:carry_along/pages/add_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddNew());
        },
        child: Icon(Icons.file_present),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: MasonryGridView.builder(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            itemCount: 10,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (_, index) {
              return Container(
                decoration: BoxDecoration(
                    color: AppColor.containerColor,
                    borderRadius: BorderRadius.circular(20)),
                height: 150,
                width: 100,
              );
            }),
      ),
    );
  }
}
