import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../../../utils/global.dart';
import '../../../router/routes.dart';
import '../dialog/asset_dialog.dart';
import '../../../router/navigator_wrapper.dart';

const TextStyle _titleStyle = TextStyle(
  fontFamily: 'DM Sans',
  fontSize: 32,
  fontWeight: FontWeight.w700,
);

PreferredSize customAppBar(BuildContext context, int type) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  return PreferredSize(
    preferredSize: Size.fromHeight(height * 0.175),
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: height * 0.075,
        bottom: height * 0.025,
        left: width * 0.05,
        right: width * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          type == 0 || type == 3
              ? const Text(
                  'equity',
                  style: _titleStyle,
                )
              : GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    EvaIcons.arrowBack,
                    size: 28,
                  ),
                ),
          Row(
            children: <Widget>[
              type == 3
                  ? GestureDetector(
                      onTap: () {
                        updateAssetList(context);
                        addAssetToPortfolioDialogBuilder(context);
                      },
                      child: const Icon(
                        EvaIcons.plus,
                        size: 28,
                      ),
                    )
                  : const SizedBox.shrink(),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
              type != 2
                  ? GestureDetector(
                      onTap: () {
                        updateAssetList(context);
                        NavigatorWrapper.push(context, Routes.settings);
                      },
                      child: const Icon(
                        EvaIcons.settingsOutline,
                        size: 28,
                      ),
                    )
                  : const Text(
                      'Settings',
                      style: _titleStyle,
                    ),
            ],
          ),
        ],
      ),
    ),
  );
}
