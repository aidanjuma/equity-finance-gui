import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:equity/src/router/routes.dart';
import 'package:equity/src/router/navigator_wrapper.dart';

const TextStyle _titleStyle = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.w700,
  fontFamily: 'DM Sans',
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
          type == 0
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
          type != 2
              ? GestureDetector(
                  onTap: () => NavigatorWrapper.push(context, Routes.settings),
                  child: const Icon(
                    EvaIcons.settingsOutline,
                    size: 28,
                  ),
                )
              : const Text(
                  'Settings',
                  style: _titleStyle,
                )
        ],
      ),
    ),
  );
}
