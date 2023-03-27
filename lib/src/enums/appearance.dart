import 'package:hive/hive.dart';

part 'appearance.g.dart';

@HiveType(typeId: 5)
enum Appearance {
  @HiveField(0)
  light,

  @HiveField(1)
  dark,

  @HiveField(2)
  system,
}
