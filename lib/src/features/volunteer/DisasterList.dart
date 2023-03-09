import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisasterList extends StatelessWidget {
  DisasterList({Key? key}) : super(key: key) {
    _stream = _reference.snapshots();
  }

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('disasters');

  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Disasters Reported"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 109, 189, 106),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: _stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text('Some error occurred ${snapshot.error}'));
            }

            if (snapshot.hasData) {
              QuerySnapshot querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> documents = querySnapshot.docs;

              List<Map> items = documents
                  .map((e) => {
                        'id': e.id,
                        'area': e['area'],
                        'currentStatus': e['currentStatus'],
                        'disasterType': e['disasterType'],
                        'district': "Nashik",
                      })
                  .toList();

              return Container(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                     // final sortedDis = items
                 // ..sort((item1, item2) =>
                    //  item1.district.compareTo(item2.district));
               // Map disaster = sortedDis[i];
                      Map thisItem = items[i];
                      return FinalDisaster(thisItem['id']);
                    }),
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class FinalDisaster extends StatelessWidget {
  FinalDisaster(this.itemId, {Key? key}) : super(key: key) {
    _reference = FirebaseFirestore.instance.collection('disasters').doc(itemId);
    _futureData = _reference.get();
  }

  String itemId;
  late DocumentReference _reference;
  late Future<DocumentSnapshot> _futureData;
  late Map data;

  Container updateStatus() {
    if ('${data['currentStatus']}' == 'Resolved') {
      return Container(
          child: Row(
        children: [
          Icon(Icons.check, color: Colors.green),
          SizedBox(width: 5.0),
          Text("Status-",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                //color: Color.fromARGB(153, 23, 1, 1),

                //decoration: TextDecoration.underline,
              )),
          SizedBox(width: 8.0),
          Text('${data['currentStatus']}',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(153, 23, 1, 1),
              )),
        ],
      ));
    } else {
      return Container(
          child: Row(
        children: [
          Icon(Icons.circle, color: Color.fromARGB(255, 194, 22, 9)),
          SizedBox(width: 5.0),
          Text("Status-",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                // color: Color.fromARGB(153, 23, 1, 1),
              )),
          SizedBox(width: 8.0),
          Text('${data['currentStatus']}',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(153, 23, 1, 1),
              )),
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            DocumentSnapshot documentSnapshot = snapshot.data;
            data = documentSnapshot.data() as Map;

            return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
                child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 4.0),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 3.0, vertical: 3.0),
                                  child: Text('${data['disasterType']}',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 195, 17, 4))),
                                ),
                                // SizedBox(height: 5.0),
                                updateStatus(),
                              ],
                            ),
                            SizedBox(width: 15.0),
                            Container(
                                child: Row(
                              children: [
                                Icon(Icons.location_on,
                                    color: Color.fromARGB(255, 75, 77, 76)),
                                SizedBox(width: 5.0),
                                Text("District",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      // color: Color.fromARGB(153, 23, 1, 1),
                                    )),
                              ],
                            ))
                          ],
                        ))));
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
