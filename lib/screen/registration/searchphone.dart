import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

import 'qna.dart';

// ignore: must_be_immutable
class Searchcode extends StatefulWidget {
  String phone;
  Searchcode(this.phone);

  _SearchcodeState createState() => _SearchcodeState();
}

class _SearchcodeState extends State<Searchcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   actions: [
      //     IconButton(icon: Icon(Icons.filter), onPressed: () {}),
      //   ],
      // ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("pay")
                .where("number", isEqualTo: widget.phone)
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
                    String number = document['number'];
                    String email = document['email'];
                    String follow = document['follow'];
                    String memory = document['memory'];
                    return SingleChildScrollView(
                      child: InkWell(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => Customer(
                          //         number,
                          //         email,
                          //         memory,
                          //         follow,
                          //       )));
                        },
                        child: Card(
                          color: Colors.blue[50],
                          child: Container(
                            // margin: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Text(
                                  "$email",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Center(
                                            child: Text(
                                              "$number",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            "Code:$memory",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Text("Memory: $memory")),
                                // Divider(
                                //   height: 1,
                                //   color: Colors.blue,
                                // ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Text(
                                    "$follow",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),

                                SizedBox(
                                  height: 50,
                                ),

                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Questionscreen()));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(16),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                            Colors.green.shade100,
                                            Colors.green.shade200
                                          ])),
                                          child: Container(

                                              // width: MediaQuery.of(context).size.width - 10,
                                              child: Center(
                                                  child: Text(
                                            "Access your Course Now and Enhance Learning",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ))),
                                        ),
                                      ),
                                    )),

                                Image.network(
                                    'https://assets.badabusiness.com/1/3-v1610808287.jpg')
                              ],
                            ),
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
      //   label: Text("refresh"),
      //   onPressed: () {
      //     Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (context) => Crm2()));
      //   },
      // ),
    );
  }
}
