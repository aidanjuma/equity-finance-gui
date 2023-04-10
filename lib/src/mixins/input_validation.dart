mixin InputValidationMixin {
  bool isAssetIdValid(String assetId, List<Map<String, dynamic>> validAssets) {
    final List<String> split = assetId.split(":");

    return validAssets.singleWhere(
              (asset) => split.length < 2
                  ? asset['ticker'] == split[0]
                  : asset['ticker'] == split[0] && asset['market'] == split[1],
              orElse: () => {},
            ) ==
            {}
        ? false
        : true;
  }
}
