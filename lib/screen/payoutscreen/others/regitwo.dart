//import 'package:badabusiness/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Regip extends StatefulWidget {
  @override
  _RegipState createState() => _RegipState();
}

class _RegipState extends State<Regip> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _email = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //String dropdownValue = "Select Bada Business Products";
  String dropdownValue = "Select Catagary";
  //String _value;

  void _showScaffold(String message) {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                height: 10,
              ),
              //Image.asset("assets/bada.png"),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.center,
                            colors: <Color>[
                              Colors.orange.shade100,
                              Colors.white
                            ]),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextFormField(
                              controller: _name,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                icon: const Icon(
                                  Icons.person,
                                  color: Colors.yellow,
                                ),
                                hintText: 'Enter your name',
                                labelText: 'Name',
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextFormField(
                              controller: _number,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                icon: const Icon(
                                  Icons.phone,
                                  color: Colors.yellow,
                                ),
                                hintText: 'Enter your phone number',
                                labelText: 'Phone',
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
                                  Icons.email,
                                  color: Colors.yellow,
                                ),
                                hintText: 'Enter your email id',
                                labelText: 'Email',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              width: 300,
                              margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                              child: Center(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: dropdownValue,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 40,
                                  elevation: 16,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  itemHeight: 50,
                                  autofocus: true,
                                  underline: Container(
                                    height: 2,
                                    color: Colors.black,
                                  ),
                                  menuMaxHeight: 300,
                                  dropdownColor: Colors.orange[50],
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  // 'Everything About Entrepreneurship (EAE) Program',
                                  // 'Become an Independent Business Consultant (IBC)',
                                  // 'Problem Solving Courses (PSC)',
                                  // 'Life Time Membership (LTM)',
                                  // 'Business Case Studies on Social Media',
                                  // 'Customized Learning Solutions -White Labeled LMS'
                                  items: <String>[
                                    'Select Catagary',
                                    'Student',
                                    'Professional',
                                    'Entrepreneur',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                value,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          new Container(
                              margin: EdgeInsets.only(left: 80, right: 80),
                              child: Center(
                                // ignore: deprecated_member_use
                                child: new RaisedButton(
                                  color: Colors.orange[200],
                                  child: Text(
                                    'Register Now',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onPressed: () async {
                                    if (_name.text.isNotEmpty &&
                                        _number.text.isNotEmpty &&
                                        _email.text.isNotEmpty) {
                                      FirebaseFirestore.instance
                                          .collection('crm2')
                                          .doc('${_number.text}')
                                          .set({
                                        "name": _name.text,
                                        "nummber": _number.text,
                                        "email": _email.text,
                                        "date": DateTime.now(),
                                        "memory": "memory",
                                        "follow": "Follow up customer",
                                        "docid": '${DateTime.now()}',
                                        "price": '20060',
                                        "plan": dropdownValue,
                                        "yecode": "0000",
                                        "ylcode": "yashoo",
                                        "yesale": "000000",
                                        "yrefe": "yash000",
                                        "ycno": "00000",
                                        "ycdate": "00/00/0000",
                                        "zfu1": "future1",
                                        "zfu2": "future2",
                                        "zfu3": "future3",
                                        "zfu4": "",
                                        "zfu5": "",
                                      }).then((value) => () {
                                                _name.clear();
                                                _number.clear();
                                                _email.clear();
                                                _showScaffold(
                                                    "Congratulation For Registration !!");
                                              });
                                      _showScaffold(
                                          "Congratulation $_name sir in bada business");

                                      register();

                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             BottomNavScreen()));
                                    }

                                    //   await FirebaseFirestore.instance
                                    //       .collection("yashvendra")
                                    //       .doc("1")
                                    //       .set({
                                    //     'title': _name,
                                    //     'phhone': _number,
                                    //     'email': _email
                                    //   });
                                  },
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Center(
                    //   child: Container(
                    //       margin: EdgeInsets.all(20),
                    //       child: Image.asset("assets/images/logo.png")),
                    // ),
                    // Center(
                    //   child: Card(
                    //     margin: EdgeInsets.all(10),
                    //     elevation: 10,
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(15),
                    //         gradient: LinearGradient(
                    //             begin: Alignment.centerLeft,
                    //             end: Alignment.center,
                    //             colors: <Color>[
                    //               Colors.orange.shade100,
                    //               Colors.white
                    //             ]),
                    //       ),
                    //       child: Container(
                    //         margin: EdgeInsets.all(20),
                    //         child: Center(
                    //           child: Text(
                    //             "NOTE : You have an call from bada business team an initiative by Dr Vivek Bindra as soon as possible \n\n\nDr. Vivek Bindra is Founder & CEO of Badabusiness.com. He has solved the burning problems of thousands of entrepreneurs through his problem-solving content. His programs have helped many entrepreneurs in our county to transform their business. In our program, Dr. Vivek Bindra has brought India's leading entrepreneurs as professors who will teach you to solve your business problems and strategies to get growth in the business. As I said these professors are not ordinary people, they are the people who have created billion-dollar businesses themselves like Mr. Manu Jain, MD of Xiaomi India, Mr. Lalit Agarwal chairman and managing director of V-Mart, Dr. Mahesh Gupta chairman Kent RO, etc. ",
                    //             style: TextStyle(
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.w500,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

register() async {
  const url = 'https://www.badabusiness.com/dd/BIYK005702/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// DropdownButton<String>(
//   value: dropdownValue,
//   icon: Icon(Icons.arrow_downward),
//   iconSize: 24,
//   elevation: 16,
//   style: TextStyle(color: Colors.deepPurple),
//   underline: Container(
//     height: 2,
//     color: Colors.deepPurpleAccent,
//   ),
//   onChanged: (String newValue) {
//     setState(() {
//       dropdownValue = newValue;
//     });
//   },
//   items: <String>['Android', 'iOS', 'Symbian', 'Windows','java','blackberry']
//       .map<DropdownMenuItem<String>>((String value) {
//     return DropdownMenuItem<String>(
//       value: value,
//       child: Text(value),
//     );
//   }).toList(),
// );
