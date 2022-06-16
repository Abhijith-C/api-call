import 'dart:convert';
import 'package:demoapp/database/database.dart';
import 'package:http/http.dart' as http;
import 'package:demoapp/model/dataModel.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  String genterSelection = 'male';
  List<DataModel> dataModel = [];

  void changeGenter(String genter) {
    genterSelection = genter;
    update();
  }

  postData(DataModel data) async {
    bool completed = false;
    try {
      var respose = await http.post(
          Uri.parse(
              'https://crudcrud.com/api/9fadda9d73074d38baeda26cb470525f/test'),
          headers: {"Content-type": "application/json"},
          body: json.encode(data.toJson()));
      completed = true;
      getData();
    } catch (err) {
      print(err);
    }

    return completed;
  }

  Future<void> getData() async {
    dataModel.clear();
    List<DataModel> model = [];
    var respose = await http.get(Uri.parse(
        'https://crudcrud.com/api/9fadda9d73074d38baeda26cb470525f/test'));
    List<dynamic> jsonData = jsonDecode(respose.body);
    jsonData.forEach((element) {
      model.add(DataModel.fromJson(element));
    });
    dataModel.addAll(model);
    addDataToDb(model);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}
