import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'fullnotify.dart';

class Latestnew extends StatefulWidget {
  const Latestnew({Key? key}) : super(key: key);

  @override
  _LatestnewState createState() => _LatestnewState();
}

class _LatestnewState extends State<Latestnew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('notify').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: CircularProgressIndicator()
                    //Text('Error: ${snapshot.error}'),
                    );
              }
              return Container(
                margin:
                    EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: snapshot.data!.docs
                        .map<Widget>((DocumentSnapshot document) {
                      String url = document['url'];
                      String name = document['name'];
                      String link = document['link'];
                      String des = document['des'];
                      String l2 = document['l2'];
                      String link2 = document['link2'];
                      String url2 = document['url2'];
                      String url3 = document['url3'];
                      String url4 = document['url4'];

                      String l = document['l'];
                      return SingleChildScrollView(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Notifull(url, link, name,
                                    des, l2, link2, url2, url3, url4)));
                          },
                          child: Container(
                            color: Colors.white,
                            margin: EdgeInsets.all(5),
                            height: 300,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Hero(
                                              tag: url,
                                              child: new FadeInImage(
                                                image: new NetworkImage(url),
                                                fit: BoxFit.fill,
                                                placeholder: new AssetImage(
                                                  "assets/lo.gif",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(12)),
                                          child: Container(
                                            color: Colors.yellow[50],
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.black,
                                              highlightColor:
                                                  Colors.yellow.shade500,
                                              loop: 700,
                                              enabled: true,
                                              child: Text(
                                                l,
                                                style: TextStyle(
                                                    color: Colors.green[700],
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Center(
                                  child: Container(
                                      margin: EdgeInsets.only(
                                        left: 25,
                                        right: 20,
                                      ),
                                      child: Text(
                                        name,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      )),
                                ))
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
