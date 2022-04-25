import 'package:citytimes/Screens/Myfeed.dart';
import 'package:flutter/material.dart';
import 'Discover.dart';
class Pagecontroller extends StatefulWidget {
  const Pagecontroller({Key? key}) : super(key: key);
  @override
  _PagecontrollerState createState() => _PagecontrollerState();
}

class _PagecontrollerState extends State<Pagecontroller> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
        body:PageView(
          controller: controller,
          children: <Widget>[
            Discover(),
            MyFeed(),
          ],
        )
    );
  }
}
