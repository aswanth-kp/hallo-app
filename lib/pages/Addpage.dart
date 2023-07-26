import 'package:datacollection/dbmodel/datamodel.dart';
import 'package:datacollection/functions/datafunction.dart';
import 'package:datacollection/pages/datapage.dart';
import 'package:flutter/material.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  final _NameController = TextEditingController();

  final _QualificationController = TextEditingController();

  final _PhonenumberController = TextEditingController();

  final _DiscriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getAlldata();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: 'Name'),
            controller: _NameController,
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Qualification'),
            controller: _QualificationController,
            minLines: 3,
            maxLines: 5,
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Phone Number'),
            controller: _PhonenumberController,
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Discription'),
            controller: _DiscriptionController,
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
              onPressed: () {
                onSubmitButtonclicked(context);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => DataPage()));
              },
              icon: Icon(Icons.add),
              label: Text("Submit Data"))
        ],
      ),
    );
  }

  Future<void> onSubmitButtonclicked(BuildContext context) async {
    final _name = _NameController.text.trim();
    final _qualification = _QualificationController.text.trim();
    final _phonenumber = _PhonenumberController.text.trim();
    final _discription = _DiscriptionController.text.trim();

    if (_name.isEmpty ||
        _qualification.isEmpty ||
        _phonenumber.isEmpty ||
        _discription.isEmpty) {
      return;
    } else {
      final _data = Datamodel(
          name: _name,
          qualification: _qualification,
          phonenumber: _phonenumber,
          discription: _discription);

      addData(_data);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: ((context) => DataPage()),
        ),
      );
    }
  }
}
