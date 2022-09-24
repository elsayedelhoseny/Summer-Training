import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:convert';
import 'dart:ffi';

import 'provider/category_provider.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false).getAllData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      Consumer<CategoryProvider>(builder: (context, category, child) {
        return ListView.builder(
            itemCount: category.category?.data!.data!.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  // height: 50,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image(
                            fit: BoxFit.cover,
                            image: category
                                        .category?.data!.data![index].image ==
                                    null
                                ? const NetworkImage(
                                    "https://freesvg.org/img/Loading_icon_with_fade.png")
                                : NetworkImage(category
                                        .category?.data!.data![index].image ??
                                    "")),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("${category.category?.data!.data![index].name!}")
                      ],
                    ),
                  ));
            });
      });
}
