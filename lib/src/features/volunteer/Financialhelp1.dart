import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:http/http.dart' as http;

import 'model/razorpay_response_model.dart';
//import 'razorpay_credentials.dart';
import 'razorpay_credentials.dart' as razorCredentials;

class Financialhelp1 extends StatefulWidget {
 const  Financialhelp1({Key? key}) : super(key: key);

  @override
  _Financialhelp1State createState() => _Financialhelp1State();
}

class _Financialhelp1State extends State<Financialhelp1> {
  //late TextEditingController amount = TextEditingController();
  Razorpay? _razorpay;
  TextEditingController amount = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();

  
  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Fluttertoast.showToast(msg: " Payment Successfully");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "Payment Successfully");
  }

  Future<dynamic> createOrder() async {
    var mapHeader = <String, String>{};
    String username = razorCredentials.keyId;
    String password = razorCredentials.keySecret;
    mapHeader['Authorization'] =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    mapHeader['Accept'] = "application/json";
    mapHeader['Content-Type'] = "application/x-www-form-urlencoded";
    var map = <String, String>{};
    setState(() {
      map['amount'] = "${(num.parse(amount.text) * 100)}";
    });
    map['currency'] = "INR";
    map['receipt'] = "receipt1";
    print("map $map");
    var response = await http.post(Uri.https("api.razorpay.com", "/v1/orders"),
        headers: mapHeader, body: map);
    print("...." + response.body);
    if (response.statusCode == 200) {
      RazorpayOrderResponse data =
          RazorpayOrderResponse.fromJson(json.decode(response.body));
      openCheckout(data);
    } else {
      Fluttertoast.showToast(msg: "Something went wrong!");
    }
  }

  void openCheckout(RazorpayOrderResponse data) async {
    var options = {
      'key': razorCredentials.keyId,
      'amount': "${(num.parse(amount.text) * 100)}",
      'name': 'Disaster Management',
      'description': 'Help in need',
      'order_id': '${data.id}',
    };

    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Pay to help"),
                backgroundColor: Colors.green[800]!,
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(7, 7, 4, 4),
                          padding: EdgeInsets.all(4.0),
                        child: Text("We are all in this Together!!"
                      , style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800]!),
                    )),
                    SizedBox(height:20),
                    Container(
                      child: Form(
                        key: key,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(4, 10, 4, 4),
                          padding: EdgeInsets.all(1.0),
                          child: TextFormField(
                            controller: amount,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800]!),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.monetization_on),
                              prefixIconColor: Colors.green[800]!,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 2.0, top: 14.0),
                              hintText: 'Enter amount to pay ',
                              focusColor: Color.fromARGB(255, 109, 189, 106),
                              //  border: OutlineInputBorder(),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.grey[300],
                              //  focusColor: Colors.grey,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.green[800]!),
                                  borderRadius: BorderRadius.circular(25.7)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Color.fromARGB(255, 237, 235, 235)),
                                borderRadius: new BorderRadius.circular(25.7),
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter amount';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 3),
                        decoration: BoxDecoration(
                            color: Colors.green[800]!,
                            borderRadius: BorderRadius.circular(30)),
                        child: InkWell(
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text('PAY',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            onTap: () async {
                              createOrder();
                            }))
                  ],
                ),
              ),
            );
  }
}