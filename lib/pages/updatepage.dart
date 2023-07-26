import 'dart:io';

import 'package:datacollection/dbmodel/datamodel.dart';
import 'package:datacollection/functions/datafunction.dart';
import 'package:datacollection/pages/datapage.dart';
import 'package:flutter/material.dart';

class Updatedata extends StatefulWidget {
  int index;
  var name;
  var qualification;
  var phonenumber;
  var discription;

  Updatedata({
    super.key,
    required this.index,
    required this.name,
    required this.qualification,
    required this.phonenumber,
    required this.discription,
  });

  @override
  State<Updatedata> createState() => _UpdatedataState();
}

class _UpdatedataState extends State<Updatedata> {
  final a = const SizedBox(
    height: 25,
  );

  TextEditingController _name = TextEditingController();
  TextEditingController _qualification = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _discription = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _name = TextEditingController(text: widget.name);
    _qualification = TextEditingController(text: widget.qualification);
    _phonenumber = TextEditingController(text: widget.phonenumber);
    _discription = TextEditingController(text: widget.discription);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Update Data'),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _qualification,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Qualification',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _phonenumber,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Phone number',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _discription,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Discription',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            onPressed: () {
              Dataupdate();
            },
            icon: Icon(Icons.flag),
            label: Text('Update'),
          ),
        ],
      ),
    ));
  }

  Future<void> Dataupdate() async {
    final dt_name = _name.text.trim();
    final dt_qualification = _qualification.text.trim();
    final dt_phonenumber = _phonenumber.text.trim();
    final dt_discription = _discription.text.trim();

    if (dt_name.isEmpty ||
        dt_qualification.isEmpty ||
        dt_phonenumber.isEmpty ||
        dt_discription.isEmpty) {
      return;
    } else {
      final updation = Datamodel(
          name: dt_name,
          qualification: dt_qualification,
          phonenumber: dt_phonenumber,
          discription: dt_discription);
      update(widget.index, updation);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => DataPage()));

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.white,
        content: Text('UPDATE'),
      ));
    }
  }
}
