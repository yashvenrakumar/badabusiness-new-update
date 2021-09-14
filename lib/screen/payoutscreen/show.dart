import 'package:badabusiness/screen/payoutscreen/others/pdd.dart';
import 'package:badabusiness/screen/registration/payment.dart';
import 'package:badabusiness/screen/registration/registration.dart';
import 'package:badabusiness/screen/search/searchbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_youtube/flutter_youtube.dart';
import 'others/fullimage.dart';

class Show extends StatefulWidget {
  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  // ignore: unused_field
  String _platformVersion = 'Unknown';

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterOpenWhatsapp.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              actions: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 110, right: 110, top: 15, bottom: 5),
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
              ],
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.sort_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              pinned: true,
              expandedHeight: 150.0,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  // title: Text("Bada BUsiness",
                  //     textAlign: TextAlign.end,
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 20.0,
                  //         backgroundColor: Colors.white70)),
                  background: Image.asset(
                    "assets/images/i29.png",
                    fit: BoxFit.fill,
                  )),
              backgroundColor: Colors.white,
            ),
            searchbuttion(context),
            pdd(context),
            con(context),
            eaeibc(),
            pro(),
            // pdf(),
            you(context),
            // SliverToBoxAdapter(
            //   child: Container(
            //     height: 400,
            //     color: Colors.black,
            //   ),
            // ),
          ],
        ),
        //drawer: drawer(),
      ),
    );
  }
}

SliverToBoxAdapter eaeibc() {
  void playYoutubeVideo(String namee) {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: "AIzaSyDkFglQqKScd51nSR1TKkn5se28y4GhMd4",
      videoUrl: namee,
      backgroundColor: Colors.yellow[50],
      fullScreen: true,
      autoPlay: true,
      appBarVisible: false,
    );
  }

  return SliverToBoxAdapter(
      child: Container(
          margin: EdgeInsets.only(top: 20, left: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Colors.orange.shade100, Colors.white]),
          ),
          height: 410,
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
                      "EAE Glimpses",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('eaedemo')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        }
                        return Container(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: snapshot.data!.docs
                                .map<Widget>((DocumentSnapshot document) {
                              String url = document['url'];
                              // String name = document['name'];
                              String link = document['link'];

                              return SingleChildScrollView(
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) => Regi()));
                                    playYoutubeVideo(link);
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         Cfull(url, link, name, des)));
                                  },
                                  child: Container(
                                    // height: 250,
                                    width: 280,

                                    margin: EdgeInsets.all(5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: FadeInImage(
                                        image: new NetworkImage(url),
                                        fit: BoxFit.fill,
                                        placeholder: new AssetImage(
                                          "assets/lo.gif",
                                        ),
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
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "IBC Glimpses",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('ibcdemo')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        }
                        return Container(
                          height: 170,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: snapshot.data!.docs
                                .map<Widget>((DocumentSnapshot document) {
                              String url = document['url'];
                              // String name = document['name'];
                              String link = document['link'];

                              return SingleChildScrollView(
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) => Regi()));
                                    playYoutubeVideo(link);
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         Cfull(url, link, name, des)));
                                  },
                                  child: Container(
                                    // height: 250,
                                    width: 280,

                                    margin: EdgeInsets.all(5),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            child: Container(
                                              height: 170,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
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
              )
            ],
          )));
}

SliverToBoxAdapter pro() {
  return SliverToBoxAdapter(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[Colors.red.shade100, Colors.white]),
      ),
      margin: EdgeInsets.only(top: 20, left: 6),
      height: 550,
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 270,
              child: Column(
                children: [
                  Expanded(
                    child: Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 10, bottom: 5),
                          child: Text(
                            "Our Professors",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  professor.length == 0
                      ? CircularProgressIndicator()
                      : Expanded(
                          flex: 9,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: professor.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Full(professor[index])));
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 7, right: 7),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: professor[index].isEmpty
                                                  ? CircularProgressIndicator()
                                                  : FadeInImage(
                                                      image: new NetworkImage(
                                                          professor[index]),
                                                      fit: BoxFit.fill,
                                                      placeholder:
                                                          new AssetImage(
                                                        "assets/lo.gif",
                                                      ),
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
              height: 270,
              child: Column(
                children: [
                  Expanded(
                    child: Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 10, bottom: 5),
                          child: Text(
                            "Dr Vivek Bindra",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  professor.length == 0
                      ? CircularProgressIndicator()
                      : Expanded(
                          flex: 9,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: vivek.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Full(vivek[index])));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 7, right: 7),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: vivek[index].isEmpty
                                                  ? CircularProgressIndicator()
                                                  : FadeInImage(
                                                      image: new NetworkImage(
                                                          vivek[index]),
                                                      fit: BoxFit.fill,
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
                                );
                              }),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

SliverToBoxAdapter pdf() {
  return SliverToBoxAdapter(
    child: Container(
      height: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.centerLeft,
            colors: <Color>[Colors.orange.shade100, Colors.white]),
      ),
      margin: EdgeInsets.only(left: 10, top: 20, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topRight,
                        colors: <Color>[Colors.yellow.shade100, Colors.white]),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3, child: Image.asset("assets/images/i1.png")),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 25, right: 25, bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: <Color>[
                                  Colors.orange.shade100,
                                  Colors.white
                                ]),
                          ),
                          child: Center(
                            child: Text(
                              "IBC Pdf",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topLeft,
                            colors: <Color>[
                              Colors.yellow.shade100,
                              Colors.white
                            ]),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Image.asset("assets/images/i3.png")),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 25, right: 25, bottom: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: <Color>[
                                      Colors.orange.shade100,
                                      Colors.white
                                    ]),
                              ),
                              child: Center(
                                child: Text(
                                  "EAE Pdf",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topRight,
                        colors: <Color>[Colors.yellow.shade100, Colors.white]),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3, child: Image.asset("assets/images/i9.png")),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 25, right: 25, bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: <Color>[
                                  Colors.orange.shade100,
                                  Colors.white
                                ]),
                          ),
                          child: Center(
                            child: Text(
                              "LTM Pdf",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topLeft,
                            colors: <Color>[
                              Colors.yellow.shade100,
                              Colors.white
                            ]),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Image.asset("assets/images/i21.png")),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 25, right: 25, bottom: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: <Color>[
                                      Colors.orange.shade100,
                                      Colors.white
                                    ]),
                              ),
                              child: Center(
                                child: Text(
                                  "PSC Pdf",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topRight,
                        colors: <Color>[Colors.yellow.shade200, Colors.white]),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3, child: Image.asset("assets/images/i19.png")),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 25, right: 25, bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: <Color>[
                                  Colors.yellow.shade100,
                                  Colors.white
                                ]),
                          ),
                          child: Center(
                            child: Text(
                              "WL Pdf",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topLeft,
                        colors: <Color>[Colors.yellow.shade100, Colors.white]),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3, child: Image.asset("assets/images/i25.png")),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 25, right: 25, bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: <Color>[
                                  Colors.orange.shade100,
                                  Colors.white
                                ]),
                          ),
                          child: Center(
                            child: Text(
                              "Contact",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

SliverToBoxAdapter pdd(BuildContext context) {
  return SliverToBoxAdapter(
    child: Container(
      height: 60,
      margin: EdgeInsets.only(bottom: 7, left: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: pd.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Pdd(pd[index].url, pd[index].deg,
                        pd[index].des, pd[index].name)));
              },
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Hero(
                    tag: pd[index].name,
                    child: FadeInImage(
                        placeholder: AssetImage("assets/lo.gif"),
                        image: NetworkImage(pd[index].url)),
                  ),
                  maxRadius: 30,
                  minRadius: 30,
                ),
              ),
            );
          }),
    ),
  );
}

SliverToBoxAdapter con(BuildContext context) {
  return SliverToBoxAdapter(
    child: Container(
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.orange.shade100, Colors.white]),
      ),
      margin: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Expanded(flex: 1, child: Image.asset("assets/images/i6.png")),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        FlutterOpenWhatsapp.sendSingleMessage("91 7549135542",
                            "Welcome Sir in Bada Business   https://www.badabusiness.com/dd/BIYK005702/   thanks for contact bada business . Grow your business as well ass career with Dr Vivek Bindra  \n- Purshotam Kumar \n (Senior Buisness Consultant) \n +91 7549135542  purshotambussinessconsultant@gmail.com");
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[
                                Colors.yellow.shade100,
                                Colors.white
                              ]),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Whatsapp Now",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                )),
                            Expanded(child: Image.asset("assets/what.png"))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Registration()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[
                              Colors.yellow.shade100,
                              Colors.white
                            ]),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Registration ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              )),
                          Expanded(child: Image.asset("assets/images/i8.png"))
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Paymentt()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[
                              Colors.yellow.shade100,
                              Colors.white
                            ]),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Learnig",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              )),
                          Expanded(child: Image.asset("assets/images/i18.png"))
                        ],
                      ),
                    ),
                  )),
                ],
              )),
        ],
      ),
    ),
  );
}

SliverToBoxAdapter you(BuildContext context) {
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

  return SliverToBoxAdapter(
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

// SliverToBoxAdapter pro() {
//   return SliverToBoxAdapter(
//     child: Container(),

//   );
// }

// SliverToBoxAdapter pro() {
//   return SliverToBoxAdapter(
//     child: Container(),

//   );
// }

// SliverToBoxAdapter pro() {
//   return SliverToBoxAdapter(
//     child: Container(),

//   );
// }

List<String> professor = [
  "https://cdn-images-1.medium.com/max/545/1*5K7UW0Ry3dW8qLBlRs2Xxw.png",
  "https://cdn-images-1.medium.com/max/818/1*CTt6i-66WTpBKWZEzLwkbQ.png",
  "https://cdn-images-1.medium.com/max/818/1*MaZ1rPwigZrnZecrzrQWZQ.png",
  "https://cdn-images-1.medium.com/max/545/1*qvV574tTehCMYY49ta1ydw.png",
  "https://cdn-images-1.medium.com/max/818/1*P3YcjDaMoIvCp1akPgIn0w.png",
  "https://cdn-images-1.medium.com/max/545/1*XigyCMadpUC1zFlIm-6j3w.png",
  "https://cdn-images-1.medium.com/max/545/1*XigyCMadpUC1zFlIm-6j3w.png",
  "https://cdn-images-1.medium.com/max/545/1*e_o2vCo9X21wKzGdRc5uIA.png",
  "https://cdn-images-1.medium.com/max/818/1*s_7nt41aJ7ZmzLxfchqnXg.png",
  "https://cdn-images-1.medium.com/max/818/1*HZNx3F18AJPKzPElkYsHVA.png",
  "https://cdn-images-1.medium.com/max/545/1*Z-khSMmRW-AoN39ciE4EBA.png",
  "https://cdn-images-1.medium.com/max/545/1*rgNzWzX3r4GVH18rpT_h0Q.png",
  "https://cdn-images-1.medium.com/max/545/1*tRaOYMsaeb7DO3CiT2acoQ.png",
  "https://cdn-images-1.medium.com/max/818/1*hX9AJsP-VjO5Te1_DvoUaQ.png",
  "https://cdn-images-1.medium.com/max/545/1*8KMpJLMNavedcCaGmVgM5Q.png",
  "https://cdn-images-1.medium.com/max/1636/1*IDBQ9RpBh-JnOnZyE2sy9w.png",
  "https://cdn-images-1.medium.com/max/1636/1*LDTlX46H8d8OXxNIl-5nzA.png",
  "https://cdn-images-1.medium.com/max/1636/1*UT-vlAM6H1ZzxmlmZp0Uaw.png",
  "https://cdn-images-1.medium.com/max/1636/1*XQRigkIhru-a0qIKMFksbg.png",
  "https://cdn-images-1.medium.com/max/1636/1*SA5Ev9Qt66zVtdIvGJuyAw.png",
  "https://cdn-images-1.medium.com/max/1636/1*kMMGK5iwnk9bBuZ1D8BTbg.png",
  "https://cdn-images-1.medium.com/max/1636/1*8y8EsKpEJhpEBBnOtZBRAA.png",
  "https://cdn-images-1.medium.com/max/1636/1*qrGliIwRovqqo8ggEQucWQ.png",
  "https://cdn-images-1.medium.com/max/1636/1*9wSuKnDbJMSppGzMKRhgSw.png",
  "https://cdn-images-1.medium.com/max/1636/1*udynQ2_nPr169aZ2zkzLzw.png",
  "https://cdn-images-1.medium.com/max/1636/1*NGdOyNpwRNQXDey8TqA4_A.png",
  "https://cdn-images-1.medium.com/max/1636/1*ZjVkKwTHWYMTPUegnjecOw.png",
  "https://cdn-images-1.medium.com/max/1636/1*Mqie_Yz_SXo0VSCijVoyOg.png",
  "https://cdn-images-1.medium.com/max/1636/1*oFBw5N-2WfRzUWK0a50yDg.png",
  "https://cdn-images-1.medium.com/max/1636/1*gw9p9qjTJ0S1w-TxRTKLiw.png",
  "https://cdn-images-1.medium.com/max/1636/1*JWvWtpQTlHSU5QdrMaQwww.png",
  "https://cdn-images-1.medium.com/max/1636/1*sNsn6MtH4wIjE_0xBXLfiQ.png",
  "https://cdn-images-1.medium.com/max/1636/1*DxETUoxBCJqxqGGQUZWIGQ.png",
  "https://cdn-images-1.medium.com/max/1636/1*cM0lxm8z38oBX5w-4eEQOg.png",
  "https://cdn-images-1.medium.com/max/1636/1*sG0eb0End2k6pRMp-Ua5ng.png",
  "https://cdn-images-1.medium.com/max/1636/1*__bRs7fNk6Wh6v_zKxoK4A.png",
  "https://cdn-images-1.medium.com/max/1636/1*4XSOdQJyQAiIYlhiezQaHg.png",
  "https://cdn-images-1.medium.com/max/1636/1*RPLHDOWGSFXxIyzKguJIQw.png",
  "https://cdn-images-1.medium.com/max/1636/1*7O6qTy9r6R1tH4u0Apn9aQ.png",
  "https://cdn-images-1.medium.com/max/1636/1*Gk77gmPWX2SSTbu6cbI7lA.png",
];

List<String> vivek = [
  "https://cdn-images-1.medium.com/max/545/1*dUYXmXhywqanAkrdA3snSA.png",
  "https://cdn-images-1.medium.com/max/545/1*q8EKaZZLOlxdm_FXpQySzA.png",
  "https://cdn-images-1.medium.com/max/818/1*wrQb7OAgJmah25i9wG59lQ.png",
  "https://cdn-images-1.medium.com/max/545/1*wrmo4WWlODh1nY6mffsrzg.png",
  "https://cdn-images-1.medium.com/max/818/1*WKHjU5U5vkwJohPqx_iT2A.png",
  "https://cdn-images-1.medium.com/max/545/1*zy5fyMAtoXEn6mmCLdqxrg.png",
  "https://cdn-images-1.medium.com/max/545/1*bn1MnIQfSXZH8EXAWff4Zg.png",
  "https://cdn-images-1.medium.com/max/818/1*KBpO_wtNsmposfDGf2-L9Q.png",
  "https://cdn-images-1.medium.com/max/545/1*uuFkICs4ogFmOqRyrPBIxQ.png",
  "https://cdn-images-1.medium.com/max/545/1*1hoOp_j5auw0B1t9UVZuYQ.png",
  "https://cdn-images-1.medium.com/max/545/1*7F4t0CVQ2GYUVGiugeufCA.png",
  "https://cdn-images-1.medium.com/max/818/1*b7itIQTwPUOTxHGRdLYgWg.png",
  "https://cdn-images-1.medium.com/max/818/1*b7itIQTwPUOTxHGRdLYgWg.png",
  "https://cdn-images-1.medium.com/max/818/1*b7itIQTwPUOTxHGRdLYgWg.png",
  "https://cdn-images-1.medium.com/max/545/1*ZTPgOq1HQWh6cKFFGQbD_A.png",
  "https://cdn-images-1.medium.com/max/545/1*g9cvSCksGbK65fxk4b9Itw.png",
  "https://cdn-images-1.medium.com/max/545/1*WLwNYUeWilL2JZ6ZxXi8Xg.png",
  "https://cdn-images-1.medium.com/max/545/1*3B72JxySihP57EQ6adD4yQ.png",
  "https://cdn-images-1.medium.com/max/818/1*LdMx8ru9FqLTBjM3EAcVCA.png",
  "https://cdn-images-1.medium.com/max/545/1*4UzVVHgceJJjBekqSVt4nQ.png",
  "https://cdn-images-1.medium.com/max/818/1*WzkQwCVdO84NadomZ9RRIw.png",
  "https://cdn-images-1.medium.com/max/545/1*hhOxHJNImWxZn31lPr-Qiw.png",
  "https://cdn-images-1.medium.com/max/818/1*_l_7VDROEbVmqj4tO93VsQ.png",
  "https://cdn-images-1.medium.com/max/818/1*YKG9EcNq3apfvHq5KIHonw.png",
  "https://cdn-images-1.medium.com/max/545/1*nRAX72G3TUlrO0EZTbfRUQ.png",
  "https://cdn-images-1.medium.com/max/545/1*aOI6ib8bgnL0cBe89pj5Wg.png",
  "https://cdn-images-1.medium.com/max/545/1*LL2QAlzKkGxuKhQig0Y6-Q.png",
  "https://cdn-images-1.medium.com/max/818/1*p2gcRsQj72ZUB6vu_NgfGQ.png",
  "https://cdn-images-1.medium.com/max/545/1*TVwRaaCAyXwIO3QwdATOWQ.png",
  "https://cdn-images-1.medium.com/max/818/1*d6aNFR6EqVzwQgTTCA1ckg.png",
  "https://cdn-images-1.medium.com/max/545/1*5G7ChvrwN67nJj9XYDJ6tg.png",
  "https://cdn-images-1.medium.com/max/545/1*5G7ChvrwN67nJj9XYDJ6tg.png",
  "https://cdn-images-1.medium.com/max/545/1*ZTOIbZLGKQGbd0PMAF7YXg.png",
  "https://cdn-images-1.medium.com/max/818/1*0nlk71BTik_UavNwtpTPLg.png",
  "https://cdn-images-1.medium.com/max/545/1*r8hQYsEUZacUGRHiMQk1qw.png",
  "https://cdn-images-1.medium.com/max/818/1*XN3Fu7aGAMpuVreDf0qNzg.png",
];

// ignore: camel_case_types
class youTube {
  final String name;
  final String url;
  final String link;
  youTube({required this.name, required this.url, required this.link});
}

List<youTube> moti = [
  youTube(
      name: "For want to be successful in life,never forget this word",
      url: "https://i.ytimg.com/vi/s_2HXGJbAXU/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=s_2HXGJbAXU&feature=youtu.be"),
  youTube(
      name: "3 Steps For Guaranteed Secret of Success Snippet 1",
      url: "https://i.ytimg.com/vi/RUhAexfiyGQ/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=RUhAexfiyGQ&feature=youtu.be"),
  youTube(
      name:
          "How To Handle Negative Emotions, Emotional Intelligence Snippets 1",
      url: "https://i.ytimg.com/vi/Q6aMDJUGyCA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=Q6aMDJUGyCA&feature=youtu.be"),
  youTube(
      name: "New year Resolution Motivation",
      url: "https://i.ytimg.com/vi/2uimpt4pjT8/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=2uimpt4pjT8&feature=youtu.be"),
  youTube(
      name: "How to Avoid Brain WASHING? snippet 1",
      url: "https://i.ytimg.com/vi/Ahtj5SwL3UY/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=Ahtj5SwL3UY&feature=youtu.be"),
  youTube(
      name: "How to make your life worry-free?",
      url: "https://i.ytimg.com/vi/FtyzaSuPv_Y/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=FtyzaSuPv_Y&feature=youtu.be"),
  youTube(
      name: "How to overcome the difficulties of your life? snippet 3",
      url: "https://i.ytimg.com/vi/h20QZey015o/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=h20QZey015o&feature=youtu.be"),
  youTube(
      name: "How to bring revolutionary change in life?",
      url: "https://i.ytimg.com/vi/rPcpIq49JjQ/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=rPcpIq49JjQ&feature=youtu.be"),
  youTube(
      name: "How to change your attitude towards life?",
      url: "https://i.ytimg.com/vi/4Z9lyhY1i8I/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=4Z9lyhY1i8I&feature=youtu.be"),
  youTube(
      name: "Get this thinking with success in life! Snippet 2",
      url: "https://i.ytimg.com/vi/NeB_-fwHwSI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=NeB_-fwHwSI&feature=youtu.be"),
];

List<youTube> hr = [
  youTube(
      name: "What to do to generate resources in business ? Snippets 1",
      url: "https://i.ytimg.com/vi/Xcm7xN54SUI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=Xcm7xN54SUI&feature=youtu.be"),
  youTube(
      name: "How to inspire employee Snippets 1",
      url: "https://i.ytimg.com/vi/O_0rco26EK4/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=O_0rco26EK4&feature=youtu.be"),
  youTube(
      name: "How to Calculate Your Effort and Result ? Snippets 3",
      url: "https://i.ytimg.com/vi/iuJkTV9sGvk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=iuJkTV9sGvk&feature=youtu.be"),
  youTube(
      name:
          "Keeping these things in mind while promoting the employee ! Snippet 3",
      url: "https://i.ytimg.com/vi/tSTnvIaXQTU/sddefault.jpg",
      link: "https://www.youtube.com/watch?v=tSTnvIaXQTU&feature=youtu.be"),
  youTube(
      name: "The perfect way to hire Perfect Manpower! Snippet 1",
      url: "https://i.ytimg.com/vi/3JNxQ6sXqlo/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=3JNxQ6sXqlo&feature=youtu.be"),
  youTube(
      name: "Are not you hiring a wrong Candidate ? Snippet 6",
      url: "https://i.ytimg.com/vi/bKfppoKJiWE/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=bKfppoKJiWE&feature=youtu.be"),
  youTube(
      name: "How to do your Competitiveness Evaluation? Snippet 2",
      url: "https://i.ytimg.com/vi/Am3C01nJDCk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=Am3C01nJDCk&feature=youtu.be"),
  youTube(
      name: "How to do your PERFORMANCE ANALYSIS ? Snippet 3",
      url: "https://i.ytimg.com/vi/nJvhAnfSymg/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=nJvhAnfSymg&feature=youtu.be"),
  youTube(
      name: "How to engaged your Employee for long time ? Snippet 1",
      url: "https://i.ytimg.com/vi/roYwDGo7T94/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=roYwDGo7T94&feature=youtu.be"),
  youTube(
      name: "How to Make Your Employees More Committed Snippet 4",
      url: "https://i.ytimg.com/vi/Kk1KcNAkdHY/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=Kk1KcNAkdHY&feature=youtu.be"),
  youTube(
      name: "How to Make Your Employees More Committed Snippet 3",
      url: "https://i.ytimg.com/vi/oIhFR-ijklM/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=oIhFR-ijklM&feature=youtu.be"),
  youTube(
      name: "How to Improve Transparency in Your Organization Snippet 2",
      url: "https://i.ytimg.com/vi/_qPMf4Iggyk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=_qPMf4Iggyk&feature=youtu.be"),
  youTube(
      name: "How to make COMPANY CULTURE brilliant? Snippet 3",
      url: "",
      link: "https://www.youtube.com/watch?v=R5V110m564s&feature=youtu.be"),
  youTube(
      name: "How to make your employees dedicated?",
      url: "https://i.ytimg.com/vi/R5V110m564s/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=vHv3Q-0g7Cs&feature=youtu.be"),
  youTube(
      name: "How to retain a good employee in the company?",
      url: "https://i.ytimg.com/vi/lk_17EpyMFM/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=lk_17EpyMFM&feature=youtu.be"),
  youTube(
      name: "How to retain employee for long time?",
      url: "https://i.ytimg.com/vi/giiNvM78490/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=giiNvM78490&feature=youtu.be"),
  youTube(
      name: "How to motivate employees?",
      url: "https://i.ytimg.com/vi/h0AFXA_CNdE/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=h0AFXA_CNdE&feature=youtu.be"),
  youTube(
      name: "Take care of these things at Employee Hiring! Snippet 7",
      url: "https://i.ytimg.com/vi/JYzhe_pWzu4/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=JYzhe_pWzu4&feature=youtu.be"),
  youTube(
      name: "How to test Employees' worth Snippet 4",
      url: "https://i.ytimg.com/vi/CZGZnY2_d7c/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=CZGZnY2_d7c&feature=youtu.be"),
  youTube(
      name: "How to Do External Hiring Company's Needs Completed! ? Snippet 2",
      url: "https://i.ytimg.com/vi/jTBA3RkHbtA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=jTBA3RkHbtA&feature=youtu.be"),
  youTube(
      name: "At the time of Employee Hiring, do this work ! Snippet 5",
      url: "https://i.ytimg.com/vi/nDICF-h9OtA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=nDICF-h9OtA&feature=youtu.be"),
];

List<youTube> leadership = [
  youTube(
      name: "How To Make The Best Connection With Difficult Boss",
      url: "https://i.ytimg.com/vi/fpfrVDEblp0/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=fpfrVDEblp0&feature=youtu.be"),
  youTube(
      name: "How to increase organization? Snippet 1",
      url: "https://i.ytimg.com/vi/ZoUFOZQlqTI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=ZoUFOZQlqTI&feature=youtu.be"),
  youTube(
      name: "How To Deal With Insecure People! Snippet 2",
      url: "https://i.ytimg.com/vi/cs0OhRXj8Pw/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=cs0OhRXj8Pw&feature=youtu.be"),
  youTube(
      name: "How to increase organization? Snippet 1",
      url: "https://i.ytimg.com/vi/ZoUFOZQlqTI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=ZoUFOZQlqTI&feature=youtu.be"),
];

List<youTube> management = [
  youTube(
      name: "How to choose a good business partner? Snippet 3",
      url: "https://i.ytimg.com/vi/jwSSYTpRHMI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=jwSSYTpRHMI&feature=youtu.be"),
  youTube(
      name: "",
      url: "https://i.ytimg.com/vi/XtoIqfaFoBU/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=XtoIqfaFoBU&feature=youtu.be"),
  youTube(
      name: "What's the easiest way to turn turnover ? Snippet 3",
      url: "",
      link: ""),
  youTube(
      name: "How to grow business in less money Snippet 1",
      url: "https://i.ytimg.com/vi/ZD_UELmVu4c/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=ZD_UELmVu4c&feature=youtu.be"),
  youTube(
      name: " How to chosse good location for FRANCHISEE BUSINESS Snippet 4",
      url: "https://i.ytimg.com/vi/MifpC5ezlXk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=MifpC5ezlXk&feature=youtu.be"),
  youTube(
      name: "How to Choose Right franchise Model Snippet 1",
      url: "https://i.ytimg.com/vi/hm8Q21BJZoM/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=hm8Q21BJZoM&feature=youtu.be"),
  youTube(
      name: "How to Choose Right franchise Model Snippet 1",
      url: "https://i.ytimg.com/vi/hm8Q21BJZoM/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=hm8Q21BJZoM&feature=youtu.be"),
  youTube(
      name:
          "What is the franchise taking advantages and disadvantages ? Snippet 2",
      url: "https://i.ytimg.com/vi/WabnZXXr5w8/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=WabnZXXr5w8&feature=youtu.be"),
  youTube(
      name: "These 5 types of listeners are in the world ! Snippts 4",
      url: "https://i.ytimg.com/vi/XsWTOwDelVQ/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=XsWTOwDelVQ&feature=youtu.be"),
  youTube(
      name: "How To Run Your Seasonal Business In Off Season? snippet 1",
      url: "https://i.ytimg.com/vi/9NU4joWKbTM/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=9NU4joWKbTM&feature=youtu.be"),
  youTube(
      name: "How to Develop Billion Dollar Snippets 3",
      url: "https://i.ytimg.com/vi/AbcVCiGX7ZE/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=AbcVCiGX7ZE&feature=youtu.be"),
  youTube(
      name: "How to choose a good distributor Snippet 5",
      url: "https://i.ytimg.com/vi/EcDgt6sJ96M/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=EcDgt6sJ96M&feature=youtu.be"),
  youTube(
      name: "Tips to make Successful Franchise Business Snippet 4",
      url: "https://i.ytimg.com/vi/1EyX9flahJc/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=1EyX9flahJc&feature=youtu.be"),
  youTube(
      name: "How to make small business bigger in less time Snippet 1",
      url: "https://i.ytimg.com/vi/zZdjUfHkKys/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=zZdjUfHkKys&feature=youtu.be"),
  youTube(
      name: "Learn all the qualities of a good distributor Snippet 2",
      url: "https://i.ytimg.com/vi/nkSAdScu2LU/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=nkSAdScu2LU&feature=youtu.be"),
  youTube(
      name: "How to spread business all over the country Snippet 1",
      url: "https://i.ytimg.com/vi/4G8syVWtG1Q/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=4G8syVWtG1Q&feature=youtu.be"),
  youTube(
      name:
          "How To Give Incentives To Distributor To Increase Business Snippet 6",
      url: "https://i.ytimg.com/vi/EaEA85hqtQk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=EaEA85hqtQk&feature=youtu.be"),
  youTube(
      name: "How to improve product and staff of an outlet?",
      url: "https://i.ytimg.com/vi/-wkqmHkNx-M/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=-wkqmHkNx-M&feature=youtu.be"),
  youTube(
      name: "How to maintain the quality of a outlet?",
      url: "https://i.ytimg.com/vi/UY2xib1cgpU/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=UY2xib1cgpU&feature=youtu.be"),
  youTube(
      name: "Use these methods to bring J-Curve in business!",
      url: "https://i.ytimg.com/vi/bXbNiOAbzLY/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=bXbNiOAbzLY&feature=youtu.be"),
  youTube(
      name: "How does Quick Service and Full Service Restaurant work?",
      url: "https://i.ytimg.com/vi/2jL4e2Al_bA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=2jL4e2Al_bA&feature=youtu.be"),
  youTube(
      name: "Keep these things in mind when you start Restaurant!",
      url: "https://i.ytimg.com/vi/OULOcV_IqVg/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=OULOcV_IqVg&feature=youtu.be"),
  youTube(
      name: "The importance of DIGITALIZATION in Outlet!",
      url: "https://i.ytimg.com/vi/hdpOPEc8_5A/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=hdpOPEc8_5A&feature=youtu.be"),
  youTube(
      name: "Increase business by using Franchisee models!",
      url: "https://i.ytimg.com/vi/l-WyXeCvnzo/maxresdefault.jpg",
      link: "The importance of DIGITALIZATION in Outlet!"),
  youTube(
      name: "Ideas to bring innovation in business!",
      url: "https://i.ytimg.com/vi/n2WrZJJ7Wio/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=n2WrZJJ7Wio&feature=youtu.be"),
  youTube(
      name: "How to Control the online selling website? Snippet 7",
      url: "https://i.ytimg.com/vi/PTzjHW5EhLI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=PTzjHW5EhLI&feature=youtu.be"),
  youTube(
      name: "How is shipping in online business? Snippet 6",
      url: "https://i.ytimg.com/vi/1g0YM_sa6Qs/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=1g0YM_sa6Qs&feature=youtu.be"),
  youTube(
      name: "Why Margin, Fee and ROI are very important to know ! Snippet 5",
      url: "https://i.ytimg.com/vi/8M7z9UP9QvE/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=8M7z9UP9QvE&feature=youtu.be"),
  youTube(
      name:
          "How To Choose The Online Selling Website For Your Product ? Snippet 4",
      url: "https://i.ytimg.com/vi/OGAw1GL_E-Y/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=OGAw1GL_E-Y&feature=youtu.be"),
  youTube(
      name: "E-Commerce Business Benefits! Snippet 1",
      url: "https://i.ytimg.com/vi/0R4G8bKhBk4/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=0R4G8bKhBk4&feature=youtu.be"),
  youTube(
      name: "https://i.ytimg.com/vi/JC5VfVandcA/maxresdefault.jpg",
      url:
          "https://i.ytimg.com/vi/JC5VfVandcA/maxresdefault.jpghttps://i.ytimg.com/vi/JC5VfVandcA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=JC5VfVandcA&feature=youtu.be"),
  youTube(
      name: "चाणक्य की वो 7 Strategies जो आप नहीं जानते | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/PFnJvUNK6t0/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=PFnJvUNK6t0"),
  youTube(
      name: "How to Improve Company Performance? Snippet 1",
      url: "https://i.ytimg.com/vi/AJ4jJffbX4Q/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=AJ4jJffbX4Q&feature=youtu.be"),
  youTube(
      name: "How to Win Tender Despite Less Expertise? Snippet 4",
      url: "https://i.ytimg.com/vi/0ATsp7Gy4Gw/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=0ATsp7Gy4Gw&feature=youtu.be"),
  youTube(
      name: "Asset light model Snippet 3",
      url: "https://i.ytimg.com/vi/ZscevzyScFA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=ZscevzyScFA&feature=youtu.be"),
  youTube(
      name: "How to increase sales without manpower ? Snippet 5",
      url: "https://i.ytimg.com/vi/SC9btc1tQwM/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=SC9btc1tQwM&feature=youtu.be"),
  youTube(
      name: "How to easily win a tender ? Snippet 2",
      url: "https://www.youtube.com/watch?v=QLrgBY1kwXA&feature=youtu.be",
      link: "https://www.youtube.com/watch?v=QLrgBY1kwXA&feature=youtu.be"),
  youTube(
      name: "अपने BUSSINESS को FRANCHISEE की मदद से कैसे बढ़ाएं Snippet 2",
      url: "https://www.youtube.com/watch?v=uC9rOJ4qCqs&feature=youtu.be",
      link: "https://www.youtube.com/watch?v=uC9rOJ4qCqs&feature=youtu.be"),
  youTube(
      name: "What is Franchise Business? Snippets 1",
      url: "https://www.youtube.com/watch?v=8M8nh68ogmg&feature=youtu.be",
      link: "https://www.youtube.com/watch?v=8M8nh68ogmg&feature=youtu.be"),
];

List<youTube> market = [
  youTube(
      name: "Use these 3 easy tips to increase sales ! Snippets 1",
      url: "https://i.ytimg.com/vi/6OlcZ3m-T2s/maxresdefault.jpg",
      link: "https://youtu.be/6OlcZ3m-T2s"),
  youTube(
      name: "3 Steps to Impress and Convince Video In Hindi Snippet 1",
      url: "https://i.ytimg.com/vi/4IKuReQKltQ/maxresdefault.jpg",
      link: "https://youtu.be/4IKuReQKltQ"),
  youTube(
      name: "How satisfied your customer is with your services? Snippet 2",
      url: "https://i.ytimg.com/vi/v8wxIiLYcyc/maxresdefault.jpg",
      link: "https://youtu.be/v8wxIiLYcyc"),
  youTube(
      name: "How to Understand your customer need Snippet 1:",
      url: "https://i.ytimg.com/vi/kXd_IL8hMtE/maxresdefault.jpg",
      link: "https://youtu.be/kXd_IL8hMtE"),
  youTube(
      name: "How to take your product to maximum customers ? Snippet 7",
      url: "https://i.ytimg.com/vi/8EM0s01Bllc/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=8EM0s01Bllc&feature=youtu.be"),
  youTube(
      name: "How to Manage Family Relations in Family Business Snippet 3",
      url: "https://i.ytimg.com/vi/M4fcynvZdfA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=M4fcynvZdfA&feature=youtu.be"),
  youTube(
      name: "What is Multiple things in business? Snippet 4",
      url: "https://i.ytimg.com/vi/66FGgajJMcU/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=66FGgajJMcU&feature=youtu.be"),
  youTube(
      name: "How to Grow your Brand visibility ? Snippet 3",
      url: "https://i.ytimg.com/vi/ZdHTt7qaTwE/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=ZdHTt7qaTwE&feature=youtu.be"),
  youTube(
      name: "How to creator Life Time Impression on Customer Snippet 3",
      url: "https://i.ytimg.com/vi/PluASAA3jqI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=PluASAA3jqI&feature=youtu.be"),
  youTube(
      name: "How to Attract your Customers snippet 4",
      url: "https://i.ytimg.com/vi/kAwlqauVht4/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=kAwlqauVht4&feature=youtu.be"),
  youTube(
      name: "Make your Business Successful by Customer Feedback snippet 2",
      url: "https://i.ytimg.com/vi/j_h7gMjVyHI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=j_h7gMjVyHI&feature=youtu.be"),
  youTube(
      name: "How to make your CUSTOMER PERMANENT? Snippet 1",
      url: "https://i.ytimg.com/vi/gfKEwccJ5Ag/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=gfKEwccJ5Ag&feature=youtu.be"),
  youTube(
      name: "How to Market Evaluation of your PRODUCT? Snippet 1",
      url: "https://i.ytimg.com/vi/GLu95n34ySQ/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=GLu95n34ySQ&feature=youtu.be"),
  youTube(
      name: "How to win the trust of the customer by tagline Snippet 2",
      url: "https://i.ytimg.com/vi/EeqEoOMzm9U/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=EeqEoOMzm9U&feature=youtu.be"),
  youTube(
      name: "Great Formula to Make Customers Loyal snippet 1",
      url: "https://i.ytimg.com/vi/C463CsRBZ20/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=C463CsRBZ20&feature=youtu.be"),
  youTube(
      name: "How to get good DECISION based on COST and BENIFIT? Snippet 1",
      url: "https://i.ytimg.com/vi/hkAvT1meY_Y/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=hkAvT1meY_Y&feature=youtu.be"),
  youTube(
      name: "How to Calculate cost and benefit Snippet 2",
      url: "https://i.ytimg.com/vi/oYF-VKtu86E/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=oYF-VKtu86E&feature=youtu.be"),
  youTube(
      name: "How to occupy the Market without Competition?",
      url: "https://i.ytimg.com/vi/oYF-VKtu86E/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=oYF-VKtu86E&feature=youtu.be"),
  youTube(
      name: "Trade Show Marketing!",
      url: "https://i.ytimg.com/vi/N9_C_Sk4mu8/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=N9_C_Sk4mu8&feature=youtu.be"),
  youTube(
      name: "How to attract your customers?",
      url: "https://i.ytimg.com/vi/XGWpHyQ5D_w/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=XGWpHyQ5D_w&feature=youtu.be"),
  youTube(
      name: "How to increase Ticket size of a business?",
      url: "https://i.ytimg.com/vi/unYrmVPPGNg/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=unYrmVPPGNg&feature=youtu.be"),
  youTube(
      name: "How to make a Quick Service Restaurant successful?",
      url: "https://i.ytimg.com/vi/37Ln_3-_HvM/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=37Ln_3-_HvM&feature=youtu.be"),
  youTube(
      name: "How to save operational cost from fluctuation?",
      url: "https://i.ytimg.com/vi/kryg8EZYnh4/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=kryg8EZYnh4&feature=youtu.be"),
  youTube(
      name: "Increase sales to understand the consumer's behavior ! Snippet 1",
      url: "https://i.ytimg.com/vi/oDWGx4WNMbg/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=oDWGx4WNMbg&feature=youtu.be"),
  youTube(
      name: "How to Identify Your Target Customer? Snippet 3",
      url: "https://i.ytimg.com/vi/oqANVUARE4w/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=oqANVUARE4w&feature=youtu.be"),
  youTube(
      name: "Increase your product Sals from Upselling!",
      url: "https://i.ytimg.com/vi/RNVnjh_oCUw/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=RNVnjh_oCUw&feature=youtu.be"),
  youTube(
      name: "How to run Seasonal business in Off Season?",
      url: "https://i.ytimg.com/vi/W8Sry_Yu294/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=W8Sry_Yu294&feature=youtu.be"),
  youTube(
      name: "How to market the product Dhoom! Snippet 5",
      url: "https://www.youtube.com/watch?v=5IeXzk7J_e8&feature=youtu.be",
      link: "https://www.youtube.com/watch?v=5IeXzk7J_e8&feature=youtu.be"),
  youTube(
      name: "What is INBOUND MARKETING and OUTBOUND MARKETING? Snippet 6",
      url: "https://i.ytimg.com/vi/f_6UdMqa4OY/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=f_6UdMqa4OY&feature=youtu.be"),
  youTube(
      name:
          "high sales through low cost marketing guerrilla marketing Snippet 6",
      url: "https://i.ytimg.com/vi/zYD7NZBS3-g/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=zYD7NZBS3-g&feature=youtu.be"),
  youTube(
      name: "How to easily win a tender ? Snippet 2",
      url: "https://i.ytimg.com/vi/wprGGW91mW4/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=wprGGW91mW4&feature=youtu.be"),
  youTube(
      name: "आखिर क्यों जरुरी है Digital Marketing , जानें",
      url: "https://i.ytimg.com/vi/gQoIeqYhYN8/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=gQoIeqYhYN8&feature=youtu.be"),
  youTube(
      name: "Digital Marketing ऐसे होता है Fraud Snippets2",
      url: "https://i.ytimg.com/vi/V0RNwUSSYuI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=V0RNwUSSYuI&feature=youtu.be"),
];

List<youTube> sale = [
  youTube(
      name: "Who Is Dr Vivek Bindra?",
      url: "https://i.ytimg.com/vi/o6UCmAoJi98/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=o6UCmAoJi98&feature=youtu.be"),
  youTube(
      name: "Use these 3 easy tips to increase sales ! Snippets 1",
      url: "https://i.ytimg.com/vi/6OlcZ3m-T2s/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=6OlcZ3m-T2s&feature=youtu.be"),
  youTube(
      name: "How To Increase Sales without Sale Expertise Snippet 1",
      url: "https://i.ytimg.com/vi/TffrkYphxyA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=TffrkYphxyA&feature=youtu.be"),
  youTube(
      name: "How to increase sales in new business Snippet 2",
      url: "https://i.ytimg.com/vi/SxhNwSXsoQc/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=SxhNwSXsoQc&feature=youtu.be"),
  youTube(
      name: "How to Increase Profit Margin and Sells? Snippet 6",
      url: "https://i.ytimg.com/vi/goY1acsU6Dc/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=goY1acsU6Dc&feature=youtu.be"),
  youTube(
      name: "How to Increase Sales Through Online Marketing ? Snippet 4",
      url: "https://i.ytimg.com/vi/_L23Mldk-H4/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=_L23Mldk-H4&feature=youtu.be"),
  youTube(
      name: "How to increase your sales snippet 6",
      url: "https://i.ytimg.com/vi/p8aCleYMALk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=p8aCleYMALk&feature=youtu.be"),
  youTube(
      name: "How to make Permanent to your CUSTOMER ? snippet 5",
      url: "https://i.ytimg.com/vi/b0RDB1VK3NY/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=b0RDB1VK3NY&feature=youtu.be"),
  youTube(
      name: "How to Make Customers Repeatable snippet 3",
      url: "https://i.ytimg.com/vi/etXPvO52zT8/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=etXPvO52zT8&feature=youtu.be"),
  youTube(
      name: "Raise Your Product Sale only in one day Snippet 1",
      url: "https://i.ytimg.com/vi/rIROziVF80M/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=rIROziVF80M&feature=youtu.be"),
  youTube(
      name: "Raise Your Product Sale only in one day Snippet 1",
      url: "https://i.ytimg.com/vi/rIROziVF80M/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=rIROziVF80M&feature=youtu.be"),
  youTube(
      name: "Raise Your Product Sale only in one day Snippet 1",
      url: "https://i.ytimg.com/vi/rIROziVF80M/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=rIROziVF80M&feature=youtu.be"),
  youTube(
      name: "4 ways to sell any products to customers Snippet 1",
      url: "https://i.ytimg.com/vi/H6D6ZvPY3bs/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=H6D6ZvPY3bs&feature=youtu.be"),
  youTube(
      name: "An easy way to increase sales ! snippet 1",
      url: "https://i.ytimg.com/vi/xVc_E1ez508/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=xVc_E1ez508&feature=youtu.be"),
  youTube(
      name: "Sales Problem Snippet 4",
      url: "https://i.ytimg.com/vi/arInS-e0rAg/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=arInS-e0rAg&feature=youtu.be"),
  youTube(
      name: "Do You Know Why Not Selling Your Product Snippet 2",
      url: "https://i.ytimg.com/vi/ZR0YmFpz-pE/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=ZR0YmFpz-pE&feature=youtu.be"),
  youTube(
      name:
          "high sales through low cost marketing guerrilla marketing Snippet 6",
      url: "https://i.ytimg.com/vi/zYD7NZBS3-g/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=zYD7NZBS3-g&feature=youtu.be"),
  youTube(
      name: "How to increase Product Sales Multiples ? Snippet 4",
      url: "https://i.ytimg.com/vi/YvUTJtUHjbk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=YvUTJtUHjbk&feature=youtu.be"),
];

List<youTube> strategy = [
  youTube(
      name: "Busyness Vs Business A Motivational Video Snippet 3",
      url: "https://i.ytimg.com/vi/knNMgo0l4cA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=knNMgo0l4cA&feature=youtu.be"),
  youTube(
      name: "How to choose the right platform for the product Snippet 1",
      url: "https://i.ytimg.com/vi/JeEFWRgQy-Y/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=JeEFWRgQy-Y&feature=youtu.be"),
  youTube(
      name: "How to Get Growth in Business by innovation Snippet 1",
      url: "https://i.ytimg.com/vi/OTdbUpyhasY/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=OTdbUpyhasY&feature=youtu.be"),
  youTube(
      name:
          "Why is it necessary to understand the Behaviour of the Competitor ? Snippet 2",
      url: "https://i.ytimg.com/vi/gzkfoMqniec/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=gzkfoMqniec&feature=youtu.be"),
  youTube(
      name: "How to Present Product Catalog? Snippet 3",
      url: "https://i.ytimg.com/vi/BbXU219OsQs/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=BbXU219OsQs&feature=youtu.be"),
  youTube(
      name: "Make your life free of debt snippet 1",
      url: "https://i.ytimg.com/vi/pBeh5UJQqRc/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=pBeh5UJQqRc&feature=youtu.be"),
  youTube(
      name:
          "How to Manage Multiple Things and Main Things in Business Snippet 2",
      url: "https://i.ytimg.com/vi/ve6bJ4JnvUs/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=ve6bJ4JnvUs&feature=youtu.be"),
  youTube(
      name: "Make Your Review Meetings Effective! SNIPPET 1",
      url: "https://i.ytimg.com/vi/23hfHFXSbGk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=23hfHFXSbGk&feature=youtu.be"),
  youTube(
      name: "Powerful tips for Make your company successful Snippets-1",
      url: "https://i.ytimg.com/vi/48_eolT6q6A/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=48_eolT6q6A&feature=youtu.be"),
  youTube(
      name: "How to do Implementation in business ? Snippet 2",
      url: "https://i.ytimg.com/vi/KG7YQUYpWHg/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=KG7YQUYpWHg&feature=youtu.be"),
];

// ignore: camel_case_types
class prodetail {
  final String name;

  final String deg;
  final String des;
  final String url;
  prodetail(
      {required this.deg,
      required this.des,
      required this.name,
      required this.url});
}

List<prodetail> pd = [
  prodetail(
      deg: "Founder & CEO - Bada Business",
      des:
          "Dr Vivek Bindra is a Revolutionary Entrepreneur, an Internationally Acclaimed Motivational Speaker and a Business Coach. A Trusted Advisor for more than 500+ Corporate Houses and Entrepreneurs, he is the Recipient of more than 100 Globally Admired Awards.",
      name: "Dr. Vivek Bindra",
      url: "https://www.badabusiness.com/images/vivek.png"),
  prodetail(
      deg: "Chairman - Ford Motors",
      des:
          "Mr. Alfred Ford is the Global Chairman of Ford Motors and Great Grandson of the legendary Sir Henry Ford. He is an initiated disciple of A.C. Bhaktivedanta Swami Prabhupada (Srila Prabhupada) since 1974 period.",
      name: "Mr. Alfred Ford",
      url: "https://www.badabusiness.com/images/alfred.png"),
  prodetail(
      deg: "Chairperson - Biocon Ltd",
      des:
          "Kiran Mazumdar-Shaw is an Indian billionaire entrepreneur. She is the Chairperson and Managing Director of Biocon Limited, a Biotechnology Company based in Bangalore, India and the Chairperson of Indian Institute of Management, Bangalore. The company is valued at approximately USD 5 Billion.",
      name: "Dr. Kiran Mazumdar Shaw",
      url: "https://www.badabusiness.com/images/kiran.png"),
  prodetail(
      deg: "Managing Director - Amul",
      des:
          "Shri R S Sodhi Is Presently Managing Director Of Amul, The Largest Milk And Milk-Based Products Company In India. The Group Has A Turnover Of Approximately Rs. 50,000 Crores. He Has Been With Amul For More Than 35 Years And Has Spearheaded Their Highly Innovative And Widely Acclaimed Marketing Campaigns. He Has Been Instrumental In Launching More Than 50 New Products During His Tenure As Managing Director From 2012 Onwards.",
      name: "Mr. R S Sodhi",
      url: "https://www.badabusiness.com/images/rs_sodhi.png"),
  prodetail(
      deg: "Managing Director - Xiaomi India",
      des:
          "Mr. Manu Jain, India Head And Global Vice President Of Xiaomi. He Was Also The Co - Founder Of Jabong. In Xiaomi He Has Been Responsible To Take The Brand To Highest Market Share In Android Phones Beating Samsung And Other Companies In Record Time",
      name: "Mr. Manu Jain",
      url: "https://www.badabusiness.com/images/manu.png"),
  prodetail(
      deg: "Co-Founder & CEO - PolicyBazaar",
      des:
          "Mr. Yashish Dahiya, CEO & Co-Founder, PolicyBazaar.com Which Is The Largest Online Insurance Brokerage Company In India With More Than 15,000 Employees And Growing At 100% Per Annum In Revenue Terms. Holds A Bachelor’s Degree In Engineering From IIT Delhi, MBA From IIM Ahmedabad, And An MBA From INSEAD. He Started His Career As A Business Unit Head At Illinois Tool Works And Later Moved On To Bain & Co. To Work As A Management Consultant…",
      name: "Mr. Yashish Dahiya",
      url: "https://www.badabusiness.com/images/yashish_dahiya.png"),
  prodetail(
      deg: "Founder Director - Dainik Bhaskar Group",
      des:
          "Mr. Girish Agarwal Is The Founder Director Of Dainik Bhaskar Group. DB Has A Circulation Of 58 Lakh Newspapers Daily With 4.5 Crore Readership. They Are The Largest Newspaper Group In India And The 4th Largest In The World.",
      name: "Mr. Girish Agarwal",
      url: "https://www.badabusiness.com/images/girish.png"),
  prodetail(
      deg: "Chairman - Dr. Lal Pathlabs",
      des:
          "Dr. Arvind Lal Is The Founder Of Dr. Lal Pathlabs, He Has Grown His Company On The Hub And Spoke Model. Today His Company Is Listed And Is The Largest Company In India In The Pathlab Industry With More Than 9,000 Crore Market Cap",
      name: "Dr. Arvind Lal",
      url: "https://www.badabusiness.com/images/arvind.png"),
  prodetail(
      deg: "Chairman - Patanjali",
      des:
          "Acharya Balkrishna, Is The Current Chairman Of Patanjali, The Largest Home Grown Brand In FMCG In India. His Personal Wealth Has Been Estimated As USD 6.1 Billion. He Is Responsible For The Operations Of The Patanjali Group. He Has A Strong Nationalist Feeling And Wants The Group To Become The Largest FMCG Brand In The Country",
      name: "Acharya Balkrishna",
      url: "https://www.badabusiness.com/images/acharya-balkishan.png"),
  prodetail(
      deg: "Managing Director - SBI",
      des:
          "Mr. PK Gupta Is The Managing Director Of State Bank Of India, He Has Spent More Than 33 Years In State Bank Of India. He Is On The Board Of SME Committee Of Reserve Bank Of India. With his vast experience he is now responsible for the next level of growth of SBI i.e. Digital Banking",
      name: "Mr. P.K. Gupta",
      url: "https://www.badabusiness.com/images/pk_gupta.png"),
  prodetail(
      deg: "Founder - Narayana Health",
      des:
          "Padmabhushan, PadmaVibhushan Dr. Devi Shetty is the Chairman of Narayana Hrudaylaya. His Organisation Does 30 Heart Transplants Everyday And Has Halved The Cost Of The Transplant. He Is Compared With Sir Henry Ford Who Was The Founder Of The Assembly Line. His Mission Is To Further Halve The Cost Of Cardiac Surgery In India",
      name: "Dr. Devi Shetty",
      url: "https://www.badabusiness.com/images/devi.png"),
  prodetail(
      deg: "Vice Chairman & CEO - HDFC Ltd.",
      des:
          "Mr. Keki Mistry is the Vice - Chairman of HDFC Ltd. HE has been with the group for more than 30 years and Has Succeeded Mr. Deepak Parekh Who Is Still The Non Executive Chairman Of HDFC Ltd. He Is Also On The Board As Independent Director Of Sun Pharma, IIFL, HCL Technologies And Many Others",
      name: "Mr. Keki Mistry",
      url: "https://www.badabusiness.com/images/keki.png"),
  prodetail(
      deg: "Managing Director & CEO - Bombay Stock Exchange",
      des:
          "He is an IIT, IIM Alumnus and was the Head of National Stock Exchange when it was founded. He has a vision of listing 1,00,000 companies on BSE SME Exchange.",
      name: "Mr. Ashish Chauhan",
      url: "https://www.badabusiness.com/images/ashish.png"),
  prodetail(
      deg: "Managing Director - Morgan Stanley India",
      des:
          "Mr. Ridham Desai is the Managing Director of Morgan Stanley India. He is a Well-Known figure in Equity research and his expertise is to understand trends of macroeconomy. Mr. Desai has more than 20 years experience in Identifying Macroeconomic Trends and helping businesses identify the next sunrise sector.",
      name: "Mr. Ridham Desai",
      url: "https://www.badabusiness.com/images/ridham.png"),
  prodetail(
      deg: "Chairman - India Infoline Limited",
      des:
          "Mr. Nirmal Jain is the Chairman of the largest Indian Financial Conglomorate INDIA INFOLINE LTD. IIFL provides Loans, Mutual Funds, Insurance and every possible Financial Product. The Company Is Listed And Has A Market Cap Of Approximately 15,000 Crores.",
      name: "Mr. Nirmal Jain",
      url: "https://www.badabusiness.com/images/nirmal.png"),
  prodetail(
      deg: "Managing Director & CEO - Invest India",
      des:
          "Mr. Bagla is currently Managing Director & CEO of Invest India, the National Investment Promotion and Facilitation Agency promoted by the Government of India. Invest India is also the execution agency for Government of India’s Start-up initiative",
      name: "Mr. Deepak Bagla",
      url: "https://www.badabusiness.com/images/deepak_bagla.png"),
  prodetail(
      deg: "Chairperson - Kamani Tubes",
      des:
          "Padmabhushan Ms. Kalpana Saroj Is The Chairperson Of Kamani Tubes. She Once Belonged To A Very Poor Family And Was Married At A Very Early Age. However, After A Difficult Marriage And Attempts To Commit Suicide, Today, She Has Transformed Her Life And Turned Around A Sick Company Called Kamani Tubes Into A Profitable Venture. She Has The Reputation Of Being An Iron Lady And Is An Inspiration To Many, She Is Also On The Board Of IIM Bangalore And Is An Owner Of A Rs. 3,000 Crore Empire.",
      name: "Ms. Kalpana Saroj",
      url: "https://www.badabusiness.com/images/kalpana.png"),
  prodetail(
      deg: "Vice Chairman - Bajaj Capital",
      des:
          "Mr. Sanjiv Bajaj Is The Managing Director Of Bajaj Capital. Bajaj Capital Is One Of The Largest Distributors Of Financial Products With More Than 100 Company Products In Their Portfolio.",
      name: "Mr. Sanjiv Bajaj",
      url: "https://www.badabusiness.com/images/sanjiv.png"),
  prodetail(
      deg: "MasterChef India and Co-Founder WonderChef",
      des:
          "Mr. Sanjeev Kapoor Is A Celebrity Chef And Became Popular With Khana Khazana. Today He Owns More Than 5 Restaurant Brands And More Than 70 Restaurants Across The World. He Is Also The Co-Founder Of Wonder Chef Which Manufactures Kitchen Appliances Industry And Has Rapidly Grown In Its Space.",
      name: "Mr. Sanjeev Kapoor",
      url: "https://www.badabusiness.com/images/sanjeev_kapoor.png"),
  prodetail(
      deg: "Indian Ad Film Guru ",
      des:
          "Mr. Prahlad Kakkar Is An Ad Maker And Considered As The Ad Film Guru Of India. He Has Been Known For His Famous For His Ad Campaigns Such As Pepsi, Maggi, Britannia, Maggi Ketchup And Many Others. He Also Runs A School Of Entrepreneurship And Addresses Students To Pacify Their Fears. Works Against The Fear Engulfing The Students Of Today",
      name: "Mr. Prahlad Kakkar",
      url: "https://www.badabusiness.com/images/prahlad.png"),
  prodetail(
      deg: "Chairman - Kent RO",
      des:
          "Dr. Mahesh Gupta Is The Chairman Of Kent RO, Leader In The Water Purifier Industry. His Company Is The Leading Brand In The Purification Of Water And Foods With A Mission Of Cleanliness In All Food Forms. He Has Built The Entire Company Without Any Form Of External Capital",
      name: "Dr. Mahesh Gupta",
      url: "https://www.badabusiness.com/images/mahesh.png"),
  prodetail(
      deg: "Chairman & Managing Director - V - Mart",
      des:
          "Mr. Lalit Agarwal is the Managing Director of V-Mart, the country's most affordable fashion retail chain. Starting From A Very Humble Backgound, Mr. Lalit Has Made An Organisation Par Excellence By Focusing Only On Tier 3 & 4 Markets And By Providing Aspirational Fashion At Very Low Cost.",
      name: "Mr. Lalit Agarwal",
      url: "https://www.badabusiness.com/images/lalit.png"),
  prodetail(
      deg: "Chairman - V2 Retail",
      des:
          "Mr. Ram Chandra Agarwal is the Chairman of V2 Retail and was the founder of Vishal Mega Mart. After The Failure Of Vishal Mega Mart, He Founded V2 Retail And Within 10 Years, V2 Now Has 76 Stores",
      name: "Mr. Ram Chandra Agarwal",
      url: "https://www.badabusiness.com/images/ram_chandra_agarwal.png"),
  prodetail(
      deg: "Chairman - Thyrocare Technologies",
      des:
          "Dr. A Velumani is a BSc in Chemistry, MSc in Biochemistry and a PhD in Thyroid Physiology. He has over 35 years of experience in diagnostics Research and Business. After 15 years of experience in Thyroid Biochemisry Research at the BARC Mumbai, He started Thyrocare in 1995. This Is A Focused Biochemistry Back End Laboratory. He Has Built An Organisation Which Got Listed In The National Stock Exchange In May 2017, With A Stellar Oversubscription Of 74 Times.",
      name: "Dr. A Velumani",
      url: "https://www.badabusiness.com/images/velumani.png"),
  prodetail(
      deg: "Chairman - Agarwal Packers and Movers",
      des:
          "Mr. Ramesh Agarwal Is The Chairman Of Agarwal Packers And Movers. The Name Is Synonymous With The Movement of Household Goods. They Are The Leaders And Innovators In Their Own Field. Their Innovation Has Brought Down Costs Of Shifting Significantly And Improved Their Margins. With More Than 1,00,000 Shiftings In A Year, They Are The Undisputed Market Leaders",
      name: "Mr. Ramesh Agarwal",
      url: "https://www.badabusiness.com/images/ramesh.png"),
  prodetail(
      deg: "Chairman - Rajesh Exports",
      des:
          "A Listed Company With More Than Rs 15,000 Crore Market Cap. This Is The Only Company In The World Which Has Interests Ranging Right From Mining To Retailing In Gold Segment. With 2 Lakh Crore Annual Revenue, Rajesh Exports Is One Of The 7 Companies In India Which Are Included In Fortune 500",
      name: "Mr. Rajesh Mehta",
      url: "https://www.badabusiness.com/images/rajesh.png"),
  prodetail(
      deg: "Chairman - CenturyPly & Star Cement",
      des:
          "Mr. Sajjan Bhajanka is the Chairman of Century Ply & Star Cement. With more than Rs. 9,000 Crores of combined Market Capitalisation, these companies are leaders in their business. Century Ply is the market leader with more than Rs. 2,000 Crore of Revenue",
      name: "Mr. Sajjan Bhajanka",
      url: "https://www.badabusiness.com/images/sajjan_bhajanka.png"),
  prodetail(
      deg: "Vice Chairman - SREI Infra",
      des:
          "Mr. Sunil Kanoria Is The Vice Chairman Of SREI Infra Which Is The Biggest Firm In India In The Field Of Equipment Financing. They Have Approximately 33% Market Share And Have Rs. 50,000 Crores Of Assets Under Management. With More Than 1,00,000 Customers, The Firm Boasts Of The Largest Consumer Base In The Industry And Has The Maximum OEM Partnerships.",
      name: "Mr. Sunil Kanoria",
      url: "https://www.badabusiness.com/images/sunil_kanoria.png"),
  prodetail(
      deg: "Founder & Managing Director - Ferns & Petals",
      des:
          "Mr. Vikaas Gutgutia Is The Founder & MD Of Ferns & Petals. It Is The Largest Company In The World For Flower Gifting. It Has More Than 320 Shops In More Than 170 Countries And Has A Topline Of More Than 350 Crores. It Provides End-To-End Solutions For Weddings And Large Events.",
      name: "Mr. Vikaas Gutgutia",
      url: "https://www.badabusiness.com/images/vikaas-gutgutia.png"),
  prodetail(
      deg: "Managing Director & CEO - LT Foods (Dawat Rice)",
      des:
          "A listed Company Which Is Well- Known With Its Rice Brand, Dawat Rice. The Company Has More Than Rs 4,000 Crores Of Revenue. It Has More Than 60% Exports And Has Converted A Trading Business Into A Super Brand",
      name: "Mr. Ashwani Arora",
      url: "https://www.badabusiness.com/images/ashwani.png"),
  prodetail(
      deg: "Managing Director - Somany Ceramics Ltd.",
      des:
          "Mr. Abhishek Somany Is The Managing Director Of Somany Ceramics Ltd. He Is A 3rd Generation Entrepreneur And His Company Has Been In The Top Two Companies In The Ceramics Space",
      name: "Mr. Abhishek Somany",
      url: "https://www.badabusiness.com/images/abhishek.png"),
  prodetail(
      deg: "Director General - Federation of Indian Export Organisations",
      des:
          "Dr. Ajay Sahai, Director General & CEO of FIEO. He has more than 30 years of Experience in Commerce and Trade. He is a policy influencer and has been instrumental in creating Foreign Trade Policy. He is a speaker on multiple platforms such as World Bank, Asian Development Bank etc",
      name: "Dr. Ajay Sahai",
      url: "https://www.badabusiness.com/images/ajay_sahi.png"),
  prodetail(
      deg: "Managing Director - GoDaddy India",
      des:
          "Mr. Nikhil Arora Is The Managing Director (India) Of The Largest Domain Registration Company In The World. He Has Done His Master's From USA And Has Worked At Senior Leadership Roles In Large Organisations In The World Such As WeWork. At Godaddy, He Is Responsible For Expansion And Education Of SME's Regarding Domain And Website Development. Godaddy Has Almost 40% Market Share In India",
      name: "Mr. Nikhil Arora",
      url: "https://www.badabusiness.com/images/nikhil.png"),
  prodetail(
      deg: "Managing Director - Insecticide India",
      des:
          "He Is A Pioneer In The Field Of Pesticide Industry And Has Provided High Quality Products At Very Low Cost To The Indian Farmers. His Company Is Listed With More Than Rs 1,000 Crores Of Annual Revenue And Has Worked With More Than 25 Lakh Farmers",
      name: "Mr. Rajesh Agarwal",
      url: "https://www.badabusiness.com/images/rajesh_ag.png"),
  prodetail(
      deg: "Managing Director - Bajaj Corp. Ltd.",
      des:
          "Mr. Sumit Malhotra Is The Managing Director Of Bajaj Corp. Ltd. With Only One Product, Mr. Sumit Malhotra Has Created A Rs 1,000-Crore Business. The product, Bajaj Almond Hair oil is a market leader with more than 10% Market share in the hair oil industry and 63% in Light hair oil industry",
      name: "Mr. Sumit Malhotra",
      url: "https://www.badabusiness.com/images/sumit-malhotra.png"),
  prodetail(
      deg: "Former Executive Director - Tata Sons Ltd.",
      des:
          "R. Gopalakrishnan is an executive director of Tata Sons Ltd. He also serves as a director on the board of Tata Power, Tata Technologies, AkzoNobel India, Castrol India and ABP Pvt. Ltd. He has served as Vice Chairman - Hindustan Unilever and Chairman - Unilever Arabia. Author of 9 High power books.",
      name: "R. Gopalakrishnan",
      url: "https://www.badabusiness.com/images/gopalakrishnan.png"),
  prodetail(
      deg: "Chairman - APL Apollo",
      des:
          "Mr. Sanjay Gupta is a first generation Entrepreneur and a category creator of steel tubes in India. He is the Managing Director of APL Apollo Tubes. His vision is to replace the usage of wood in order to save trees. In steel tubes they have more than 50% Market Share and have succesfully grown their business and today their company is listed",
      name: "Mr. Sanjay Gupta",
      url: "https://www.badabusiness.com/images/sanjay.png"),
  prodetail(
      deg: "Chairman - Dhanuka Agritech",
      des:
          "Shri Ram Gopal Agarwal Group Chairman is the Founder Chairman of Dhanuka Agritech Ltd. He holds Degree in Bachelor of Commerce (Hons) from Sri Ram college of Commerce, Delhi University. He is a decisive and action oriented visionary who took over a sick pesticide Company named Northern Mineral Pvt. Ltd. in 1980 to transform it into 1,000 crore. Presently the company has more than 350 products, the company's Market Cap is more than Rs. 1,200 Crores.",
      name: "Mr. R G Agarwal",
      url: "https://www.badabusiness.com/images/r_g_agarwal.png"),
  prodetail(
      deg: "Chairman - Lava Mobiles ",
      des:
          "Mr. Hari Om Rai is a first generation Entrepreneur and the Managing Director of Lava Mobiles. In an era when most of the Indian manufacturers are struggling due to low cost Chinese options, Lava mobiles has held its ground and is at par with Samsung in feature phone category.",
      name: "Mr. Hari Om Rai",
      url: "https://www.badabusiness.com/images/hariom.png"),
  prodetail(
      deg: "Chairman - Ananda Dairy",
      des:
          "Mr. Radhey Shyam Dixit is the chairman of Ananda Dairy. Ananda Dairy is one of the few companies which procures directly from farmers and also has its own products. They are pioneers in improving the milk yield for the farmers",
      name: "Mr. Radhey Shyam Dixit",
      url: "https://www.badabusiness.com/images/radheshyam.png"),
  prodetail(
      deg: "Managing Director - Shree Mahila Sewa Sahakari Bank",
      des:
          "Ms. Jayshree Vyas, a professionally qualified Chartered Accountant has been working as the Managing Director of Shree Mahila Sewa Sahakari Bank, Ahmedabad since 1986 which has more than 5,00,000 women clients. She has taken active steps to introduce and operate an Integrated Micro Insurance Scheme for women working in the informal sector and in a short period of three years covered more than 150,000 women. She is also Board Member of Bombay Stock Exchange (BSE)",
      name: "Dr. Jayshree Vyas",
      url: "https://www.badabusiness.com/images/jayshree_vyas.png"),
  prodetail(
      deg: "Co-Founder - Ashika Wealth Advisors",
      des:
          "Amit served the Indian Banking and Financial Services industry for 18 years. In his last assignment he served Reliance Capital Group Company as Business head for India region. He has been part of Reliance Group's leadership team for almost a decade. He has mentored startups from IIT, DTU, IIM, DU. He has worked with HDFC, ICICI and ABN AMRO Bank.",
      name: "Mr. Amit Jain",
      url: "https://www.badabusiness.com/images/amitjain.png"),
];
