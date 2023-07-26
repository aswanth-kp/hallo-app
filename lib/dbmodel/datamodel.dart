import 'package:hive/hive.dart';

part 'datamodel.g.dart';

@HiveType(typeId: 1)
class Datamodel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String qualification;

  @HiveField(2)
  final String phonenumber;

  @HiveField(3)
  final String discription;

  Datamodel({
    required this.name,
    required this.qualification,
    required this.phonenumber,
    required this.discription,
  });
}
