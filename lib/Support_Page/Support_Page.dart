import 'package:flutter/material.dart';

class Support_Page extends StatefulWidget {
  const Support_Page({Key? key}) : super(key: key);

  @override
  State<Support_Page> createState() => _Support_PageState();
}

class _Support_PageState extends State<Support_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.green,
          height: 500,
          width: 500,
        ),
      ),
    );
  }
}
