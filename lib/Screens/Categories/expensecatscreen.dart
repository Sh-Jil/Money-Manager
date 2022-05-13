import 'package:flutter/material.dart';

import '../Transactions/Methods/expcategorylist.dart';

class ExCat extends StatelessWidget {
  const ExCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        final newcat = expCategoryList[index];
        return Container(
          margin: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), color: Colors.white),
          child: GridTile(
            footer: Center(child: Text(newcat.category)),
            child: newcat.icons,
          ),
        );
      },
      itemCount: expCategoryList.length,
    ));
  }
}
