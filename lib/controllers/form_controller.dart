import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FormController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  @override
  void onInit() {
    _auth.authStateChanges().listen((event) {
      if (event == null) {
        //  TODO
      } else {}
    });

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> createUser(email, password,) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({
        'username': value.user!.email,
      });
    }).onError((error, stackTrace) {
      var str = error.toString().substring(error.toString().indexOf('T'));
      Get.snackbar("Error", str,
          colorText: Colors.white, backgroundColor: const Color(0xfffa3116));
    });
  }

  Future<void> login(username, password) async {
    await _auth
        .signInWithEmailAndPassword(email: username, password: password)
        .then((value) {
          
        })
        .onError((error, stackTrace) {
      var str = error.toString().substring(error.toString().indexOf('T'));
      Get.snackbar("Error", str,
          colorText: Colors.white, backgroundColor: const Color(0xfffa3116));
    });
  }

  void signOut() async {
    await _auth.signOut();
  }
}
