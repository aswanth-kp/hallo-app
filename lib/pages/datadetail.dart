import 'dart:io';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Datadetails extends StatelessWidget {
  var dataA;
  var dataB;
  var dataC;
  var dataD;

  dynamic dataE;
  Datadetails(
      {super.key,
      required this.dataA,
      required this.dataB,
      required this.dataC,
      this.dataD});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Data Details"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              dataA,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              dataB,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              dataC,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              dataD,
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    ));
  }
}
