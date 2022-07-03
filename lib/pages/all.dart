import 'package:carry_along/pages/add_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../helpers/colors.dart';
import '../helpers/dimensions.dart';

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
          Get.to(const AddNew());
        },
        child: const Icon(Icons.file_present),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width15, vertical: Dimensions.height10/2),
        child: MasonryGridView.builder(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            itemCount: 10,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (_, index) {
              return Container(
                decoration: BoxDecoration(
                    color: AppColor.containerColor,
                    borderRadius: BorderRadius.circular(Dimensions.height10*2)),
                height: Dimensions.height25*6,
                width: Dimensions.width*10,
              );
            }),
      ),
    );
  }
}
