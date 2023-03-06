import 'package:flutter/material.dart';

class FinalVolunteer extends StatelessWidget {
   FinalVolunteer(this.name,this.cnumber,this.district, {Key? key}) : super(key: key);

  String name;
  String cnumber;
  String district;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
               margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
     child:Card(
        elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child:Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

                        child:
                        Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
               margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                              child:Text(name,
                              style: TextStyle(
                                       
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                              
                            ),
                            SizedBox(height:5.0),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
               margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),

                              child:Text(cnumber,
                               style: TextStyle(
                                       
                                        fontSize: 13.0,
                                        
                                      )),),
                          ],),
                          SizedBox(width:15.0),
                          
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
               margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                            child:Text(district,
                            style:TextStyle(
                                       
                                        fontSize: 20.0,
                                      //  fontWeight: FontWeight.bold,
                                      )),
                            ),
                        ],)
                )
     )
    );
  }
}
