import 'package:flutter/material.dart';

class VolunteerReg extends StatelessWidget {
  const VolunteerReg({Key? key}) : super(key: key);

  @override
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
                         // controller: _controllerdescription,
                         
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
                         // controller: _controllerdescription,
                         
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
                         // controller: _controllerdescription,
                         
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
                         // controller: _controllerdescription,
                         
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
                         // controller: _controllerdescription,
                         
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
                         // controller: _controllerdescription,
                         
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
                            
                              }
                             
                            
                          ))
                ]),
            )),
          ),
    );
  }
}
