import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:equity/src/utils/global.dart';
import 'package:equity/src/utils/debouncer.dart';
import 'package:equity/src/providers/equity_api_provider.dart';
import 'package:equity/src/ui/components/sliders/default_slider.dart';
import 'package:equity/src/ui/components/navigation/custom_app_bar.dart';
import 'package:equity/src/ui/components/panels/search_result_panel.dart';

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
      appBar: customAppBar(context, 0),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: width * 0.05,
              right: width * 0.05,
              bottom: height * 0.025,
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
                      onChanged: (query) =>
                          updateSearchResults(context, _debouncer, query),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Consumer<EquityApiProvider>(
            builder: (context, provider, child) {
              if (provider.results != null) {
                List<SearchResultPanel> panels = [];

                for (int i = 0; i < provider.results!.length; i++) {
                  final result = provider.results![i];
                  panels.add(SearchResultPanel(result: result));
                }

                return DefaultSlider(
                  direction: Axis.vertical,
                  panels: panels,
                );
              }
              return const SizedBox.shrink();
            },
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
