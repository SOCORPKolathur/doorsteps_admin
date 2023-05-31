
import 'package:flutter/material.dart';

class Payment_Page extends StatefulWidget {
  const Payment_Page({Key? key}) : super(key: key);

  @override
  State<Payment_Page> createState() => _Payment_PageState();
}

class _Payment_PageState extends State<Payment_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.red,
          height: 500,
          width: 500,
        ),
      ),
    );
  }
}
