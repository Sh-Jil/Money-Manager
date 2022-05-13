import 'package:flutter/material.dart';
import 'package:moneymanager/Screens/Transactions/Methods/inccategorylist.dart';

class InCat extends StatelessWidget {
  const InCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        final newcat = incCategoryList[index];
        return Container(
          margin: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), color: Colors.white),
          child: GridTile(
            footer: Text(
              newcat.category,
              textAlign: TextAlign.center,
            ),
            child: newcat.icons,
          ),
        );
      },
      itemCount: incCategoryList.length,
    ));
  }
}
