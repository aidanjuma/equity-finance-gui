import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../../../models/asset.dart';

class AssetPanel extends StatefulWidget {
  final Box<Asset> assetsBox;
  final int index;

  const AssetPanel({
    super.key,
    required this.assetsBox,
    required this.index,
  });

  @override
  State<AssetPanel> createState() => _AssetPanelState();
}

class _AssetPanelState extends State<AssetPanel> {
  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    return isHidden
        ? const SizedBox.shrink()
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.assetsBox.values.toList()[widget.index].ticker,
                  style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await widget.assetsBox.deleteAt(widget.index);
                    setState(() => isHidden = true);
                  },
                  child: const Icon(EvaIcons.trash2Outline),
                ),
              ],
            ),
          );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
