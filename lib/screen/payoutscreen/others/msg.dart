import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

class Msg extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MsgState();
  }
}

class _MsgState extends State<Msg> {
  // ignore: unused_field
  String _message = '';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  void getMessage() {
    // _firebaseMessaging;
  }

  // ignore: unused_element
  _register() {
    _firebaseMessaging.getToken().then((token) => print(token));
  }

  @override
  void initState() {
    super.initState();

    getMessage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
