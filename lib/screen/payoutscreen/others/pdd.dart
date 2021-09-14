import 'package:badabusiness/screen/payoutscreen/community/cummunityfull.dart';
import 'package:badabusiness/screen/registration/payment.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Pdd extends StatefulWidget {
  String url;
  String deg;
  String des;
  String name;

  Pdd(this.url, this.deg, this.des, this.name);

  @override
  _PddState createState() => _PddState();
}

class _PddState extends State<Pdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.orange[100],
        centerTitle: true,
        title: Text(
          "Pro. ${widget.name} ",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                height: 300,
                width: 300,
                child: Container(
                    height: 200,
                    child: Hero(
                        tag: widget.name,
                        child: Image.network(
                          widget.url,
                          fit: BoxFit.fill,
                        ))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(widget.deg,
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(widget.des,
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
            ),
            conn(context),
            youTubee(context)
          ],
        ),
      ),
    );
  }
}
