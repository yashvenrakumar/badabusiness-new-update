import 'package:badabusiness/screen/payoutscreen/show.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'searchphone.dart';

class Paymentt extends StatefulWidget {
  @override
  _PaymenttState createState() => _PaymenttState();
}

class _PaymenttState extends State<Paymentt> {
  TextEditingController _number = TextEditingController();
  TextEditingController _email = TextEditingController();
  // ignore: unused_field
  static const platform = const MethodChannel("razorpay_flutter");

  late Razorpay _razorpay;

  void _handlePaymentSuccess(PaymentSuccessResponse? response) {
    Fluttertoast.showToast(msg: "SUCCESS: " + response!.paymentId!);

    FirebaseFirestore.instance.collection('pay').doc('${_number.text}').set({
      "number": _number.text,
      "email": _email.text,
      "date": DateTime.now(),
      "memory": "memory",
      "follow": "Follow up customer",
      'payid': response.paymentId,
      'signature': response.signature,
      'orderid': response.orderId
    });
  }

  void _handlePaymentError(PaymentFailureResponse? response) {
    Fluttertoast.showToast(
      msg: "ERROR: " + response!.code.toString() + " - " + response.message!,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse? response) {
    Fluttertoast.showToast(
      msg: "EXTERNAL_WALLET: " + response!.walletName!,
    );
  }

  void openCheckout(number, email) async {
    var options = {
      'key': 'rzp_live_WFkopKkgIV06Cr',
      'amount': 14900,
      'name': 'Q&A',
      'description': 'Question Answer Session',
      'image': 'https://payments.badabusiness.com/images/badabusinesslogo1.png',
      'prefill': {'contact': number, 'email': email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(
      Razorpay.EVENT_PAYMENT_SUCCESS,
      _handlePaymentSuccess,
    );

    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
              margin: EdgeInsets.all(16),
              child: Image.asset("assets/bada.png")),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextFormField(
              controller: _number,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                icon: const Icon(
                  Icons.person,
                  color: Colors.yellow,
                ),
                hintText: 'Enter Your Phone Number',
                labelText: 'Enter Number',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                icon: const Icon(
                  Icons.mail,
                  color: Colors.yellow,
                ),
                hintText: 'Enter Your Email Id',
                labelText: 'Enter email',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          // Card(
          //   // ignore: deprecated_member_use
          //   child: RaisedButton(
          //       elevation: 9,
          //       color: Colors.white,
          //       onPressed: () {
          //         String number = _number.text;
          //         String email = _email.text;

          //         try {
          //           openCheckout(number, email);
          //         } catch (e) {}
          //       },
          //       child: Text('Pay Now Only Rs: 99/-')),
          // ),
          InkWell(
              onTap: () {
                String number = _number.text;
                String email = _email.text;

                try {
                  openCheckout(number, email);
                } catch (e) {}
              },
              child: Container(
                margin: EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.green.shade100,
                      Colors.green.shade50
                    ])),
                    child: Container(
                        height: 50,
                        // width: MediaQuery.of(context).size.width - 10,
                        child: Center(
                            child: Text(
                          "Pay Now Only Rs: 149/-",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ))),
                  ),
                ),
              )),

          // ignore: deprecated_member_use
          SizedBox(
            height: 30,
            child: Center(child: Text('Or')),
          ),

          InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Loginn()));
              },
              child: Container(
                margin: EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.green.shade100,
                      Colors.green.shade50
                    ])),
                    child: Container(
                        height: 50,
                        margin: EdgeInsets.only(
                            left: 30, right: 20, bottom: 5, top: 5),
                        child: Center(
                            child: Text(
                          "Login here with register mobile number",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ))),
                  ),
                ),
              )),

          // Card(
          //   // ignore: deprecated_member_use
          //   child: RaisedButton(
          //       elevation: 9,
          //       color: Colors.white,
          //       onPressed: () {
          //         Navigator.of(context)
          //             .push(MaterialPageRoute(builder: (context) => Loginn()));
          //       },
          //       child: Text('Login here with register mobile number')),
          // ),
          SizedBox(
            height: 60,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.red[50],
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: Text(
                    "Good News : it is 100% Refundable if you join Everything About Entrepreneurship (EAE) Program, Become an Independent Business Consultant (IBC) Model, Problem Solving Courses (PSC) and any digital product of bada business pvt ltd. \n\nAny Doubt than Call Our Business Consutant \nPurshotam Kumar \n +91 7549135542 \n purshotambussinessconsultant@gmail.com ",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),

          youTubee(context)
        ])),
      ),
    );
  }
}

class Loginn extends StatefulWidget {
  @override
  _LoginnState createState() => _LoginnState();
}

class _LoginnState extends State<Loginn> {
  TextEditingController _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
              margin: EdgeInsets.all(16),
              child: Image.asset("assets/bada.png")),
          InkWell(
            onTap: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => Crm2()));
            },
            child: Card(
              child: Container(
                height: 80,
                child: Center(
                  child: Text(
                    "Welcome Q&A Session",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 15, 10, 0),
            color: Colors.white,
            child: TextFormField(
              controller: _phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                hintText: 'Enter Your Number',
                labelText: 'Enter Register Number',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          InkWell(
              onTap: () {
                String phone = _phone.text;
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Searchcode(phone)));
              },
              child: Container(
                margin: EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.green.shade100,
                      Colors.orange.shade50
                    ])),
                    child: Container(
                      height: 50,
                      // width: MediaQuery.of(context).size.width - 10,
                      child: Center(
                        child: Text(
                          "Login Here ...!!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              )),

          // Container(
          //   height: 60,
          //   child: StreamBuilder<QuerySnapshot>(
          //       stream: Firestore.instance.collection('pay').snapshots(),
          //       builder: (BuildContext context,
          //           AsyncSnapshot<QuerySnapshot> snapshot) {
          //         if (snapshot.hasError) {
          //           return Center(
          //             child: Text('Error: ${snapshot.error}'),
          //           );
          //         }
          //         return Container(
          //           margin: EdgeInsets.all(10),
          //           child: Container(
          //             height: 90,
          //             color: Colors.white,
          //             child: Column(
          //               children: snapshot.data.documents
          //                   .map<Widget>((DocumentSnapshot document) {
          //                 String number = document['number'];

          //                 return SingleChildScrollView(
          //                   child: InkWell(
          //                     onTap: () {
          //                       String phone = _phone.text;
          //                       if (phone == number) {
          //                         Fluttertoast.showToast(
          //                           msg: "Welcome our question answer session",
          //                         );
          //                         Navigator.of(context).push(MaterialPageRoute(
          //                             builder: (context) => Questionscreen()));
          //                       } else {
          //                         Fluttertoast.showToast(
          //                           msg:
          //                               "first pay than login registered mobile number",
          //                         );
          //                         Navigator.of(context).push(MaterialPageRoute(
          //                             builder: (context) => Paymentt()));
          //                       }

          //                       //   Navigator.of(context).push(MaterialPageRoute(
          //                       //       builder: (context) => Notifull(
          //                       //)));
          //                     },
          //                     child: Container(
          //                       height: 500,
          //                       color: Colors.red[50],
          //                       child: Center(
          //                           child: Card(
          //                               color: Colors.red[50],
          //                               child: Center(
          //                                   child: Container(
          //                                       height: 40,
          //                                       child: Text(
          //                                         "Login With Number",
          //                                         style: TextStyle(
          //                                             fontSize: 20,
          //                                             fontWeight:
          //                                                 FontWeight.bold),
          //                                       ))))),
          //                     ),
          //                   ),
          //                 );
          //               }).toList(),
          //             ),
          //           ),
          //         );
          //       }),
          // ),
          youTubee(context)
        ],
      ),
    );
  }
}

Widget youTubee(BuildContext context) {
  void playYoutubeVideo(String url) {
    FlutterYoutube.playYoutubeVideoByUrl(
        apiKey: "AIzaSyDkFglQqKScd51nSR1TKkn5se28y4GhMd4",
        videoUrl: url,
        backgroundColor: Colors.yellow[50],
        fullScreen: true,
        autoPlay: true,
        appBarVisible: false,
        appBarColor: Colors.yellow[100]);
  }

  return Container(
      child: Container(
    height: 6 * 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: <Color>[Colors.orange.shade100, Colors.white]),
    ),
    margin: EdgeInsets.only(left: 10),
    child: Column(
      children: [
        Expanded(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        "Motivation ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: moti.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            playYoutubeVideo(moti[index].link);
                          },
                          child: Container(
                            width: 300,
                            margin: EdgeInsets.only(
                              left: 6,
                              right: 6,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: moti[index].url.isEmpty
                                        ? CircularProgressIndicator()
                                        : FadeInImage(
                                            image: new NetworkImage(
                                                moti[index].url),
                                            fit: BoxFit.fill,
                                            placeholder: new AssetImage(
                                              "assets/lo.gif",
                                            ),
                                          ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10, right: 5),
                                    child: Center(
                                      child: Text(
                                        moti[index].name,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        "HUMAN RESOURCE",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: hr.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            playYoutubeVideo(hr[index].link);
                          },
                          child: Container(
                            width: 300,
                            margin: EdgeInsets.only(
                              left: 6,
                              right: 6,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: hr[index].url.isEmpty
                                        ? CircularProgressIndicator()
                                        : FadeInImage(
                                            image:
                                                new NetworkImage(hr[index].url),
                                            fit: BoxFit.fill,
                                            placeholder: new AssetImage(
                                              "assets/lo.gif",
                                            ),
                                          ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10, right: 5),
                                    child: Center(
                                      child: Text(
                                        hr[index].name,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        "LEADERSHIP",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: leadership.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            playYoutubeVideo(leadership[index].link);
                          },
                          child: Container(
                            width: 300,
                            margin: EdgeInsets.only(
                              left: 6,
                              right: 6,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: leadership[index].url.isEmpty
                                        ? CircularProgressIndicator()
                                        : FadeInImage(
                                            image: new NetworkImage(
                                                leadership[index].url),
                                            fit: BoxFit.fill,
                                            placeholder: new AssetImage(
                                              "assets/lo.gif",
                                            ),
                                          ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10, right: 5),
                                    child: Center(
                                      child: Text(
                                        leadership[index].name,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        "MANAGEMENT",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: management.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            playYoutubeVideo(management[index].link);
                          },
                          child: Container(
                            width: 300,
                            margin: EdgeInsets.only(
                              left: 6,
                              right: 6,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: management[index].url.isEmpty
                                        ? CircularProgressIndicator()
                                        : FadeInImage(
                                            image: new NetworkImage(
                                                management[index].url),
                                            fit: BoxFit.fill,
                                            placeholder: new AssetImage(
                                              "assets/lo.gif",
                                            ),
                                          ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10, right: 5),
                                    child: Center(
                                      child: Text(
                                        management[index].name,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        "MARKET",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: market.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            playYoutubeVideo(market[index].link);
                          },
                          child: Container(
                            width: 300,
                            margin: EdgeInsets.only(
                              left: 6,
                              right: 6,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: market[index].url.isEmpty
                                        ? CircularProgressIndicator()
                                        : FadeInImage(
                                            image: new NetworkImage(
                                                market[index].url),
                                            fit: BoxFit.fill,
                                            placeholder: new AssetImage(
                                              "assets/lo.gif",
                                            ),
                                          ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10, right: 5),
                                    child: Center(
                                      child: Text(
                                        market[index].name,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        "SALE",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sale.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            playYoutubeVideo(sale[index].link);
                          },
                          child: Container(
                            width: 300,
                            margin: EdgeInsets.only(
                              left: 6,
                              right: 6,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: sale[index].url.isEmpty
                                        ? CircularProgressIndicator()
                                        : FadeInImage(
                                            image: new NetworkImage(
                                                sale[index].url),
                                            fit: BoxFit.fill,
                                            placeholder: new AssetImage(
                                              "assets/lo.gif",
                                            ),
                                          ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10, right: 5),
                                    child: Center(
                                      child: Text(
                                        sale[index].name,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        "STRATEGY",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: moti.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            playYoutubeVideo(strategy[index].link);
                          },
                          child: Container(
                            width: 300,
                            margin: EdgeInsets.only(
                              left: 6,
                              right: 6,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: strategy[index].url.isEmpty
                                        ? CircularProgressIndicator()
                                        : FadeInImage(
                                            image: new NetworkImage(
                                                strategy[index].url),
                                            fit: BoxFit.fill,
                                            placeholder: new AssetImage(
                                              "assets/lo.gif",
                                            ),
                                          ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10, right: 5),
                                    child: Center(
                                      child: Text(
                                        strategy[index].name,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ));
}
