import 'package:equity/src/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../../../mixins/input_validation.dart';
import '../../../providers/equity_api_provider.dart';

class ModifyBriefingAssetDialog extends StatefulWidget {
  const ModifyBriefingAssetDialog({super.key});

  @override
  State<ModifyBriefingAssetDialog> createState() =>
      _ModifyBriefingAssetDialogState();
}

class _ModifyBriefingAssetDialogState extends State<ModifyBriefingAssetDialog>
    with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _assetInput = TextEditingController();

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
                updateBriefingPageAsset(_assetInput.text);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}

Future<void> modifyBriefingAssetDialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return const ModifyBriefingAssetDialog();
    },
  );
}
