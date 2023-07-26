import 'package:datacollection/functions/datafunction.dart';
import 'package:datacollection/pages/datadetail.dart';
import 'package:datacollection/pages/updatepage.dart';
import 'package:flutter/material.dart';

import '../dbmodel/datamodel.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    getAlldata();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Datas"),
        ),
        body: ValueListenableBuilder(
          valueListenable: datastorenotifier,
          builder: (BuildContext ctx, List<Datamodel> datalist, Widget? child) {
            return ListView.separated(
              itemBuilder: (ctx, index) {
                final data = datalist[index];
                return ListTile(
                  title: Text(data.name),
                  subtitle: Text(data.qualification),
                  leading: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            deletedata(index);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => Updatedata(
                                      index: index,
                                      name: data.name,
                                      qualification: data.qualification,
                                      phonenumber: data.phonenumber,
                                      discription: data.discription),
                                ),
                              );
                            },
                            icon: Icon(Icons.edit)),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => Datadetails(
                              dataA: data.name,
                              dataB: data.qualification,
                              dataC: data.phonenumber,
                              dataD: data.discription,
                            )));
                  },
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: datalist.length,
            );
          },
        ),
      ),
    );
  }
}
