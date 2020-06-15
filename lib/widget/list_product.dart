import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatefulWidget {
  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  List<String> names = List();
  List<String> urlImages = List();

  @override
  void initState() {
    super.initState();
    readDatabase();
  }

  Future<Null> readDatabase() async {

    if (names.length != 0) {
      names.clear();
      urlImages.clear();
    }

    Firestore firestore = Firestore.instance;
    await firestore.collection('MyVideo').snapshots().listen((event) {
      for (var snapshot in event.documents) {
        String name = snapshot.data['Name'];
        print('name ==>> $name');
        setState(() {
          names.add(name);
          urlImages.add(snapshot.data['PathImage']);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return names.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) => Row(mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Card(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 120.0,
                        height: 120.0,
                        child: Image.network(urlImages[index]),
                      ),
                      Text(names[index]),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
