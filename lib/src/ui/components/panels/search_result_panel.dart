import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../../../router/routes.dart';
import '../../../models/search_result.dart';
import '../../../router/navigator_wrapper.dart';
import '../../../providers/equity_api_provider.dart';

class SearchResultPanel extends StatelessWidget {
  final SearchResult result;

  const SearchResultPanel({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        Provider.of<EquityApiProvider>(context, listen: false)
            .updateSelectedAssetTicker('${result.ticker}:${result.market}');
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
                Text(
                  result.provider,
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: colors.onSurface,
                  ),
                ),
                result.market != null
                    ? Text(
                        'Market: ${result.market!}',
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: colors.onSurface,
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
