class PriceRange {
  final num low;
  final num high;

  @override
  String toString() {
    return '$low-$high';
  }

  PriceRange({required this.low, required this.high});
}
