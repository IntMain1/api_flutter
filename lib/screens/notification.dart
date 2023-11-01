import 'package:api_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

class Notification1 extends StatefulWidget {
  const Notification1({super.key});

  @override
  State<Notification1> createState() => _Notification1State();
}

class _Notification1State extends State<Notification1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        "Hello Bitch",
        style: TextStyle(
          color: AppStyle.white_t,
        ),
      ),
    );
  }
}
