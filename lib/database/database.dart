import 'package:demoapp/database/model.dart';
import 'package:demoapp/model/dataModel.dart';
import 'package:hive_flutter/adapters.dart';

addDataToDb(List<DataModel> data) async {
  final DB = await Hive.openBox<Model>('database');
  DB.clear();
  for (var element in data) {
    var model = Model(
        name: element.name,
        email: element.email,
        mobile: element.mobile,
        gender: element.gender);
    DB.add(model);
  }
  // for (var element in DB.values) {
  //   print(element.name);
  // }
}
