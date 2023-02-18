import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:equity/src/utils/debouncer.dart';
import 'package:equity/src/providers/equity_api_provider.dart';
import 'package:equity/src/ui/components/navigation/custom_app_bar.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: customAppBar(context),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: width * 0.05,
              right: width * 0.05,
              bottom: height * 0.035,
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.onBackground,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(EvaIcons.search),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 12)),
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Search',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onChanged: (query) => _updateSearchResults(query),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateSearchResults(String query) {
    _debouncer.run(
      () async {
        final equityProvider =
            Provider.of<EquityApiProvider>(context, listen: false);
        // Only fire request if query is different than last time.
        if (equityProvider.latestQuery != query) {
          await equityProvider.searchGoogleAssets(query);
        }
      },
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
