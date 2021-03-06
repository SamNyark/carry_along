import 'package:carry_along/controllers/form_controller.dart';
import 'package:carry_along/controllers/general_controller.dart';
import 'package:carry_along/pages/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../helpers/colors.dart';
import '../helpers/constants.dart';
import '../helpers/dimensions.dart';
import '../helpers/menu_list.dart';
import 'folder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  MenuList action = MenuList();
  final FormController formController = Get.find();
  final GeneralController generalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width10,
                        vertical: Dimensions.height10),
                    child: Text(
                      "Notes",
                      style: Constants.notes,
                    ),
                  ),
                  Container(
                      width: Dimensions.width10 * 9,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (() {
                                formController.signOut();
                              }),
                              child: SvgPicture.asset(
                                "assets/icons/search.svg",
                                height: Dimensions.height25,
                                width: Dimensions.width25,
                                color: AppColor.whiteColor,
                              ),
                            ),
                            PopupMenuButton(
                              onSelected: action.actions,
                              itemBuilder: (context) {
                                return MenuList.menus.map((e) {
                                  return PopupMenuItem(
                                      textStyle: TextStyle(
                                          fontSize: Dimensions.height25/1.5,
                                          color: AppColor.containerColor),
                                      value: e,
                                      child: Text(e));
                                }).toList();
                              },
                              child: SvgPicture.asset(
                                "assets/icons/menu.svg",
                                height: Dimensions.height25,
                                width: Dimensions.width25,
                                color: Colors.white,
                              ),
                            )
                          ])),
                ]),
          ),
          TabBar(
              controller: _controller,
              indicatorColor: AppColor.indicatorColor,
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width10 * 2,
                  vertical: Dimensions.height10 * 2),
              labelColor: AppColor.indicatorColor,
              labelPadding: EdgeInsets.all(Dimensions.height10),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: Dimensions.height10 / 5,
              unselectedLabelColor: AppColor.whiteColor,
              tabs: [
                Text(
                  "All",
                  style: Constants.fs18,
                ),
                Text(
                  "Folder",
                  style: Constants.fs18,
                )
              ]),
          Expanded(
            child: TabBarView(
                controller: _controller, children: [All(), Folder()]),
          )
        ]),
      ),
    );
  }
}
