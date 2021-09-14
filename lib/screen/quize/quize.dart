import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class Quizee extends StatefulWidget {
  @override
  _QuizeeState createState() => _QuizeeState();
}

class _QuizeeState extends State<Quizee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          primary: true,
          slivers: <Widget>[
            SliverAppBar(
                actions: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 110, right: 110, top: 15, bottom: 5),
                      child: Image.asset(
                        "https://miro.medium.com/max/400/1*ATaAOiaxIivoDTPC85EZ3w.jpeg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
                ],
                backgroundColor: Colors.blue[50],
                iconTheme: IconThemeData(color: Colors.yellow),
                expandedHeight: 100,
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    ' ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                  background: Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "https://miro.medium.com/max/400/1*bnXuFRPs6GJ6WtXi1Rku6w.gif",
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          "https://miro.medium.com/max/400/1*PtHuiVzWX1lIa75IUg3-AQ.gif",
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          "https://miro.medium.com/max/250/1*WsM2CGL8dgSYOTK3OsCYbA.gif",
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          "https://miro.medium.com/max/250/1*EyNAdSPjJtuNuGCOYEksOw.gif",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                )),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 700,
                    child: qList.length == 0
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: qList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  article(qList[index].link);
                                },
                                child: Container(
                                  height: 300,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin: EdgeInsets.only(
                                                  left: 20, right: 20),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: qList[index].url.isEmpty
                                                    ? CircularProgressIndicator()
                                                    : FadeInImage(
                                                        image: new NetworkImage(
                                                            qList[index].url),
                                                        fit: BoxFit.fill,
                                                        placeholder:
                                                            new AssetImage(
                                                          "assets/lo.gif",
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 30,
                                              right: 30),
                                          child: Center(
                                            child: Text(
                                              "Play and WIN Money..",
                                              style: TextStyle(
                                                  fontSize: 20,
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Quize {
  final String url;
  final String link;

  Quize({required this.url, required this.link});
}

List<Quize> qList = [
  Quize(
      url: "https://miro.medium.com/max/800/1*lercLEp7Ax4h1hJmkbS7OQ.jpeg",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/500/1*5YYLFsMThqs93vE0AtWXTQ.jpeg",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/589/1*bomi8zL_jVZ3CSTNi3d_CA.png",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/494/1*fMs91jUbjdIm6RQ84TfDSA.jpeg",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/418/1*HcugwX-NbWd6k_vwLa36qg.png",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/418/1*5iyuXiKnLWYiD58JOJBMSg.png",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/418/1*zcTb4D4ZnjA0uii4ToJmxw.png",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/418/1*eRWFrmeGU_0bpHGVyyYcmA.png",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/418/1*dv4-cI4GFyDszeBDoN78cw.png",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/418/1*bCK64DfSlr28aQ3WGHCs4w.png",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/469/1*ABIWFPegAeHnLA56T2sLww.jpeg",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/469/1*i14pdqFL8KArjgcVXrzRJg.png",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/418/1*BN-pg1V9nwLhgXkaReKDuQ.png",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/418/1*0YhdeKScQ1tAKDBEwDPvRw.png",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/418/1*hdyZIaeLFhQzF90XXR04Zw.png",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/401/1*8s2GUvISWONlC6i4jwZZWQ.png",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/449/1*mb0HKhaSbV2SNvopNEtJGw.jpeg",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/418/1*xlpFk5Zf28BLVWt3ICevUQ.png",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/418/1*499fq6UDm4M0LSYHOAxy-Q.png",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/370/1*N7h7bp6J2EDN3bRVYukXlQ.png",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/500/1*4IoYEC8n_zRuw7H1ZxKiMg.jpeg",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/469/1*9ntJNrcYgjY-P2aPxwZSCw.jpeg",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/513/1*wpGwUkJeuX_8SU98_hxRoQ.jpeg",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/514/1*rBOr6Vai1V5YRsPpg92-0A.jpeg",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/800/1*WZRTJINXdQvwE4Gbo5KEdw.jpeg",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/418/1*d5FTQYxEu0omJglWQ0nLTA.jpeg",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/418/1*SkQjZHFAFkn--YOrmJqPdA.png",
      link: "https://1310.win.qureka.com"),
  Quize(
      url: "https://miro.medium.com/max/1350/1*Kv2sHAD3S3Yf6mP5oCRobA.png",
      link: "https://1310.win.qureka.com"),
];

article(String link) async {
  String url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
