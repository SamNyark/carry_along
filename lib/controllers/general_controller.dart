import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GeneralController extends GetxController {
  RxBool clicked = false.obs;
  Rx<bool> loggedIn = false.obs;
}
