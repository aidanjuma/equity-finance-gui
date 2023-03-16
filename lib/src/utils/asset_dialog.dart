import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class AddAssetDialogBox extends StatefulWidget {
  const AddAssetDialogBox({super.key});

  @override
  State<AddAssetDialogBox> createState() => _AddAssetDialogBoxState();
}

class _AddAssetDialogBoxState extends State<AddAssetDialogBox> {
  TextEditingController assetInput = TextEditingController();
  TextEditingController priceInput = TextEditingController();
  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AlertDialog(
        elevation: 0,
        title: const Text('Add Asset'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: assetInput,
                  decoration: const InputDecoration(
                    label: Text('Asset Ticker/ID'),
                    icon: Icon(EvaIcons.barChart2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: assetInput,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Quantity'),
                    icon: Icon(EvaIcons.hash),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: priceInput,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Unit Purchase Price'),
                    icon: Icon(EvaIcons.pricetags),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextField(
                  controller: dateInput,
                  decoration: const InputDecoration(
                    label: Text('Date Purchased'),
                    icon: Icon(EvaIcons.calendar),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('dd/MM/yyyy').format(pickedDate);
                      setState(
                        () => dateInput.text = formattedDate,
                      ); // Change date stored in controller to selected date.
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Confirm'),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}

Future<void> addAssetToPortfolioDialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return const AddAssetDialogBox();
    },
  );
}
