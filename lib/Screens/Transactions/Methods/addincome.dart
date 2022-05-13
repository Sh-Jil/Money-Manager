import 'package:flutter/material.dart';
import 'package:moneymanager/db/dbmodel.dart';
import 'package:moneymanager/db/incomedbfunc.dart';
import '../transaction.dart';
import 'categorylistclass.dart';
import 'datepicker.dart';
import 'inccategorylist.dart';
import 'validator.dart';

final categoryInc = TextEditingController(text: "Other");
final amount = TextEditingController();
ValueNotifier<Icon> incicon =
    ValueNotifier(const Icon(Icons.currency_exchange));
final dateInc = TextEditingController(text: formatter);
final descInc = TextEditingController();
List<CategoryList> inccatlist = incCategoryList;

class AddIncome extends StatelessWidget {
  const AddIncome({Key? key}) : super(key: key);

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
        title: const Text("Add Income"),
        automaticallyImplyLeading: true,
        actions: [
          MaterialButton(
            onPressed: () {
              final validation = formKey.currentState!.validate();
              if (validation) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text("Income Added."),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              } else {
                return;
              }
              final income = Incomedb(
                  amount: amount.text,
                  categorystring: categoryInc.text,
                  date: dateInc.text,
                  description: descInc.text);
              addtoincome(income);
              amount.clear();
              descInc.clear();
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
            valueListenable: incicon,
            builder: (context, newicon, _) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: TextFormField(
                        controller: amount,
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
                      decoration: InputDecoration(icon: incicon.value),
                      readOnly: true,
                      controller: categoryInc,
                      onTap: () => showModalBottomSheet(
                          useRootNavigator: true,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => const IncBottomSheet()),
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
                      controller: dateInc,
                      readOnly: true,
                      onTap: () => datePicker(context),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: descInc,
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

class IncBottomSheet extends StatefulWidget {
  const IncBottomSheet({Key? key}) : super(key: key);

  @override
  State<IncBottomSheet> createState() => _IncBottomSheetState();
}

class _IncBottomSheetState extends State<IncBottomSheet> {
  final controller = TextEditingController();

  void searchBar(String search) {
    if (search.isNotEmpty) {
      final suggestion = inccatlist.where((element) {
        final category = element.category.toLowerCase();
        final input = search.toLowerCase();

        return category.contains(input);
      }).toList();

      setState(() => inccatlist = suggestion);
    } else {
      setState(() => inccatlist = incCategoryList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) => Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
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
                final category = inccatlist[index];
                return GridTile(
                    child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      categoryInc.text = category.category;
                      incicon.value = category.icons;
                    });
                    Navigator.of(context).pop();
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
              itemCount: inccatlist.length,
            ),
          ],
        ),
      ),
    );
  }
}
