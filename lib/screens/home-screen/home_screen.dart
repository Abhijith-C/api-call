import 'package:demoapp/controller/controller.dart';
import 'package:demoapp/model/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customWidgets/inputField.dart';
import 'customWidgets/submit_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            inputField('Enter the Name', _nameController),
            inputField('Enter the Email ID', _emailController),
            inputField('Enter the Mobile Number', _mobileController),
            GetBuilder<Controller>(
              builder: (_) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    genterRadio('Male', 'male'),
                    genterRadio('Female', 'female'),
                    genterRadio('Other', 'other'),
                  ],
                );
              },
            ),
            submitButton(() async {
              if (_nameController.text.isEmpty ||
                  _emailController.text.isEmpty ||
                  _mobileController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Please fill the requirements"),
                ));
              } else {
                var data = DataModel(
                    name: _nameController.text.trim(),
                    email: _emailController.text.trim(),
                    mobile: _mobileController.text.trim(),
                    gender: _controller.genterSelection);
                var res = await _controller.postData(data);
                if (res == true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Submitted successfully"),
                  ));
                }
              }
            }),
          ],
        ));
  }

  RadioListTile<String> genterRadio(String title, String value) {
    return RadioListTile(
      title: Text(title),
      value: value,
      groupValue: _controller.genterSelection,
      onChanged: (value) {
        _controller.changeGenter(value!);
      },
    );
  }
}
