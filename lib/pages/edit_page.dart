import 'package:carry_along/helpers/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/colors.dart';
import '../helpers/dimensions.dart';

class EditPage extends StatelessWidget {
  final int index;
  EditPage({Key? key, required this.index}) : super(key: key);

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.currentUser!.uid;
    final Stream<QuerySnapshot> stream = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser)
        .collection('data')
        .snapshots();
    return SafeArea(
        child: StreamBuilder(
            stream: stream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              dynamic ref = snapshot.data!.docs[index].data();
              title.text = ref['title'].toString();
              content.text = ref['content'].toString();
              String id = snapshot.data!.docs[index].id;
              if(!snapshot.hasData){
                
              }
              return Scaffold(
                  backgroundColor: AppColor.whiteColor,
                  body: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Dimensions.width10 * 2),
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
                                onPressed: (() {
                                  FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(firebaseUser)
                                      .collection("data")
                                      .doc(id)
                                      .update({
                                    'title': title.text,
                                    'content': content.text
                                  }).then((value) {
                                    Get.snackbar(
                                        "Success", "Successfully Updated");
                                    Get.toNamed(Routes.homePage);
                                  });
                                }))
                          ],
                        ),
                        TextField(
                          cursorColor: AppColor.containerColor,
                          controller: title,
                          decoration: InputDecoration(
                              hintText: "Title",
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(fontSize: Dimensions.height10 * 2)),
                        ),
                        TextField(
                          controller: content,
                          cursorColor: AppColor.containerColor,
                          decoration: InputDecoration(
                              focusColor: AppColor.containerColor,
                              border: InputBorder.none,
                              hintText: "Start typing"),
                        )
                      ],
                    ),
                  ));
            }));
  }
}
