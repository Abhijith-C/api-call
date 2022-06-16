import 'package:demoapp/controller/controller.dart';
import 'package:demoapp/screens/home-screen/home_screen.dart';
import 'package:demoapp/screens/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNav extends StatefulWidget {
  BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final _contrller = Get.put(Controller());
  int currentIndex = 0;
  var screens = [HomeScreen(), ListScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api-Call"),
        centerTitle: true,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "List")
          ]),
    );
  }
}
