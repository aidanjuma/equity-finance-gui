import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:equity/src/router/routes.dart';
import 'package:equity/src/models/search_result.dart';
import 'package:equity/src/router/navigator_wrapper.dart';

class SearchResultPanel extends StatelessWidget {
  final SearchResult result;

  const SearchResultPanel({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        // TODO: Update currently selected asset in provider...
        NavigatorWrapper.push(context, Routes.asset);
      },
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.05,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  result.ticker,
                  style: const TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                result.market != null
                    ? Text(
                        'Market: ${result.market!}',
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            const Icon(EvaIcons.arrowForward),
          ],
        ),
      ),
    );
  }
}
