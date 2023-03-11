import 'package:flutter/material.dart';
class Distatser extends StatefulWidget {
  const Distatser({super.key}); 
 

  @override
  State<Distatser> createState() => _DistatserState();
}

class _DistatserState extends State<Distatser> {
   List<String>imagesList=[
   'https://unsplash.com/photos/78A265wPiO4', 
   'https://unsplash.com/photos/01_igFr7hd4', 
    'https://unsplash.com/photos/eOpewngf68w', 
    'https://unsplash.com/photos/1Z2niiBPg5A',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
     child:GridView.builder(
      itemCount: imagesList.length,
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, 
        crossAxisSpacing: 10, 
        mainAxisSpacing: 10,
        ),
     
     itemBuilder :(context,index){
        decoration:BorderRadius.circular(15.0);
        image:DecorationImage(
          image:NetworkImage(imagesList[index]), 
          fit: BoxFit.cover );
     }
     ),
    );
  }
}