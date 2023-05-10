import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../../../utils/global.dart';
import '../../../mixins/input_validation.dart';
import '../../../providers/equity_api_provider.dart';

class AddAssetDialogBox extends StatefulWidget {
  const AddAssetDialogBox({super.key});

  @override
  State<AddAssetDialogBox> createState() => _AddAssetDialogBoxState();
}

class _AddAssetDialogBoxState extends State<AddAssetDialogBox>
    with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _assetInput = TextEditingController();
  final TextEditingController _quantityInput = TextEditingController();
  final TextEditingController _priceInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AlertDialog(
        elevation: 0,
        title: const Text('Add Asset'),
        content: Consumer<EquityApiProvider>(
          builder: (context, provider, child) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: _assetInput,
                      validator: (assetId) {
                        if (isAssetIdValid(
                              assetId!.toUpperCase(),
                              provider.availableGoogleAssets!,
                            ) ==
                            true) return null;

                        return 'Enter a valid asset ID.';
                      },
                      decoration: const InputDecoration(
                        label: Text('Asset Ticker/ID'),
                        icon: Icon(EvaIcons.barChart2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextFormField(
                      controller: _quantityInput,
                      validator: (value) {
                        try {
                          final int quantity = int.parse(_quantityInput.text);
                          if (quantity <= 0) {
                            return 'Quantity must be greater than 0.';
                          }
                        } on FormatException catch (_) {
                          return 'Please enter a valid integer.';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                        icon: Icon(EvaIcons.hash),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextFormField(
                      controller: _priceInput,
                      validator: (value) {
                        try {
                          final double price = double.parse(_priceInput.text);
                          if (price <= 0) {
                            return 'Price must be greater than 0.';
                          }
                        } on FormatException catch (_) {
                          return 'Please enter a valid price.';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('Price Per Unit'),
                        icon: Icon(EvaIcons.pricetags),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Confirm'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _writeAssetDataToStorage(
                  _assetInput.text.toUpperCase(),
                  int.parse(_quantityInput.text),
                  double.parse(_priceInput.text),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _writeAssetDataToStorage(
      String assetId, int quantityPurchased, double pricePerUnit) {
    saveAsset(assetId, quantityPurchased, pricePerUnit);
    Navigator.of(context).pop();
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
