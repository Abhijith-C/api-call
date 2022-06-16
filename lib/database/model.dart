import 'package:hive_flutter/adapters.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class Model {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  @HiveField(3)
  String mobile;

  @HiveField(4)
  String gender;

  Model(
      {this.id,
      required this.name,
      required this.email,
      required this.mobile,
      required this.gender});
}
