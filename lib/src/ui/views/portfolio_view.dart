import 'package:equity/src/ui/components/navigation/custom_app_bar.dart';
import 'package:flutter/material.dart';

// TODO: Finish UI for Portfolio; fl_chart...
class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: customAppBar(context, 3),
      extendBodyBehindAppBar: true,
      body: Column(
        children: <Widget>[
          Container(
            height: height * 0.4,
            color: colors.surface,
          ),
        ],
      ),
    );
  }
}
