class PriceRange {
  final double low;
  final double high;

  @override
  String toString() {
    return '$low-$high';
  }

  PriceRange({required this.low, required this.high});
}
