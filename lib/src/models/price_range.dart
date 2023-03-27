import 'package:hive/hive.dart';

@HiveType(typeId: 3)
class PriceRange {
  @HiveField(0)
  final num low;
  @HiveField(1)
  final num high;

  @override
  String toString() {
    return '$low-$high';
  }

  PriceRange({required this.low, required this.high});
}
