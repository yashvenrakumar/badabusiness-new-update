import 'dart:ui';

import 'package:badabusiness/screen/payoutscreen/others/fullimage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_youtube/flutter_youtube.dart';

class Questionscreen extends StatefulWidget {
  @override
  _QuestionscreenState createState() => _QuestionscreenState();
}

class _QuestionscreenState extends State<Questionscreen> {
  void playYoutubeVideo(String link) {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: "AIzaSyDkFglQqKScd51nSR1TKkn5se28y4GhMd4",
      videoUrl: link,
      backgroundColor: Colors.yellow[50],
      fullScreen: true,
      autoPlay: true,
      appBarVisible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Call Now 8887694282 to Join Bada Business",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        backgroundColor: Colors.amber[50]!..withOpacity(.5),
        elevation: 1,
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('askq')
                .orderBy("date", descending: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              return Container(
                color: Colors.white,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: snapshot.data!.docs
                      .map<Widget>((DocumentSnapshot document) {
                    // String name = document['name'];
                    // String number = document['number'];
                    String categary = document['categary'];

                    String question = document['question'];
                    String url = document['url'];

                    String url2 = document['url2'];
                    String url3 = document['url3'];
                    String url4 = document['url4'];
                    String url5 = document['url5'];
                    String url6 = document['url6'];
                    String url7 = document['url7'];

                    String link = document['link'];

                    String link2 = document['link2'];
                    String link3 = document['link3'];
                    String link4 = document['link4'];
                    String link5 = document['link5'];

                    String ans = document['ans'];
                    String ans2 = document['ans2'];
                    String ans3 = document['ans3'];
                    String ans4 = document['ans4'];
                    String ans5 = document['ans5'];
                    String ans6 = document['ans6'];
                    String ans7 = document['ans7'];
                    String ans8 = document['ans8'];
                    String ans9 = document['ans9'];
                    String ans10 = document['ans10'];
                    String ans11 = document['ans11'];
                    String ans12 = document['ans12'];

                    // String plan = document['plan'];
                    // String yecode = document['yecode'];
                    // String zfu5 = document['zfu5'];

                    return SingleChildScrollView(
                      child: InkWell(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => Customer(
                          //         name,
                          //         number,
                          //         email,
                          //         memory,
                          //         follow,
                          //         docid,
                          //         price,
                          //         plan,
                          //         yecode,
                          //         zfu5)));
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(5, 12, 5, 12),
                          child: Column(
                            children: [
                              Card(
                                color: Colors.white,
                                elevation: 9,
                                shadowColor: Colors.yellow[50],
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          child: Image.network(
                                              'https://firebasestorage.googleapis.com/v0/b/badabusiness-6ec0b.appspot.com/o/story%2Fgra3.png?alt=media&token=ac777af5-bccd-41ab-a594-362d3785203a')),
                                    ),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                            child: CircleAvatar(
                                          minRadius: 40,
                                          maxRadius: 50,
                                          backgroundColor: Colors.amber[50],
                                        ))),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                            child: CircleAvatar(
                                          minRadius: 30,
                                          maxRadius: 40,
                                          backgroundColor: Colors.amber[100],
                                        ))),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                            child: CircleAvatar(
                                          minRadius: 20,
                                          maxRadius: 30,
                                          backgroundColor: Colors.amber[200],
                                        ))),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                            child: CircleAvatar(
                                          minRadius: 40,
                                          maxRadius: 50,
                                          backgroundColor: Colors.amber[50],
                                        ))),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                            child: CircleAvatar(
                                          minRadius: 30,
                                          maxRadius: 40,
                                          backgroundColor: Colors.amber[100],
                                        ))),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                            child: CircleAvatar(
                                          minRadius: 20,
                                          maxRadius: 30,
                                          backgroundColor: Colors.amber[200],
                                        ))),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          Text(
                                            "Q&A Session  ..? ",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          Text(
                                            "Categary : $categary  ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  15, 10, 15, 10),
                                              child: Text(
                                                "Question : $question",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          ExpansionTile(
                                            collapsedBackgroundColor: Colors
                                                .amber[50]!
                                                .withOpacity(.4),
                                            backgroundColor: Colors.amber[50]!
                                                .withOpacity(.5),
                                            title: Text(
                                              "Answer...",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            children: <Widget>[
                                              ListTile(
                                                leading: Icon(
                                                  Icons.account_box,
                                                  size: 30,
                                                ),
                                                title: Text(
                                                    'Yashvendra Kumar \n(Business Consultant )'),
                                                subtitle:
                                                    Text('Call Now 8887694282'),
                                              ),
                                              ExpansionTile(
                                                collapsedBackgroundColor: Colors
                                                    .green[50]!
                                                    .withOpacity(.5),
                                                backgroundColor: Colors
                                                    .green[50]!
                                                    .withOpacity(.5),
                                                title: Text(
                                                  "Our Answer",
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                children: <Widget>[
                                                  //Answer Here by heading wise
                                                  Center(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              20, 5, 20, 5),
                                                      child: Text(
                                                        '$ans',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23),
                                                      ),
                                                    ),
                                                  ),

                                                  Image.network(url5),
                                                  Center(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              20, 5, 20, 5),
                                                      child: Text(
                                                        ' $ans2',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ),

                                                  Center(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              20, 5, 20, 5),
                                                      child: Text(
                                                        ' $ans3',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              20, 5, 20, 5),
                                                      child: Text(
                                                        '$ans4',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ),
                                                  Image.network(url6),
                                                  Center(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              20, 5, 20, 5),
                                                      child: Text(
                                                        '$ans5',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              20, 5, 20, 5),
                                                      child: Text(
                                                        '$ans6',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ),

                                                  Image.network(url7),

                                                  Center(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              20, 5, 20, 5),
                                                      child: Text(
                                                        '$ans7',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              20, 5, 20, 5),
                                                      child: Text(
                                                        '$ans8',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              20, 5, 20, 5),
                                                      child: Text(
                                                        '$ans9',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ),

                                                  Center(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              20, 5, 20, 5),
                                                      child: Text(
                                                        '$ans10',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ),

                                                  Center(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              20, 5, 20, 5),
                                                      child: Text(
                                                        '$ans11',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ),

                                                  Center(
                                                      child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        20, 5, 20, 5),
                                                    child: Text(
                                                      '$ans12',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18),
                                                    ),
                                                  )),
                                                ],
                                              ),
                                              ExpansionTile(
                                                collapsedBackgroundColor: Colors
                                                    .blue[50]!
                                                    .withOpacity(.5),
                                                backgroundColor: Colors
                                                    .blue[50]!
                                                    .withOpacity(.5),
                                                subtitle: Text(
                                                  "Our Billionaires Professors",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                title: Text(
                                                  "Professors Associated",
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                children: <Widget>[
                                                  // professor Images provides
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Full(
                                                                          url)));
                                                    },
                                                    child: Card(
                                                      child: Container(
                                                        color: Colors.white,
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: Container(
                                                          child:
                                                              new FadeInImage(
                                                            image:
                                                                new NetworkImage(
                                                                    url),
                                                            placeholder:
                                                                new AssetImage(
                                                              "assets/lo.gif",
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Full(
                                                                          url2)));
                                                    },
                                                    child: Card(
                                                      child: Container(
                                                        color: Colors.white,
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: Container(
                                                          child:
                                                              new FadeInImage(
                                                            image:
                                                                new NetworkImage(
                                                                    url2),
                                                            placeholder:
                                                                new AssetImage(
                                                              "assets/lo.gif",
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Full(
                                                                          url3)));
                                                    },
                                                    child: Card(
                                                      child: Container(
                                                        color: Colors.white,
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: Container(
                                                          child:
                                                              new FadeInImage(
                                                            image:
                                                                new NetworkImage(
                                                                    url3),
                                                            placeholder:
                                                                new AssetImage(
                                                              "assets/lo.gif",
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Full(
                                                                          url4)));
                                                    },
                                                    child: Card(
                                                      child: Container(
                                                        color: Colors.white,
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: Container(
                                                          child:
                                                              new FadeInImage(
                                                            image:
                                                                new NetworkImage(
                                                                    url4),
                                                            placeholder:
                                                                new AssetImage(
                                                              "assets/lo.gif",
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              ExpansionTile(
                                                collapsedBackgroundColor: Colors
                                                    .red[50]!
                                                    .withOpacity(.5),
                                                backgroundColor: Colors.red[50]!
                                                    .withOpacity(.5),
                                                title: Text(
                                                  "Reference Videos",
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                children: <Widget>[
                                                  InkWell(
                                                    onTap: () {
                                                      String lin =
                                                          'https://www.youtube.com/watch?v=$link';
                                                      playYoutubeVideo(lin);
                                                    },
                                                    child: Container(
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                              child: Image.network(
                                                                  'https://i.ytimg.com/vi/$link/maxresdefault.jpg'),
                                                            ),
                                                          ),
                                                          // Align(
                                                          //   alignment:
                                                          //       Alignment(-1, -1),
                                                          //   child: link != null
                                                          //       ? Icon(
                                                          //           Icons
                                                          //               .play_arrow,
                                                          //           color:
                                                          //               Colors.red,
                                                          //           size: 50,
                                                          //         )
                                                          //       : null,
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      String lin2 =
                                                          'https://www.youtube.com/watch?v=$link2';
                                                      playYoutubeVideo(lin2);
                                                    },
                                                    child: Container(
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                              child: Image.network(
                                                                  'https://i.ytimg.com/vi/$link2/maxresdefault.jpg'),
                                                            ),
                                                          ),
                                                          // Align(
                                                          //   alignment:
                                                          //       Alignment(-1, -1),
                                                          //   child: link2 != null
                                                          //       ? Icon(
                                                          //           Icons
                                                          //               .play_arrow,
                                                          //           color:
                                                          //               Colors.red,
                                                          //           size: 50,
                                                          //         )
                                                          //       : null,
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      String lin3 =
                                                          'https://www.youtube.com/watch?v=$link3';
                                                      playYoutubeVideo(lin3);
                                                    },
                                                    child: Container(
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                              child: Image.network(
                                                                  'https://i.ytimg.com/vi/$link3/maxresdefault.jpg'),
                                                            ),
                                                          ),
                                                          // Align(
                                                          //   alignment:
                                                          //       Alignment(-1, -1),
                                                          //   child: link3 != null
                                                          //       ? Icon(
                                                          //           Icons
                                                          //               .play_arrow,
                                                          //           color:
                                                          //               Colors.red,
                                                          //           size: 50,
                                                          //         )
                                                          //       : null,
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      String lin4 =
                                                          'https://www.youtube.com/watch?v=$link4';
                                                      playYoutubeVideo(lin4);
                                                    },
                                                    child: Container(
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                              child: Image.network(
                                                                  'https://i.ytimg.com/vi/$link4/maxresdefault.jpg'),
                                                            ),
                                                          ),
                                                          // Align(
                                                          //   alignment:
                                                          //       Alignment(-1, -1),
                                                          //   child: link4 != null
                                                          //       ? Icon(
                                                          //           Icons
                                                          //               .play_arrow,
                                                          //           color:
                                                          //               Colors.red,
                                                          //           size: 50,
                                                          //         )
                                                          //       : null,
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      String lin5 =
                                                          'https://www.youtube.com/watch?v=$link5';
                                                      playYoutubeVideo(lin5);
                                                    },
                                                    child: Container(
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                              child: Image.network(
                                                                  'https://i.ytimg.com/vi/$link5/maxresdefault.jpg'),
                                                            ),
                                                          ),
                                                          // Align(
                                                          //   alignment:
                                                          //       Alignment(-1, -1),
                                                          //   child: link5 != null
                                                          //       ? Icon(
                                                          //           Icons
                                                          //               .play_arrow,
                                                          //           color:
                                                          //               Colors.red,
                                                          //           size: 50,
                                                          //         )
                                                          //       : null,
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Container(
                              //   height: 70,
                              //   child: StreamBuilder<QuerySnapshot>(
                              //       stream: Firestore.instance
                              //           .collection('afm')
                              //           .document('sXvYANpl7hzWIelcZac1')
                              //           .collection('earphone')
                              //           .snapshots(),
                              //       builder: (BuildContext context,
                              //           AsyncSnapshot<QuerySnapshot> snapshot) {
                              //         if (snapshot.hasError) {
                              //           return Center(
                              //             child:
                              //                 Text('Error: ${snapshot.error}'),
                              //           );
                              //         }
                              //         return Container(
                              //           color: Colors.white,
                              //           child: ListView(
                              //             scrollDirection: Axis.horizontal,
                              //             children: snapshot.data.documents
                              //                 .map<Widget>(
                              //                     (DocumentSnapshot document) {
                              //               String url = document['url'];
                              //               // String name = document['name'];
                              //               // String link = document['link'];

                              //               return SingleChildScrollView(
                              //                 child: InkWell(
                              //                   onTap: () {
                              //                     Navigator.of(context).push(
                              //                         MaterialPageRoute(
                              //                             builder: (context) =>
                              //                                 Earphone()));
                              //                   },
                              //                   child: Container(
                              //                     height: 70,
                              //                     width: 80,
                              //                     color: Colors.white,
                              //                     child: FadeInImage(
                              //                       image:
                              //                           new NetworkImage(url),
                              //                       fit: BoxFit.fill,
                              //                       placeholder: new AssetImage(
                              //                         "assets/lo.gif",
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ),
                              //               );
                              //             }).toList(),
                              //           ),
                              //         );
                              //       }),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Colors.black87,
      //   isExtended: true,
      //   label: Text(
      //     'Ask Question..?',
      //     style: TextStyle(color: Colors.white, fontSize: 20),
      //   ),
      //   onPressed: () {
      //     Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (context) => AskQuestion()));
      //   },
      // ),
    );
  }
}
