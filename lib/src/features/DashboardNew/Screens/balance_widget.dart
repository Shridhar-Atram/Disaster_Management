import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * .8,
              padding: EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/image23.png"),
                  //fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Stack(alignment: Alignment.bottomRight, children: <Widget>[
            // Max Size
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.red.shade50,
              ),
              alignment: const Alignment(1, 1),
              height: 400,
              width: 350,
              child: Column(
                children: const [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 40, 100, 40),
                    child: Text(
                      "Summer  Collections",
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xff262626),
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 270, 100),
                    child: Text(
                      "Sizes",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff262626),
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(230, 110, 0, 40),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Add to Cart ",
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(20))),
                    padding: const EdgeInsets.all(15)),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
