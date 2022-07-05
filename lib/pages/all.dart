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
          Get.to(AddNew());
        },
        child: const Icon(Icons.file_present),
      ),
      body: StreamBuilder(
          stream: items,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator.adaptive();
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
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  itemBuilder: (_, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: AppColor.containerColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.height10 * 2)),
                      height: Dimensions.height25 * 6,
                      width: Dimensions.width * 10,
                    );
                  }),
            );
          }),
    );
  }
}
