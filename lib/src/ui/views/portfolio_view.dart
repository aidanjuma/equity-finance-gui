import 'package:flutter/material.dart';
import '../../ui/components/navigation/custom_app_bar.dart';

const TextStyle _labelStyle = TextStyle(
  fontFamily: 'Lexend',
  fontSize: 12,
  fontWeight: FontWeight.w500,
);

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
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Statistics',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: height * 0.025),
                  padding: EdgeInsets.symmetric(vertical: height * 0.035),
                  height: height * 0.15,
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            'Total Value',
                            style: _labelStyle,
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Daily Gain',
                            style: _labelStyle,
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Quantity',
                            style: _labelStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
