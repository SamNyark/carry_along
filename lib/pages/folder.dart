import 'package:carry_along/constants/colors.dart';
import 'package:carry_along/constants/dimensions.dart';
import 'package:flutter/material.dart';
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
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width15, vertical: Dimensions.height10/2),
        child: MasonryGridView.builder(
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
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
                    const Text("data")
                  ],
                ),
              );
            }),
      ),
      floatingActionButton:
          FloatingActionButton(
            child: const Icon(Icons.add, size: 30,), onPressed: () {}),
    );
  }
}
