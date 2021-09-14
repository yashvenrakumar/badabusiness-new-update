import 'package:badabusiness/screen/payoutscreen/community/cummunityfull.dart';
import 'package:badabusiness/screen/payoutscreen/others/fullimage.dart';
import 'package:badabusiness/screen/payoutscreen/others/regitwo.dart';
import 'package:badabusiness/screen/payoutscreen/show.dart';
import 'package:badabusiness/screen/registration/payment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:url_launcher/url_launcher.dart';

class Web extends StatefulWidget {
  @override
  _WebState createState() => _WebState();
}

class _WebState extends State<Web> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 150,
            color: Colors.black,
            child: Column(
              children: [
                Expanded(
                    child: Image.network(
                        "https://www.badabusiness.com/dd/site/templates/assets/img/logo-white-new.png")),
                Expanded(
                    child: Column(
                  children: [
                    Expanded(
                        child: Center(
                      child: Text(
                        "Purshotam Kumar",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                    Expanded(
                        child: Center(
                      child: Text(
                        "Business Consultant",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                    Expanded(
                        child: Center(
                      child: Text(
                        "☎ 7549135542",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                    Expanded(
                        child: Center(
                      child: Text(
                        "✉ purshotambussinessconsultant@gmail.com",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
                  ],
                ))
              ],
            ),
          ),

          Container(height: 300, child: Regip()),
          Image.network("https://assets.badabusiness.com/1/3-v1610808287.jpg"),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 20, top: 50, bottom: 30),
              child: Text(
                "Everything About Entrepreneurship (EAE) Program",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          Image.network(
              "https://assets.badabusiness.com/1020/gif_4-v1600602433.gif"),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
              child: Text(
                "- Do you want to grow your business multi-fold? \n- Are you searching for strategies to solve your business problems? \n- Has the downturn in the economy due to Corona, impacted your business?\n- Do you wish to expand your business in different geographies?\n- Do you want to grow your business Profitably?\n- Do you aspire to Learn business Strategies from Eminent Business Leaders and Industry Experts?\nEverything about Entrepreneurship course is the World’s Most Affordable Complete Business Management Program in Hindi. EAE is a 2 years’ App based learning program, now Learn Anytime, Anywhere only on Bada Business Application.",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 20, top: 50, bottom: 30),
              child: Text(
                "Become an Independent Business Consultant (IBC)",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          Image.network(
              "https://assets.badabusiness.com/1023/gif_2-v1600758655.gif"),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
              child: Text(
                "- Do you want to build a regular source of income? \n- Do you want to become your own boss?\n- Do you want to start your own business with low investment?\n- Do you want to start a business and seek knowledge how to do it?\n- Do you want to learn and earn at the same time? \n\nBecome an IBC, Learn and Earn at your convenience - Part-time or Full-time.Earn Rs1 Lakh – Rs20 Lakh per month that too at a Very Low Investment!",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 20, top: 50, bottom: 30),
              child: Text(
                "Problem Solving Courses (PSC)",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          Image.network(
              "https://assets.badabusiness.com/1021/gif_3-v1600602608.gif"),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
              child: Text(
                "- Do you want to find solutions to your daily burning business problems?\n- Do you want to move away from being an operator to being in charge/controller of your business?\n- Do you want to Learn effective strategies to market your business/products?\n- Do you want to introduce automation in your business?\n- Do you want to take right financial/investment decisions for your business?\n- Do you want to acquire new customers and need help?\n- Do you want to learn strategies to thrive in Cut throat competition?\n\nProblem Solving Courses are designed to give practical solutions & learning to the most important burning problems faced by Entrepreneurs.If you are interested in starting your own business or want to expand your existing business, but, are facing specific challenges, you can buy these courses.",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 20, top: 50, bottom: 30),
              child: Text(
                "Life Time Membership (LTM)",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          Image.network(
              "https://assets.badabusiness.com/1022/gif_6-v1600602696.gif"),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
              child: Text(
                "- Do you end up wasting a lot of time in finding the right documents to run your business?\n- Do you have a business and you pay lakhs of rupees to experts for building important documents like contracts, policies, legal compliances?\n- Do you want to grow your learning for a lifetime with just one investment?\n- Do you wish to subscribe to all digital courses offered by Bada Business with just one investment?\n\nWhen you become a Life-time member of Bada Business you get:\n1. Lifetime access to all our current and future Digital Learning Course (Including EAE and All PSCs\n2. Opportunity to attend 2 EAE Events\n3. Lifetime access to Aladdin Ka Chirag",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 20, top: 50, bottom: 30),
              child: Text(
                "Customized Learning Solutions - White Labeled LMS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          Image.network(
              "https://assets.badabusiness.com/1024/gif_5-v1600602776.gif"),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
              child: Text(
                "- Do you want to provide practical and realistic knowledge to your Students/Employees?\n- Are you looking for new and modern techniques to grow learnings of your Stundents/Employees?\n- For the bright future of your students, are you looking for an additional course which offers them dual certification along with the degree?\n- Are you looking for any kind of skill enhancement program to increase the productivity of your employees?\n- Do you want offer practical business learnings to your employees from the top businessmen and influencers of our country?\nReach out to us for customized solutions suited to your business needs and requirements.",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 20, top: 50, bottom: 30),
              child: Text(
                "Business Case Studies on Social Media",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          Image.network(
              "https://assets.badabusiness.com/1025/gif_7-v1600602964.gif"),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
              child: Text(
                "re you struggling to reach the decision-makers in your marketing activities?\n- Do you want to exponentially grow your brand image in a short span of time?\n- Do you want to build franchises or distribution network PAN India?\n- Are your marketing activities attracting the right number of leads to grow your business?\n- Do you wish to showcase your brand on Youtube's no 1 Entrepreneurship Training Channel?\nGet engaging and impressive Video format Case Studies by Dr. Vivek Bindra – Founder & CEO of Bada Business Pvt Ltd. Case studies are based on an in-depth study of your product/service along with competitive analysis.Connect with us for a detailed discussion on the subject.",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ),
          ),
          conn(context),
          youTubee(context),

          profeimge(),
          Container(height: 300, child: Regip()),
          eaeibcvedio(),
          //pro()
        ],
      ),
    );
  }
}

Widget eaeibcvedio() {
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

  return Container(
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

Widget profeimge() {
  return Container(
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
                                                    builder: (context) => Full(
                                                        professor[index])));
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

website() async {
  const url = 'https://www.badabusiness.com/dd/BIYK005702/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
