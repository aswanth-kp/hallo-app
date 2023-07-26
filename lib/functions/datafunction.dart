import 'package:datacollection/dbmodel/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Datamodel>> datastorenotifier = ValueNotifier([]);

Future<void> addData(Datamodel value) async {
  final dataModel = await Hive.openBox<Datamodel>('datadb');
  dataModel.add(value);
  datastorenotifier.value.add(value);
  datastorenotifier.notifyListeners();
}

Future<void> getAlldata() async {
  final dataModel = await Hive.openBox<Datamodel>('datadb');
  datastorenotifier.value.clear();

  datastorenotifier.value.addAll(dataModel.values);
  datastorenotifier.notifyListeners();
}

Future<void> deletedata(index) async {
  final dataModel = await Hive.openBox<Datamodel>('datadb');
  await dataModel.deleteAt(index);
  getAlldata();
}

Future<void> update(index, updation) async {
  final dataModel = await Hive.openBox<Datamodel>('datadb');
  dataModel.putAt(index, updation);
  datastorenotifier.value[index] = updation;
  datastorenotifier.notifyListeners();
}
