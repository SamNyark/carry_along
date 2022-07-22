import 'package:carry_along/controllers/general_controller.dart';
import 'package:carry_along/helpers/routes.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FormController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GeneralController _generalController = Get.find();

  @override
  void onInit() {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        //  TODO
        _generalController.loggedIn.value = false;
      } else {
        _generalController.loggedIn.value = true;
      }
    });

    super.onInit();
  }

  Future<void> createUser(
    email,
    password,
  ) async {
    try {
      _generalController.clicked.value = true;
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        FirebaseFirestore.instance
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .set({
          'username': value.user!.email,
        });
        _generalController.loggedIn(true);
        Get.offAllNamed(Routes.homePage);
      }).onError((error, stackTrace) {
        var str = error.toString().substring(error.toString().indexOf('T'));
        Get.snackbar("Error", str,
            colorText: Colors.white, backgroundColor: const Color(0xfffa3116));
      });
    } finally {
      _generalController.clicked.value = false;
    }
  }

  Future<void> login(username, password) async {
    try {
      _generalController.clicked.value = true;
      await _auth
          .signInWithEmailAndPassword(email: username, password: password)
          .then((value) {
        Get.offAllNamed(Routes.homePage);
        _generalController.loggedIn.value = true;
      }).onError((error, stackTrace) {
        var str = error.toString().substring(error.toString().indexOf('T'));
        Get.snackbar("Error", str,
            colorText: Colors.white, backgroundColor: const Color(0xfffa3116));
      });
    } finally {
      _generalController.clicked.value = false;
    }
  }

  void signOut() async {
    await _auth.signOut();
    _generalController.loggedIn.value = false;
  }
}
