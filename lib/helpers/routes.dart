import 'package:carry_along/pages/edit_page.dart';
import 'package:carry_along/pages/home_page.dart';
import 'package:get/get.dart';

class Routes {
  static String editPage = "/editPage";
  static String addNew = "/addNew";
  static String all = "/all";
  static String folder = "/folder";
  static String homePage = "/";

  static String editPageParam(int index) => "$editPage?index=$index";

  static List<GetPage> routes = [
    GetPage(
        name: homePage,
        page: () {
          return HomePage();
        }),
    GetPage(
        name: editPage,
        page: () {
          var index = Get.parameters['index'];
          return EditPage(index: int.parse(index!),);
        }),
  ];
}
