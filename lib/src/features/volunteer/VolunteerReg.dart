import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class VolunteerReg extends StatefulWidget {
   VolunteerReg({Key? key}) : super(key: key);

  @override
   State<VolunteerReg> createState() => _VolunteerRegState();
}
class _VolunteerRegState extends State<VolunteerReg>{
   TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerCnumber = TextEditingController();
  TextEditingController _controllerState = TextEditingController();
  TextEditingController _controllerDistrict = TextEditingController();
  TextEditingController _controllerAddress = TextEditingController();
  TextEditingController _controllerInterests = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();
  CollectionReference _reference =
      FirebaseFirestore.instance.collection('volunteer_reg');

void clearText() {
  _controllerName.clear();
   _controllerCnumber.clear();
  _controllerState.clear();
  _controllerDistrict.clear();
  _controllerAddress.clear();
  _controllerInterests.clear();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Volunteers Registration')),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.2, vertical: 10.0),
          
            child: SingleChildScrollView(
                child: Form(
                  
              key: key,
              child: Column(
                children: [
                  SizedBox(height:50),
                 Container(
                   margin:EdgeInsets.fromLTRB(4,10,4,4),
                   padding:EdgeInsets.all(1.0),
                          child: TextFormField(
                          controller: _controllerName,
                         
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            prefixIcon:Icon(Icons.person),
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 4.0, top: 10.0),
                            hintText: 'Enter Your Name ',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                            
                          
                          
                      ),
                      SizedBox(height:8.0),
                       Container(
                   margin:EdgeInsets.all(1.0),
                   padding:EdgeInsets.all(1.0),
                          child: TextFormField(
                          controller: _controllerCnumber,
                         
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold,),
                          decoration: InputDecoration(
                            prefixIcon:Icon(Icons.phone),
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 4.0, top: 10.0),
                            hintText: 'Enter Your Contact No ',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Contact No';
                            }
                            return null;
                          },
                        ),
                            
                          
                          
                      ),
                       SizedBox(height:8.0),
                       Container(
                   margin:EdgeInsets.all(1.0),
                   padding:EdgeInsets.all(1.0),
                          child: TextFormField(
                         controller: _controllerState,
                         
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold,),
                          decoration: InputDecoration(
                            prefixIcon:Icon( Icons.location_on_outlined, ),
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 4.0, top: 10.0),
                            hintText: 'Enter State ',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter state';
                            }
                            return null;
                          },
                        ),
                            
                          
                          
                      ),
                       SizedBox(height:8.0),
                       Container(
                   margin:EdgeInsets.all(1.0),
                   padding:EdgeInsets.all(1.0),
                          child: TextFormField(
                          controller: _controllerDistrict,
                         
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold,),
                          decoration: InputDecoration(
                            prefixIcon:Icon( Icons.location_on_outlined, ),
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 4.0, top: 10.0),
                            hintText: 'Enter District ',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter district';
                            }
                            return null;
                          },
                        ),
                        ),
                         SizedBox(height:8.0),
                       Container(
                   margin:EdgeInsets.all(1.0),
                   padding:EdgeInsets.all(1.0),
                          child: TextFormField(
                          controller: _controllerAddress,
                         
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold,),
                          decoration: InputDecoration(
                            prefixIcon:Icon( Icons.location_on, ),
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 4.0, top: 10.0),
                            hintText: 'Enter your Address ',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address';
                            }
                            return null;
                          },
                        ),
                      ),
                       SizedBox(height:8.0),
                       Container(
                   margin:EdgeInsets.all(1.0),
                   padding:EdgeInsets.all(1.0),
                          child: TextFormField(
                          controller: _controllerInterests,
                         
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold,),
                          decoration: InputDecoration(
                            prefixIcon:Icon( Icons.handshake_sharp),
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 4.0, top: 10.0),
                            hintText: 'Your interests to work in ',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter ';
                            }
                            return null;
                          },
                        ),
                      ),
                       SizedBox(height:15.0),
                       Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 13, vertical: 3),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text('Submit',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            onTap: () async {
                               if (key.currentState!.validate()) {
                               
                                String vName = _controllerName.text;
                                String vNumber =
                                    _controllerCnumber.text;
                                     String vState = _controllerState.text;
                                      String vDistrict = _controllerDistrict.text;
                                       String vAddress = _controllerAddress.text;
                                        String vInterests = _controllerInterests.text;

                                Map<String, String> dataToSend = {
                                  'name': vName,
                                  'number': vNumber,
                                  'state': vState,
                                  'district':vDistrict,
                                  'address':vAddress,
                                  'interests': vInterests,
                                 
                                };
                                _reference.add(dataToSend);
                                 clearText();
                              }
                              }
                             
                            
                          ))
                ]),
            )),
          ),
    );
  }
}
