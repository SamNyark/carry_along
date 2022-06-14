import 'package:carry_along/constants/constants.dart';
import 'package:carry_along/constants/dimensions.dart';
import 'package:carry_along/pages/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: Color(0xff757572)
          // gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.topRight,
          //     colors: [
          //   Color.fromARGB(115, 4, 4, 8),
          //   Color.fromARGB(181, 27, 14, 39)
          // ])),
      ),
      child: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Notes",
                    style: TextStyle(
                        fontFamily: "karla",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Container(
                  width: 120,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Edit",
                          style: TextStyle(
                              fontFamily: "karla",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        SvgPicture.asset(
                          "assets/icons/search.svg",
                          height: 25,
                          width: 25,
                          color: Colors.white,
                        ),
                        SvgPicture.asset(
                          "assets/icons/menu.svg",
                          height: 25,
                          width: 25,
                          color: Colors.white,
                        ),
                      ]),
                )
              ],
            ),
          ),
          Container(
            child: TabBar(
                controller: _controller,
                indicatorColor: Color(0xffdec909),
                padding: EdgeInsets.all(20),
                labelColor: Color(0xffdec909),
                labelPadding: EdgeInsets.all(10),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 2,
                unselectedLabelColor: Colors.white,
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
          ),
          Expanded(
            child: TabBarView(
                controller: _controller, children: [All(), Folder()]),
          )
        ]),
      ),
    ));
  }
}
