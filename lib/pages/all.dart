import 'package:carry_along/controllers/form_controller.dart';
import 'package:carry_along/controllers/general_controller.dart';
import 'package:carry_along/helpers/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../helpers/colors.dart';
import '../helpers/dimensions.dart';

class All extends StatelessWidget {
  All({Key? key}) : super(key: key);

  final FormController formController = Get.find();
  final GeneralController generalController = Get.find();
  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String? firebaseUser = FirebaseAuth.instance.currentUser?.uid;
    final items = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser)
        .collection('data')
        .snapshots();
    return Obx(
      () => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (!generalController.loggedIn.value) {
                Get.snackbar("Error", "Oops! must login first");
              }
              Get.toNamed(Routes.addNew);
            },
            child: const Icon(Icons.file_present),
          ),
          body: generalController.loggedIn.value
              ? StreamBuilder(
                  stream: items,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width15,
                          vertical: Dimensions.height10 / 2),
                      child: MasonryGridView.builder(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          itemCount:
                              snapshot.hasData ? snapshot.data!.docs.length : 0,
                          gridDelegate:
                              const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (_, index) {
                            dynamic noteContent =
                                snapshot.data!.docs[index].data();
                            return GestureDetector(
                              onTap: (() {
                                Get.toNamed(Routes.editPageParam(index));
                              }),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColor.containerColor,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.height10 * 2)),
                                height: Dimensions.height25 * 6,
                                width: Dimensions.width * 10,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.width15,
                                            vertical: Dimensions.height10),
                                        child: Text(noteContent['title'],
                                            style: TextStyle(
                                                color: AppColor.whiteColor,
                                                fontSize: Dimensions.height18)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height10 / 2,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Dimensions.width10),
                                          child: Text(noteContent['content'],
                                              style: TextStyle(
                                                  color: AppColor.whiteColor))),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  })
              : Container(
                  child: Center(
                    child: Text("not logged in"),
                  ),
                )),
    );
  }
}
