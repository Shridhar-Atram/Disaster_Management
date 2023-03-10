import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; 
class Carousel1 extends StatefulWidget {
  const Carousel1({super.key});

  @override
  State<Carousel1> createState() => _Carousel1State();
}

class _Carousel1State extends State<Carousel1> {
   List<String>imagesList=[
    "https://thumbs.dreamstime.com/b/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-gra-130247647.jpg",  
    "https://nationaltoday.com/wp-content/uploads/2022/07/24-Natural-Disaster-Reduction.jpg",  
    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",  
    "https://cdn.downtoearth.org.in/library/large/2019-09-12/0.80168200_1568290445_id-twitter.jpg"  
  ];
  @override
  Widget build(BuildContext context) {
    return Container( 
    child: Column(
             children: [
               Container(
                 child: CarouselSlider.builder(
                                  itemCount: imagesList.length,
                                  itemBuilder: (BuildContext context, index,int )  {
                                    
                                    final getImage = imagesList[index];
                                    return SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        child: Image.network(
                                          getImage,
                                          fit: BoxFit.fill,
                                        ));
                                  },
                                  options: CarouselOptions(
                                     height: 250.0, 
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
                          Text("Information about the Reported disaster", style:TextStyle(
                              color:Colors.black, 
                              fontSize: 24.0, 
                              //fontWeight: FontWeight.bold,
                            ) ,
                                         ),
                             SizedBox(
                          height:24.0,
                          ), 
                           Text("Name:", style:TextStyle(
                              color:Colors.black, 
                              fontSize: 15.0, 
                              fontWeight: FontWeight.bold,
                            ) ,
                            ),
                             SizedBox(
                          height:10.0,
                          ), 
                           Text("Location:", style:TextStyle(
                              color:Colors.black, 
                              fontSize: 15.0, 
                              fontWeight: FontWeight.bold,
                            ), 
                            
                            ),
                             SizedBox(
                          height:10.0,
                          ),  
                          Text("Status:", style:TextStyle(
                              color:Colors.black, 
                              fontSize: 15.0, 
                              fontWeight: FontWeight.bold,
                            ), 
                            
                            ),
                             SizedBox(
                          height:35.0,
                          ), 
                         Text("Your interest to work in:", style:TextStyle(
                              color:Colors.black, 
                              fontSize: 18.0, 
                             // fontWeight: FontWeight.bold,
                            ), 
                         ),
                             SizedBox(
                          height:28.0,  
                             ), 
                             Row(
                              children: [  
                               Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(0)),
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
                            
                              }
                             
                            
                          )),  
                          SizedBox(
                          width:10.0,  
                             ),
                          Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(0)),
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
                            
                              }
                             
                            
                          )), 
                          
                          SizedBox(
                          width:10.0,  
                             ),
                          Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(0)),
                          child: InkWell(
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Donation',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            onTap: () async {
                            
                              }
                             
                            
                          )), 
                              ]  
                              
                             ), 
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
             
             ]
           ),
       
    );
  }
}