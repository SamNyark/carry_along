import 'package:carry_along/controllers/form_controller.dart';
import 'package:carry_along/controllers/general_controller.dart';
import 'package:get/get.dart';

Future<void> initBinding() async {
  Get.lazyPut(() => FormController());
  Get.lazyPut(() => GeneralController());
}
