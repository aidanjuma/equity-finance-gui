mixin InputValidationMixin {
  bool isAssetIdValid(String? assetId, List<Map<String, dynamic>> validAssets) {
    if (assetId == null) return false;

    final List<String> split = assetId.split(":");
    final Map<String, dynamic> match = validAssets.singleWhere(
      (asset) => split.length < 2
          ? asset['ticker'] == split[0]
          : asset['ticker'] == split[0] && asset['market'] == split[1],
      orElse: () => {},
    );

    return match.isNotEmpty ? true : false;
  }
}
