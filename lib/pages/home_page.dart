import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catelog/models/catalog.dart';
import 'package:flutter_catelog/widgets/drawer.dart';
import 'package:flutter_catelog/widgets/item_widget.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catelogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catelogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          // ignore: unnecessary_null_comparison
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final item = CatalogModel.items[index];
                    return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: GridTile(
                          header: Container(
                            child: Text(
                              item.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                            ),
                            padding: const EdgeInsets.all(12),
                          ),
                          child: Image.network(
                            item.image,
                          ),
                          footer: Container(
                            child: Text(
                              item.price.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                            padding: const EdgeInsets.all(12),
                          ),
                        ));
                  },
                  itemCount: CatalogModel.items.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: MyDrawer(),
    );
  }
}
