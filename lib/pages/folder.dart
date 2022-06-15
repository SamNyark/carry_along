import 'package:carry_along/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Folder extends StatefulWidget {
  const Folder({Key? key}) : super(key: key);

  @override
  State<Folder> createState() => _FolderState();
}

class _FolderState extends State<Folder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: MasonryGridView.builder(
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: 20,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: AppColor.containerColor, borderRadius: BorderRadius.circular(20)),
                height: 200,
                width: 120,
                child: Column(
                  children: [
                    Center(
                        child: Image.asset(
                      "assets/icons/folder.png",
                      height: 150,
                    )),
                    Text("data")
                  ],
                ),
              );
            }),
      ),
      floatingActionButton:
          FloatingActionButton(
            child: Icon(Icons.add, size: 30,), onPressed: () {}),
    );
  }
}
