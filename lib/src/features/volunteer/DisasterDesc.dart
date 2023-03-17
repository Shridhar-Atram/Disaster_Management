import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disaster_management/src/features/volunteer/Financialhelp1.dart';
import 'package:disaster_management/src/features/volunteer/VolunteerList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../reporting_and_mapping/google_map_screen.dart';

class DisasterDesc extends StatelessWidget {
 DisasterDesc(
      this.itemDisaster, this.currentStatus, this.area, this.images,
      {super.key});

  String itemDisaster;
  String currentStatus;
  String area;
  List<dynamic> images;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
       backgroundColor: Color.fromARGB(255, 168, 220, 167),
        appBar: AppBar(
          title: Text("Disaster Description"),
          backgroundColor: Colors.green,
        ),
        body: Container( 
          //backgroundColor: Colors.green,
          child: Column(children: [
            Container(
              
              padding:EdgeInsets.all(5.0),
              margin:EdgeInsets.all(1.0),
              child: CarouselSlider.builder(
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, index, int) {
                    final getImage = images[index];
                    return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          getImage,
                          fit: BoxFit.fill,
                        ));
                  },
                  options: CarouselOptions(
                    height: 260.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  )),
            ),
            Container(
              //child: Center(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Information about the Reported disaster",
                      style: TextStyle(
                         color: Colors.green[800]!,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                        child: Row(
                      children: [
                        Text("Disaster Type :-",
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              // color: Color.fromARGB(153, 23, 1, 1),
                            )),
                        SizedBox(width: 10.0),
                        Text(itemDisaster,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(153, 23, 1, 1),
                            )),
                      ],
                    )),
                    SizedBox(
                      height: 13.0,
                    ),
                   Container(
                        child: Row(
                      children: [
                        Text("Location :-",
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              // color: Color.fromARGB(153, 23, 1, 1),
                            )),
                        SizedBox(width: 10.0),
                        Text(area,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(153, 23, 1, 1),
                            )),
                      ],
                    )),
                    SizedBox(
                      height: 13.0,
                    ),
                      Container(
                        child: Row(
                      children: [
                        Text("Current Status :-",
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              // color: Color.fromARGB(153, 23, 1, 1),
                            )),
                        SizedBox(width: 10.0),
                        Text(currentStatus,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(153, 23, 1, 1),
                            )),
                      ],
                    )),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Select your interest to work in:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 3),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Physical',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                              onTap: () async {
                               Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => GoogleMapScreen())));

                              })),
                      SizedBox(
                        width: 40.0,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 3),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Financial',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                              onTap: () async {
                                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Financialhelp1(),
                      ),
                    );
                              })),
                      
                    ]),
                    /*Column(children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Center(
                               child: Container(
                                                       padding:
                                  const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                                                       decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(0)),
                                                       child: InkWell(
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text('Donation',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                                onTap: () async {
                                
                                  }
                                 
                                
                                                       )),
                             ),
                           ) 
                         ],)*/
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
