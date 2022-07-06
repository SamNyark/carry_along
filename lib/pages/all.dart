import 'package:carry_along/controllers/form_controller.dart';
import 'package:carry_along/pages/add_new.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  final FormController formController = Get.find();

  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.currentUser!.uid;
    final items = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser)
        .collection('data')
        .snapshots();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO must sign in first
          if (formController.noUser()) {
            Get.snackbar("Oops", "You must sign in first");
          }
          Get.to(AddNew());
        },
        child: const Icon(Icons.file_present),
      ),
      body: StreamBuilder(
          stream: items,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.data!.docs.length == 0) {
              return Container(
                child: Center(
                  child: Text("Oops no data"),
                ),
              );
            }
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width15,
                  vertical: Dimensions.height10 / 2),
              child: MasonryGridView.builder(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  itemCount: (formController.noUser())
                      ? 0
                      : snapshot.data!.docs.length,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  itemBuilder: (_, index) {
                    dynamic noteContent = snapshot.data!.docs[index].data();
                    return Container(
                      decoration: BoxDecoration(
                          color: AppColor.containerColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.height10 * 2)),
                      height: Dimensions.height25 * 6,
                      width: Dimensions.width * 10,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width10 / 2,
                                  vertical: Dimensions.height10),
                              child: Text(noteContent['title'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.height18)),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height10 / 2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width10 / 2),
                            child: Text(noteContent['content'],
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
