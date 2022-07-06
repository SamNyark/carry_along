import 'package:carry_along/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FormController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  String signupp = "sign up";
  String loginn = "login";
  String signOutt = "sign out";
  List<String> menus = [];
  Rx<bool> noUser = true.obs;

  @override
  void onInit() {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        //  TODO
        menus = [signupp, loginn];
        noUser(true);
      } else {
        menus = [signOutt];
      }
    });

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> createUser(
    email,
    password,
  ) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({
        'username': value.user!.email,
      });
      Get.to(HomePage());
      noUser(false);
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
      Get.to(HomePage());
      noUser(false);
    }).onError((error, stackTrace) {
      var str = error.toString().substring(error.toString().indexOf('T'));
      Get.snackbar("Error", str,
          colorText: Colors.white, backgroundColor: const Color(0xfffa3116));
    });
  }

  void signOut() async {
    await _auth.signOut();
    noUser(true);
  }
}
