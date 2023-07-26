// import 'package:collectins/Addpage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:datacollection/pages/Addpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> data = [
    "asset/data-collection1.jpg",
    "asset/data-collection2.jpg",
    "asset/data-collection3.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Data Collections',
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: 500,
                height: 300,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      viewportFraction: 1,
                      autoPlayInterval: const Duration(seconds: 3)),
                  itemCount: data.length,
                  itemBuilder: (context, index, realindex) {
                    final datas = data[index];

                    return buildimage(datas, index);
                  },
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Addpage(),
                  ),
                );
              },
              icon: Icon(Icons.add),
              label: Text("Add Data"),
            ),
            // const Addpage(),
            // const Expanded(child: DataPage()),
          ],
        ),
      ),
    );
  }

  Widget buildimage(String datas, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        color: Colors.grey,
        child: Image.asset(
          datas,
          fit: BoxFit.cover,
        ),
      );
}
