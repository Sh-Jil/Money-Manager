import 'package:flutter/material.dart';
import 'package:moneymanager/Screens/Transactions/transaction.dart';
import 'package:moneymanager/db/dbmodel.dart';
import 'package:moneymanager/db/expensedbfunc.dart';
import 'categorylistclass.dart';
import 'datepicker.dart';
import 'expcategorylist.dart';
import 'validator.dart';

final categoryExp = TextEditingController(text: "Other");
final _amount = TextEditingController(text: "");
final dateExp = TextEditingController(text: formatter);
ValueNotifier<Icon> expicon =
    ValueNotifier(const Icon(Icons.currency_exchange));
final _description = TextEditingController();
List<CategoryList> expcatlist = expCategoryList;

class AddExpense extends StatelessWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
          Color.fromARGB(255, 189, 117, 202),
          Colors.blueAccent,
          Colors.lightBlueAccent
        ]))),
        title: const Text("Add Expense"),
        automaticallyImplyLeading: true,
        actions: [
          MaterialButton(
            onPressed: () {
              final validation = formKey.currentState!.validate();
              if (validation) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    width: MediaQuery.of(context).size.width - 50,
                    duration: const Duration(seconds: 2),
                    content: const Text("Expense Added."),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                final expense = Expensedb(
                    amount: _amount.text,
                    categorystring: categoryExp.text,
                    date: dateExp.text,
                    description: _description.text);
                addtoexpense(expense);
                _amount.clear();
                _description.clear();
              }
            },
            child: const Icon(
              Icons.done,
              color: Colors.white,
              size: 30.0,
            ),
          )
        ],
      ),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: expicon,
            builder: (context, newicon, _) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: TextFormField(
                        controller: _amount,
                        validator: ((value) => validator(value)),
                        keyboardAppearance: Brightness.dark,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: "Amount",
                            icon: Icon(Icons.currency_rupee)),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(icon: expicon.value),
                      readOnly: true,
                      controller: categoryExp,
                      onTap: () => showModalBottomSheet(
                          useRootNavigator: true,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => const ExpBottomSheet()),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_month)),
                      controller: dateExp,
                      readOnly: true,
                      onTap: () => datePicker(context),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _description,
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                          hintText: "Description",
                          icon: Icon(Icons.description)),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class ExpBottomSheet extends StatefulWidget {
  const ExpBottomSheet({Key? key}) : super(key: key);

  @override
  State<ExpBottomSheet> createState() => _ExpBottomSheetState();
}

class _ExpBottomSheetState extends State<ExpBottomSheet> {
  final controller = TextEditingController();

  void searchBar(String search) {
    if (search.isNotEmpty) {
      final suggestion = expcatlist.where((element) {
        final category = element.category.toLowerCase();
        final input = search.toLowerCase();

        return category.contains(input);
      }).toList();

      setState(() => expcatlist = suggestion);
    } else {
      setState(() => expcatlist = expCategoryList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          controller: scrollController,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                onChanged: searchBar,
                controller: controller,
                decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (ctx, index) {
                final category = expcatlist[index];
                return GridTile(
                    child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      categoryExp.text = category.category;
                      expicon.value = category.icons;
                    });
                  },
                  child: Column(
                    children: [
                      category.icons,
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        category.category,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                      )
                    ],
                  ),
                ));
              },
              itemCount: expcatlist.length,
            ),
          ],
        ),
      ),
    );
  }
}
