import 'package:demoapp/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      builder: (_controller) {
        if (_controller.dataModel.isEmpty) {
          return Center(
            child: Text("No Item Found"),
          );
        } else {
          return ListView.separated(
            itemCount: _controller.dataModel.length,
            separatorBuilder: (ctx, index) => Divider(
              thickness: 2,
            ),
            itemBuilder: (context, index) {
              var data = _controller.dataModel[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(data.name),
                    Text(data.email),
                    Text(data.mobile),
                    Text(data.gender)
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
