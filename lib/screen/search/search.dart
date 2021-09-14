import 'package:badabusiness/screen/registration/payment.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_youtube/flutter_youtube.dart';

class CitySearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
            } else {
              query = '';
              showSuggestions(context);
            }
          },
        ),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      );

  @override
  // ignore: override_on_non_overriding_member
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

  Widget buildResults(BuildContext context) => Center(
        child: ListView.builder(
          itemCount: re.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //         builder: (context) => Regi()));
                    playYoutubeVideo(re[index].link);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) =>
                    //         Cfull(url, link, name, des)));
                  },
                  child: Container(
                    height: 200,
                    margin: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: FadeInImage(
                        image: new NetworkImage(re[index].url),
                        fit: BoxFit.fill,
                        placeholder: new AssetImage(
                          "assets/lo.gif",
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    playYoutubeVideo(re[index].link);
                  },
                  child: Card(
                      margin: EdgeInsets.all(12),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          re[index].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ],
            );
          },
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Searching> suggestions = query.isEmpty
        ? re
        : re.where((youtube) {
            final cityLower = youtube.name.toLowerCase();
            final queryLower = query.toLowerCase();

            return cityLower.contains(
              queryLower,
            );
          }).toList();
    // final suggestions = query.isEmpty
    //     ? recentCities
    //     :
    //  cities.where((city) {
    //     final cityLower = city.toLowerCase();
    //     final queryLower = query.toLowerCase();

    //     return cityLower.startsWith(queryLower);
    //   }).toList();

    return buildSuggestionsSuccess(suggestions);
  }

  Widget buildSuggestionsSuccess(List<Searching> suggestions) =>
      ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index].name.toString();
          final url = suggestions[index].url.toString();
          final name = suggestions[index].name.toString();
          final link = suggestions[index].link.toString();
          final queryText = suggestion.substring(0, query.length);
          final remainingText = suggestion.substring(query.length);

          // final cont = suggestion.contains(query.length);

          return ListTile(
            onTap: () {
              // query = suggestion;

              // // 1. Show Results
              // showResults(context);

              // 2. Close Search & Return Result
              // close(context, suggestion);

              // 3. Navigate to Result Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Searchyou(url, link, name),
                ),
              );
            },
            leading: Icon(
              Icons.video_library_outlined,
              color: Colors.red,
            ),
            // title: Text(suggestion),
            title: RichText(
              text: TextSpan(
                text: queryText,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: remainingText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}

// ignore: must_be_immutable
class Searchyou extends StatefulWidget {
  String url;
  String link;
  String name;
  Searchyou(this.url, this.link, this.name);

  @override
  _SearchyouState createState() => _SearchyouState();
}

class _SearchyouState extends State<Searchyou> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                onTap: () async {
                  showSearch(context: context, delegate: CitySearch());
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 5,
                    margin: EdgeInsets.all(2),
                    color: Colors.blue[50],
                    child: Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Center(
                                child: Text(
                              " Search your query here.....",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ))),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 40,
                            ),
                            onPressed: () async {
                              showSearch(
                                  context: context, delegate: CitySearch());

                              // final results = await
                              //     showSearch(context: context, delegate: CitySearch());

                              // print('Result: $results');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(
                //         builder: (context) => Regi()));
                playYoutubeVideo(widget.link);
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) =>
                //         Cfull(url, link, name, des)));
              },
              child: Container(
                height: 200,
                margin: EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: FadeInImage(
                    image: new NetworkImage(widget.url),
                    fit: BoxFit.fill,
                    placeholder: new AssetImage(
                      "assets/lo.gif",
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                playYoutubeVideo(widget.link);
              },
              child: Card(
                  margin: EdgeInsets.all(12),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Paymentt()));
                },
                child: Container(
                  margin: EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Colors.green.shade100,
                        Colors.green.shade200
                      ])),
                      child: Container(
                          height: 50,
                          // width: MediaQuery.of(context).size.width - 10,
                          child: Center(
                              child: Text(
                            "Enhance Learning 👨‍👩‍👧‍👦",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ))),
                    ),
                  ),
                )),
            Card(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: ListTile(
                  onTap: () {
                    _shareText(widget.link, widget.name);
                  },
                  trailing: Icon(
                    Icons.share,
                    size: 30,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Share with Friends , Family & Relatives : Dr Vivek Bindra ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _shareText(String link2, String name) async {
  try {
    Share.text(
        'Dr vivek bindra ',
        'Welcome in Bada Business  :: $link2  $name :: https://play.google.com/store/apps/details?id=com.yashvendra.kumar welcome in bada business pvt ltd https://www.badabusiness.com/dd/BIYK005702/ Bada Business Consutant  ',
        'text/plain');
  } catch (e) {
    print('error: $e');
  }
}

class Searching {
  final String name;
  final String url;
  final String link;

  Searching({required this.name, required this.url, required this.link});
}

List<Searching> st = [];

List<Searching> re = [
  Searching(
      name: "Busyness Vs Business A Motivational Video Snippet 3",
      url: "https://i.ytimg.com/vi/knNMgo0l4cA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=knNMgo0l4cA&feature=youtu.be"),
  Searching(
      name: "How to choose the right platform for the product Snippet 1",
      url: "https://i.ytimg.com/vi/JeEFWRgQy-Y/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=JeEFWRgQy-Y&feature=youtu.be"),
  Searching(
      name: "How to Get Growth in Business by innovation Snippet 1",
      url: "https://i.ytimg.com/vi/OTdbUpyhasY/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=OTdbUpyhasY&feature=youtu.be"),
  Searching(
      name:
          "high sales through low cost marketing guerrilla marketing Snippet 6",
      url: "https://i.ytimg.com/vi/zYD7NZBS3-g/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=zYD7NZBS3-g&feature=youtu.be"),
  Searching(
      name: "How to easily win a tender ? Snippet 2",
      url: "https://i.ytimg.com/vi/wprGGW91mW4/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=wprGGW91mW4&feature=youtu.be"),
  Searching(
      name: "आखिर क्यों जरुरी है Digital Marketing , जानें",
      url: "https://i.ytimg.com/vi/gQoIeqYhYN8/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=gQoIeqYhYN8&feature=youtu.be"),
  Searching(
      name: "Digital Marketing ऐसे होता है Fraud Snippets2",
      url: "https://i.ytimg.com/vi/V0RNwUSSYuI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=V0RNwUSSYuI&feature=youtu.be"),
  Searching(
      name: "How to choose a good business partner? Snippet 3",
      url: "https://i.ytimg.com/vi/jwSSYTpRHMI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=jwSSYTpRHMI&feature=youtu.be"),
  Searching(
      name: "",
      url: "https://i.ytimg.com/vi/XtoIqfaFoBU/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=XtoIqfaFoBU&feature=youtu.be"),
  Searching(
      name: "What's the easiest way to turn turnover ? Snippet 3",
      url: "",
      link: ""),
  Searching(
      name: "How to grow business in less money Snippet 1",
      url: "https://i.ytimg.com/vi/ZD_UELmVu4c/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=ZD_UELmVu4c&feature=youtu.be"),
  Searching(
      name: " How to chosse good location for FRANCHISEE BUSINESS Snippet 4",
      url: "https://i.ytimg.com/vi/MifpC5ezlXk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=MifpC5ezlXk&feature=youtu.be"),
  Searching(
      name: "How to Choose Right franchise Model Snippet 1",
      url: "https://i.ytimg.com/vi/hm8Q21BJZoM/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=hm8Q21BJZoM&feature=youtu.be"),
  Searching(
      name: "How to Choose Right franchise Model Snippet 1",
      url: "https://i.ytimg.com/vi/hm8Q21BJZoM/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=hm8Q21BJZoM&feature=youtu.be"),
  Searching(
      name:
          "What is the franchise taking advantages and disadvantages ? Snippet 2",
      url: "https://i.ytimg.com/vi/WabnZXXr5w8/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=WabnZXXr5w8&feature=youtu.be"),
  Searching(
      name:
          "Business Strategy Adoption Curve | Business Success Formula for Entrepreneurs | Case Study | Dr. Vivek Bindra",
      url: "https://i.ytimg.com/vi/cXnhfNNLIUQ/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=cXnhfNNLIUQ&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=18"),
  Searching(
      name:
          "Business Strategy Best of Dr Vivek Bindra | Monopoly | Blue Ocean Strategy | Entry Barrier | Case Study in Hindi",
      url: "https://i.ytimg.com/vi/7rFGmHJFwsU/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=7rFGmHJFwsU&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=19"),
  Searching(
      name:
          "Business Strategy 3 Steps to Build Your Product Strategy | (Hindi) | Dr.Vivek Bindra",
      url: "https://i.ytimg.com/vi/EHtvELEaPfo/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=EHtvELEaPfo&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=20"),
  Searching(
      name:
          "Business Strategy Business Training Video on Price and Product Strategy (Hindi) by DR. Vivek Bindra",
      url: "https://i.ytimg.com/vi/Lj4hugQ1y7I/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=Lj4hugQ1y7I&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=21"),
  Searching(
      name:
          "Business Strategy Strategic Leadership के 5 नियम | Leadership Training Video in Hindi by Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/HE3HNqagPnE/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=HE3HNqagPnE&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=22"),
  Searching(
      name:
          "Business Strategy Discount दिए बिना Business Expansion कैसे करें | (Hindi) | By Dr. Vivek Bindra",
      url: "https://i.ytimg.com/vi/FEMPcrnHreA/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=FEMPcrnHreA&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=23"),
  Searching(
      name:
          "Business Strategy 5 Steps of Innovation | Part 1 | Hindi | By Dr Vivek Bindra | Leadership Trainer",
      url: "https://i.ytimg.com/vi/5m_NDMCeKaE/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=5m_NDMCeKaE&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=24"),
  Searching(
      name:
          "Business Strategy Guaranteed Success with Strategy & Execution by Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/yrpygHsZd5Y/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=yrpygHsZd5Y&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=25"),
  Searching(
      name:
          "Business Strategy Sales Training Videos in Hindi, Competitive Advantage in Business Marketing by Vivek Bindra",
      url: "https://i.ytimg.com/vi/diIKkG0gaV0/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=diIKkG0gaV0&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=26"),
  Searching(
      name:
          "Business Strategy Low Cost Innovation Ideas | Simple Ideas | Types of Innovations | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/DxR5gfIpTN8/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=DxR5gfIpTN8&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=27"),
  Searching(
      name:
          "Business Strategy Strategy को Implement कैसे किया जाता है | Strategic Execution | Hindi | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/nvy_6MLxsnc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=nvy_6MLxsnc&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=28"),
  Searching(
      name:
          "Business Strategy बिना पूंजी के बिज़नेस बड़ा कैसे करूं | 'B2B2C' Model | Q & A Series | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/cd8rR0GChc4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=cd8rR0GChc4&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=29"),
  Searching(
      name:
          "Business Strategy कैसे खिंचा चला आता है Customer! | 7 Marketing Strategies | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/h5-LpwwQJ6M/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=h5-LpwwQJ6M&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=30"),
  Searching(
      name:
          "Business Strategy How To Do Business Without Money | Co-Operative Society | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/fhgl7P_zwwQ/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=fhgl7P_zwwQ&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=31"),
  Searching(
      name:
          "Business Strategy 7 Tips To Increase Your Sales | Customer Loyalty | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/EP5CZUq6XUg/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=EP5CZUq6XUg&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=32"),
  Searching(
      name:
          "Business Strategy 10 Easy Steps To Start Your E-Commerce Business | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/Vf9E07v-3Nc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=Vf9E07v-3Nc&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=34"),
  Searching(
      name:
          "Business Strategy 8 Methods of Consumer Research & Innovation | Dr Vivek Bindra | Motivational Speaker",
      url: "https://i.ytimg.com/vi/uCVl-9kuHf8/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=uCVl-9kuHf8&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=33"),
  Searching(
      name:
          "Business Strategy कितनी बड़ी है E-Commerce Industry | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/cCyMxss5me0/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=cCyMxss5me0&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=35"),
  Searching(
      name:
          "Business Strategy BUSINESS में सफलता के तरीके | Leadership Funnel | Start Up Tips | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/6kIQXIm0VT4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=6kIQXIm0VT4&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=36"),
  Searching(
      name:
          "Business Strategy Quick Service Restaurant vs Full Service Restaurant | Business Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/cA5Xl-U74Ug/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=cA5Xl-U74Ug&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=37"),
  Searching(
      name:
          "Business Strategy 10 TIPS ON SEASONAL BUSINESS | OFF SEASON BUSINESS | DR VIVEK BINDRA",
      url: "https://i.ytimg.com/vi/nLyceVlwYqY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=nLyceVlwYqY&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=38"),
  Searching(
      name:
          "Business Strategy J Curve क्या होता है | हिन्दी वीडियो | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/OBAniaLSzfA/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=OBAniaLSzfA&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=39"),
  Searching(
      name:
          "Business Strategy Family Run vs Professionally Run Business | 3rd Generation | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/TahxRGejXTM/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=TahxRGejXTM&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=40"),
  Searching(
      name: "Use these 3 easy tips to increase sales ! Snippets 1",
      url: "https://i.ytimg.com/vi/6OlcZ3m-T2s/maxresdefault.jpg",
      link: "https://youtu.be/6OlcZ3m-T2s"),
  Searching(
      name: "3 Steps to Impress and Convince Video In Hindi Snippet 1",
      url: "https://i.ytimg.com/vi/4IKuReQKltQ/maxresdefault.jpg",
      link: "https://youtu.be/4IKuReQKltQ"),
  Searching(
      name: "How satisfied your customer is with your services? Snippet 2",
      url: "https://i.ytimg.com/vi/v8wxIiLYcyc/maxresdefault.jpg",
      link: "https://youtu.be/v8wxIiLYcyc"),
  Searching(
      name: "How to Understand your customer need Snippet 1:",
      url: "https://i.ytimg.com/vi/kXd_IL8hMtE/maxresdefault.jpg",
      link: "https://youtu.be/kXd_IL8hMtE"),
  Searching(
      name: "How to take your product to maximum customers ? Snippet 7",
      url: "https://i.ytimg.com/vi/8EM0s01Bllc/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=8EM0s01Bllc&feature=youtu.be"),
  Searching(
      name: "How to Manage Family Relations in Family Business Snippet 3",
      url: "https://i.ytimg.com/vi/M4fcynvZdfA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=M4fcynvZdfA&feature=youtu.be"),
  Searching(
      name: "What is Multiple things in business? Snippet 4",
      url: "https://i.ytimg.com/vi/66FGgajJMcU/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=66FGgajJMcU&feature=youtu.be"),
  Searching(
      name: "How to Grow your Brand visibility ? Snippet 3",
      url: "https://i.ytimg.com/vi/ZdHTt7qaTwE/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=ZdHTt7qaTwE&feature=youtu.be"),
  Searching(
      name: "How to creator Life Time Impression on Customer Snippet 3",
      url: "https://i.ytimg.com/vi/PluASAA3jqI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=PluASAA3jqI&feature=youtu.be"),
  Searching(
      name: "How to Attract your Customers snippet 4",
      url: "https://i.ytimg.com/vi/kAwlqauVht4/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=kAwlqauVht4&feature=youtu.be"),
  Searching(
      name: "Make your Business Successful by Customer Feedback snippet 2",
      url: "https://i.ytimg.com/vi/j_h7gMjVyHI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=j_h7gMjVyHI&feature=youtu.be"),
  Searching(
      name: "How to make your CUSTOMER PERMANENT? Snippet 1",
      url: "https://i.ytimg.com/vi/gfKEwccJ5Ag/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=gfKEwccJ5Ag&feature=youtu.be"),
  Searching(
      name: "How to Market Evaluation of your PRODUCT? Snippet 1",
      url: "https://i.ytimg.com/vi/GLu95n34ySQ/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=GLu95n34ySQ&feature=youtu.be"),
  Searching(
      name: "How to win the trust of the customer by tagline Snippet 2",
      url: "https://i.ytimg.com/vi/EeqEoOMzm9U/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=EeqEoOMzm9U&feature=youtu.be"),
  Searching(
      name: "Great Formula to Make Customers Loyal snippet 1",
      url: "https://i.ytimg.com/vi/C463CsRBZ20/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=C463CsRBZ20&feature=youtu.be"),
  Searching(
      name: "How to get good DECISION based on COST and BENIFIT? Snippet 1",
      url: "https://i.ytimg.com/vi/hkAvT1meY_Y/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=hkAvT1meY_Y&feature=youtu.be"),
  Searching(
      name: "How to Calculate cost and benefit Snippet 2",
      url: "https://i.ytimg.com/vi/oYF-VKtu86E/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=oYF-VKtu86E&feature=youtu.be"),
  Searching(
      name: "How to occupy the Market without Competition?",
      url: "https://i.ytimg.com/vi/oYF-VKtu86E/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=oYF-VKtu86E&feature=youtu.be"),
  Searching(
      name: "Trade Show Marketing!",
      url: "https://i.ytimg.com/vi/N9_C_Sk4mu8/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=N9_C_Sk4mu8&feature=youtu.be"),
  Searching(
      name: "How to attract your customers?",
      url: "https://i.ytimg.com/vi/XGWpHyQ5D_w/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=XGWpHyQ5D_w&feature=youtu.be"),
  Searching(
      name: "How to increase Ticket size of a business?",
      url: "https://i.ytimg.com/vi/unYrmVPPGNg/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=unYrmVPPGNg&feature=youtu.be"),
  Searching(
      name: "How to make a Quick Service Restaurant successful?",
      url: "https://i.ytimg.com/vi/37Ln_3-_HvM/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=37Ln_3-_HvM&feature=youtu.be"),
  Searching(
      name: "How to save operational cost from fluctuation?",
      url: "https://i.ytimg.com/vi/kryg8EZYnh4/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=kryg8EZYnh4&feature=youtu.be"),
  Searching(
      name: "Increase sales to understand the consumer's behavior ! Snippet 1",
      url: "https://i.ytimg.com/vi/oDWGx4WNMbg/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=oDWGx4WNMbg&feature=youtu.be"),
  Searching(
      name: "How to Identify Your Target Customer? Snippet 3",
      url: "https://i.ytimg.com/vi/oqANVUARE4w/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=oqANVUARE4w&feature=youtu.be"),
  Searching(
      name: "Increase your product Sals from Upselling!",
      url: "https://i.ytimg.com/vi/RNVnjh_oCUw/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=RNVnjh_oCUw&feature=youtu.be"),
  Searching(
      name: "How to run Seasonal business in Off Season?",
      url: "https://i.ytimg.com/vi/W8Sry_Yu294/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=W8Sry_Yu294&feature=youtu.be"),
  Searching(
      name: "How to market the product Dhoom! Snippet 5",
      url: "https://www.youtube.com/watch?v=5IeXzk7J_e8&feature=youtu.be",
      link: "https://www.youtube.com/watch?v=5IeXzk7J_e8&feature=youtu.be"),
  Searching(
      name: "What is INBOUND MARKETING and OUTBOUND MARKETING? Snippet 6",
      url: "https://i.ytimg.com/vi/f_6UdMqa4OY/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=f_6UdMqa4OY&feature=youtu.be"),
  Searching(
      name:
          "Business Strategy BITCOIN में INVESTMENT करें या नहीं I Complete Analysis I Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/mYfoh0xLKeQ/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=mYfoh0xLKeQ&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=41"),
  Searching(
      name:
          "Business Strategy आखिर OLA कब तक पैसे लुटायेगी | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/Sk91U36QjNQ/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=Sk91U36QjNQ&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=42"),
  Searching(
      name:
          "Business Strategy कैसे Demonetization ने बनाया अरबपति ? | Paytm Case Study | Dr Vivek Bindra",
      url: " ",
      link: " "),
  Searching(
      name: "Business Strategy",
      url: "https://i.ytimg.com/vi/-x6KnPi6yHQ/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=-x6KnPi6yHQ&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=43"),
  Searching(
      name:
          "Business Strategy How To Sell | Probing Technique | Selling Skills | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/s4lA_9VMUCo/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=s4lA_9VMUCo&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=44"),
  Searching(
      name:
          "Business Strategy Moment Marketing | Most Powerful Technique Of Guerilla Marketing | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/Hn6KdtOCr-M/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=Hn6KdtOCr-M&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=45"),
  Searching(
      name:
          "Sales :कस्टमर को वफादार बनाने के तरीके | 5 Formulas For Customer Loyalty | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/bzmJDEljstI/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=bzmJDEljstI&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=1"),
  Searching(
      name:
          "Sales : Business को AUTOPILOT पे कैसे लेके जाएँ | TRA-TRS Formula | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/0CF30hp6TS8/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=0CF30hp6TS8&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=2"),
  Searching(
      name: "Sales : 4 Step Formula for Strategic Execution | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/5bpb8nI9d1E/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=5bpb8nI9d1E&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=3"),
  Searching(
      name:
          "Sales : Customer को Loyal कैसे बनाएँ | Full Video | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/vu6ye7ilDoY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=vu6ye7ilDoY&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=4"),
  Searching(
      name:
          "Sales : इस Video को देखने के बाद Customer ज़िंदगी भर याद रखेगा | Jingle | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/2pWEXanKSC0/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=2pWEXanKSC0&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=5"),
  Searching(
      name:
          "Sales :How To Generate Recall Value | Brand Promise | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/wQYn5g_0hYY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=wQYn5g_0hYY&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=6"),
  Searching(
      name: "Sales :Low Cost Marketing Technique | Hook | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/SWRwHrtPIQw/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=SWRwHrtPIQw&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=7"),
  Searching(
      name:
          "Sales :Low Cost Innovation Ideas | Simple Ideas | Types of Innovations | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/DxR5gfIpTN8/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=DxR5gfIpTN8&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=8"),
  Searching(
      name:
          "Sales : किस Business में पैसा लगाएँ | Adoption Curve | Market Analysis | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/B9bmjp9wVaw/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=B9bmjp9wVaw&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=9"),
  Searching(
      name:
          "Sales :Strategy को Implement कैसे किया जाता है | Strategic Execution | Hindi | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/B9bmjp9wVaw/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=nvy_6MLxsnc&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=10"),
  Searching(
      name:
          "Sales :COCA Model | Cost of Customer Acquisition | Q&A Series | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/82kB-MpALn4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=82kB-MpALn4&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=11"),
  Searching(
      name:
          "Sales :बिना पूंजी के बिज़नेस बड़ा कैसे करूं | 'B2B2C' Model | Q & A Series | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/cd8rR0GChc4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=cd8rR0GChc4&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=12"),
  Searching(
      name:
          "Sales :कैसे खिंचा चला आता है Customer! | 7 Marketing Strategies | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/cd8rR0GChc4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=h5-LpwwQJ6M&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=13"),
  Searching(
      name:
          "Sales : एक छोटी कम्पनी में Process कैसे बनाएं | Process Orientation | SOP | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/h5-LpwwQJ6M/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=XetKX1nKWnU&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=14"),
  Searching(
      name:
          "Sales :How To Do Business Without Money | Co-Operative Society | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/fhgl7P_zwwQ/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=fhgl7P_zwwQ&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=15"),
  Searching(
      name:
          "Sales : 8 Methods of Consumer Research & Innovation | Dr Vivek Bindra | Motivational Speaker",
      url: "https://i.ytimg.com/vi/uCVl-9kuHf8/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=uCVl-9kuHf8&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=16"),
  Searching(
      name:
          "Sales :10 Easy Steps To Start Your E-Commerce Business | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/Vf9E07v-3Nc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=Vf9E07v-3Nc&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=17"),
  Searching(
      name:
          "Sales :Quick Service Restaurant vs Full Service Restaurant | Business Case Study | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/cA5Xl-U74Ug/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=cA5Xl-U74Ug&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=18"),
  Searching(
      name:
          "Sales :10 TIPS ON SEASONAL BUSINESS | OFF SEASON BUSINESS | DR VIVEK BINDRA ",
      url: "https://i.ytimg.com/vi/nLyceVlwYqY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=nLyceVlwYqY&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=19"),
  Searching(
      name:
          "Sales :High Sales Through Low Cost Marketing | GUERRILLA MARKETING | DR VIVEK BINDRA | ",
      url: "https://i.ytimg.com/vi/AfIRQKt6ufo/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=AfIRQKt6ufo&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=20"),
  Searching(
      name:
          "Sales : Business में सफलता के उपाय | Leadership Funnel | Start Up Tips | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/6K-PPzWTJzI/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=6K-PPzWTJzI&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=21"),
  Searching(
      name: "Busyness Vs Business A Motivational Video Snippet 3",
      url: "https://i.ytimg.com/vi/knNMgo0l4cA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=knNMgo0l4cA&feature=youtu.be"),
  Searching(
      name:
          "Business Strategy : एक आदमी से पाँच आदमी का काम कैसे कराएं ? Employee Motivation | Dr Vivek Bindra",
      url: "https://img.youtube.com/vi/yAPivJtSjpY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=yAPivJtSjpY&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz"),
  Searching(
      name: "How to choose the right platform for the product Snippet 1",
      url: "https://i.ytimg.com/vi/JeEFWRgQy-Y/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=JeEFWRgQy-Y&feature=youtu.be"),
  Searching(
      name: "How to Get Growth in Business by innovation Snippet 1",
      url: "https://i.ytimg.com/vi/OTdbUpyhasY/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=OTdbUpyhasY&feature=youtu.be"),
  Searching(
      name:
          "Case Study: JIO का चौंकाने वाला Business Plan | A Case Study in Hindi | By Dr. Vivek Bindra",
      url: "https://i.ytimg.com/vi/EdKjmV5JOPo/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=EdKjmV5JOPo&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=13"),
  Searching(
      name:
          "Case Study: Why Bihar is a Backward State | Must watch Case Study by Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/CL7c3DfPPc8/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=CL7c3DfPPc8&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=14"),
  Searching(
      name:
          "Case Study: Best of Dr Vivek Bindra | Monopoly | Blue Ocean Strategy | Entry Barrier | Case Study in Hindi",
      url: "https://i.ytimg.com/vi/7rFGmHJFwsU/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=7rFGmHJFwsU&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=15"),
  Searching(
      name:
          "Case Study: क्या है MLM की सच्चाई ? Case Study on Network Marketing | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/2kXbdIw0Nx4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=2kXbdIw0Nx4&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=16"),
  Searching(
      name:
          "Case Study: आखिर OLA कब तक पैसे लुटायेगी | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/Sk91U36QjNQ/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=Sk91U36QjNQ&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=17"),
  Searching(
      name:
          "Case Study:अब तक का सबसे मोटिवेशनल वीडियो | Chattrapati Shivaji | Case Study by Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/elNfKOiVWb0/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=elNfKOiVWb0&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=18"),
  Searching(
      name:
          "Case Study: Amazing Facts | क्यों हुई टाटा नैनो फेल | StartUp Ideas by Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/J5z6AYuhUKQ/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=J5z6AYuhUKQ&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=19"),
  Searching(
      name:
          "Case Study:कैसे बने गुजराती इतने अमीर ? | Case Study On Gujarat By Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/0il6XXuOIBg/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=0il6XXuOIBg&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=20"),
  Searching(
      name:
          "Case Study:ComeBack of Nokia | Nokia वापसी की पूरी कहानी | Case Study | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/-kEj3fqZUFM/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=-kEj3fqZUFM&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=21"),
  Searching(
      name:
          "Success Mantra of Great Leaders, Motivational Story in Hindi Video by Vivek Bindra",
      url: "https://i.ytimg.com/vi/fkxABk-pzBc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=fkxABk-pzBc&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=25"),
  Searching(
      name:
          "Search for Happiness How to be Happy in Life by Best Life Coach in India Vivek Bindra",
      url: "https://i.ytimg.com/vi/GcimY9RAVQc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=GcimY9RAVQc&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=26"),
  Searching(
      name: "Busyness Vs Business A Motivational Video Snippet 3",
      url: "https://i.ytimg.com/vi/knNMgo0l4cA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=knNMgo0l4cA&feature=youtu.be"),
  Searching(
      name: "How to choose the right platform for the product Snippet 1",
      url: "https://i.ytimg.com/vi/JeEFWRgQy-Y/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=JeEFWRgQy-Y&feature=youtu.be"),
  Searching(
      name: "How to Get Growth in Business by innovation Snippet 1",
      url: "https://i.ytimg.com/vi/OTdbUpyhasY/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=OTdbUpyhasY&feature=youtu.be"),
  Searching(
      name: "These 5 types of listeners are in the world ! Snippts 4",
      url: "https://i.ytimg.com/vi/XsWTOwDelVQ/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=XsWTOwDelVQ&feature=youtu.be"),
  Searching(
      name: "How To Run Your Seasonal Business In Off Season? snippet 1",
      url: "https://i.ytimg.com/vi/9NU4joWKbTM/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=9NU4joWKbTM&feature=youtu.be"),
  Searching(
      name: "How to Develop Billion Dollar Snippets 3",
      url: "https://i.ytimg.com/vi/AbcVCiGX7ZE/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=AbcVCiGX7ZE&feature=youtu.be"),
  Searching(
      name: "How to choose a good distributor Snippet 5",
      url: "https://i.ytimg.com/vi/EcDgt6sJ96M/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=EcDgt6sJ96M&feature=youtu.be"),
  Searching(
      name: "Tips to make Successful Franchise Business Snippet 4",
      url: "https://i.ytimg.com/vi/1EyX9flahJc/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=1EyX9flahJc&feature=youtu.be"),
  Searching(
      name: "How to Control the online selling website? Snippet 7",
      url: "https://i.ytimg.com/vi/PTzjHW5EhLI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=PTzjHW5EhLI&feature=youtu.be"),
  Searching(
      name: "How is shipping in online business? Snippet 6",
      url: "https://i.ytimg.com/vi/1g0YM_sa6Qs/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=1g0YM_sa6Qs&feature=youtu.be"),
  Searching(
      name: "Why Margin, Fee and ROI are very important to know ! Snippet 5",
      url: "https://i.ytimg.com/vi/8M7z9UP9QvE/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=8M7z9UP9QvE&feature=youtu.be"),
  Searching(
      name:
          "How To Choose The Online Selling Website For Your Product ? Snippet 4",
      url: "https://i.ytimg.com/vi/OGAw1GL_E-Y/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=OGAw1GL_E-Y&feature=youtu.be"),
  Searching(
      name: "E-Commerce Business Benefits! Snippet 1",
      url: "https://i.ytimg.com/vi/0R4G8bKhBk4/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=0R4G8bKhBk4&feature=youtu.be"),
  Searching(
      name: "https://i.ytimg.com/vi/JC5VfVandcA/maxresdefault.jpg",
      url:
          "https://i.ytimg.com/vi/JC5VfVandcA/maxresdefault.jpghttps://i.ytimg.com/vi/JC5VfVandcA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=JC5VfVandcA&feature=youtu.be"),
  Searching(
      name: "चाणक्य की वो 7 Strategies जो आप नहीं जानते | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/PFnJvUNK6t0/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=PFnJvUNK6t0"),
  Searching(
      name: "How to Improve Company Performance? Snippet 1",
      url: "https://i.ytimg.com/vi/AJ4jJffbX4Q/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=AJ4jJffbX4Q&feature=youtu.be"),
  Searching(
      name: "How to Win Tender Despite Less Expertise? Snippet 4",
      url: "https://i.ytimg.com/vi/0ATsp7Gy4Gw/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=0ATsp7Gy4Gw&feature=youtu.be"),
  Searching(
      name: "Asset light model Snippet 3",
      url: "https://i.ytimg.com/vi/ZscevzyScFA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=ZscevzyScFA&feature=youtu.be"),
  Searching(
      name: "How to increase sales without manpower ? Snippet 5",
      url: "https://i.ytimg.com/vi/SC9btc1tQwM/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=SC9btc1tQwM&feature=youtu.be"),
  Searching(
      name: "How to easily win a tender ? Snippet 2",
      url: "https://www.youtube.com/watch?v=QLrgBY1kwXA&feature=youtu.be",
      link: "https://www.youtube.com/watch?v=QLrgBY1kwXA&feature=youtu.be"),
  Searching(
      name: "अपने BUSSINESS को FRANCHISEE की मदद से कैसे बढ़ाएं Snippet 2",
      url: "https://www.youtube.com/watch?v=uC9rOJ4qCqs&feature=youtu.be",
      link: "https://www.youtube.com/watch?v=uC9rOJ4qCqs&feature=youtu.be"),
  Searching(
      name: "What is Franchise Business? Snippets 1",
      url: "https://www.youtube.com/watch?v=8M8nh68ogmg&feature=youtu.be",
      link: "https://www.youtube.com/watch?v=8M8nh68ogmg&feature=youtu.be"),
  Searching(
      name: "How To Make The Best Connection With Difficult Boss",
      url: "https://i.ytimg.com/vi/fpfrVDEblp0/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=fpfrVDEblp0&feature=youtu.be"),
  Searching(
      name: "How to increase organization? Snippet 1",
      url: "https://i.ytimg.com/vi/ZoUFOZQlqTI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=ZoUFOZQlqTI&feature=youtu.be"),
  Searching(
      name: "How To Deal With Insecure People! Snippet 2",
      url: "https://i.ytimg.com/vi/cs0OhRXj8Pw/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=cs0OhRXj8Pw&feature=youtu.be"),
  Searching(
      name: "How to increase organization? Snippet 1",
      url: "https://i.ytimg.com/vi/ZoUFOZQlqTI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=ZoUFOZQlqTI&feature=youtu.be"),
  Searching(
      name: "What to do to generate resources in business ? Snippets 1",
      url: "https://i.ytimg.com/vi/Xcm7xN54SUI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=Xcm7xN54SUI&feature=youtu.be"),
  Searching(
      name: "How to inspire employee Snippets 1",
      url: "https://i.ytimg.com/vi/O_0rco26EK4/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=O_0rco26EK4&feature=youtu.be"),
  Searching(
      name: "How to Calculate Your Effort and Result ? Snippets 3",
      url: "https://i.ytimg.com/vi/iuJkTV9sGvk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=iuJkTV9sGvk&feature=youtu.be"),
  Searching(
      name:
          "Keeping these things in mind while promoting the employee ! Snippet 3",
      url: "https://i.ytimg.com/vi/tSTnvIaXQTU/sddefault.jpg",
      link: "https://www.youtube.com/watch?v=tSTnvIaXQTU&feature=youtu.be"),
  Searching(
      name: "The perfect way to hire Perfect Manpower! Snippet 1",
      url: "https://i.ytimg.com/vi/3JNxQ6sXqlo/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=3JNxQ6sXqlo&feature=youtu.be"),
  Searching(
      name: "Are not you hiring a wrong Candidate ? Snippet 6",
      url: "https://i.ytimg.com/vi/bKfppoKJiWE/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=bKfppoKJiWE&feature=youtu.be"),
  Searching(
      name: "How to do your Competitiveness Evaluation? Snippet 2",
      url: "https://i.ytimg.com/vi/Am3C01nJDCk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=Am3C01nJDCk&feature=youtu.be"),
  Searching(
      name: "How to do your PERFORMANCE ANALYSIS ? Snippet 3",
      url: "https://i.ytimg.com/vi/nJvhAnfSymg/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=nJvhAnfSymg&feature=youtu.be"),
  Searching(
      name: "How to engaged your Employee for long time ? Snippet 1",
      url: "https://i.ytimg.com/vi/roYwDGo7T94/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=roYwDGo7T94&feature=youtu.be"),
  Searching(
      name: "How to Make Your Employees More Committed Snippet 4",
      url: "https://i.ytimg.com/vi/Kk1KcNAkdHY/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=Kk1KcNAkdHY&feature=youtu.be"),
  Searching(
      name: "How to Make Your Employees More Committed Snippet 3",
      url: "https://i.ytimg.com/vi/oIhFR-ijklM/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=oIhFR-ijklM&feature=youtu.be"),
  Searching(
      name: "How to Improve Transparency in Your Organization Snippet 2",
      url: "https://i.ytimg.com/vi/_qPMf4Iggyk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=_qPMf4Iggyk&feature=youtu.be"),
  Searching(
      name: "How to make COMPANY CULTURE brilliant? Snippet 3",
      url: "",
      link: "https://www.youtube.com/watch?v=R5V110m564s&feature=youtu.be"),
  Searching(
      name: "How to make your employees dedicated?",
      url: "https://i.ytimg.com/vi/R5V110m564s/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=vHv3Q-0g7Cs&feature=youtu.be"),
  Searching(
      name: "How to retain a good employee in the company?",
      url: "https://i.ytimg.com/vi/lk_17EpyMFM/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=lk_17EpyMFM&feature=youtu.be"),
  Searching(
      name: "How to retain employee for long time?",
      url: "https://i.ytimg.com/vi/giiNvM78490/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=giiNvM78490&feature=youtu.be"),
  Searching(
      name: "How to motivate employees?",
      url: "https://i.ytimg.com/vi/h0AFXA_CNdE/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=h0AFXA_CNdE&feature=youtu.be"),
  Searching(
      name: "Take care of these things at Employee Hiring! Snippet 7",
      url: "https://i.ytimg.com/vi/JYzhe_pWzu4/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=JYzhe_pWzu4&feature=youtu.be"),
  Searching(
      name: "How to test Employees' worth Snippet 4",
      url: "https://i.ytimg.com/vi/CZGZnY2_d7c/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=CZGZnY2_d7c&feature=youtu.be"),
  Searching(
      name: "How to Do External Hiring Company's Needs Completed! ? Snippet 2",
      url: "https://i.ytimg.com/vi/jTBA3RkHbtA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=jTBA3RkHbtA&feature=youtu.be"),
  Searching(
      name: "At the time of Employee Hiring, do this work ! Snippet 5",
      url: "https://i.ytimg.com/vi/nDICF-h9OtA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=nDICF-h9OtA&feature=youtu.be"),
  Searching(
      name: "For want to be successful in life,never forget this word",
      url: "https://i.ytimg.com/vi/s_2HXGJbAXU/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=s_2HXGJbAXU&feature=youtu.be"),
  Searching(
      name: "3 Steps For Guaranteed Secret of Success Snippet 1",
      url: "https://i.ytimg.com/vi/RUhAexfiyGQ/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=RUhAexfiyGQ&feature=youtu.be"),
  Searching(
      name:
          "How To Handle Negative Emotions, Emotional Intelligence Snippets 1",
      url: "https://i.ytimg.com/vi/Q6aMDJUGyCA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=Q6aMDJUGyCA&feature=youtu.be"),
  Searching(
      name: "New year Resolution Motivation",
      url: "https://i.ytimg.com/vi/2uimpt4pjT8/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=2uimpt4pjT8&feature=youtu.be"),
  Searching(
      name: "How to Avoid Brain WASHING? snippet 1",
      url: "https://i.ytimg.com/vi/Ahtj5SwL3UY/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=Ahtj5SwL3UY&feature=youtu.be"),
  Searching(
      name: "How to make your life worry-free?",
      url: "https://i.ytimg.com/vi/FtyzaSuPv_Y/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=FtyzaSuPv_Y&feature=youtu.be"),
  Searching(
      name: "How to overcome the difficulties of your life? snippet 3",
      url: "https://i.ytimg.com/vi/h20QZey015o/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=h20QZey015o&feature=youtu.be"),
  Searching(
      name: "How to bring revolutionary change in life?",
      url: "https://i.ytimg.com/vi/rPcpIq49JjQ/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=rPcpIq49JjQ&feature=youtu.be"),
  Searching(
      name: "How to change your attitude towards life?",
      url: "https://i.ytimg.com/vi/4Z9lyhY1i8I/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=4Z9lyhY1i8I&feature=youtu.be"),
  Searching(
      name: "Get this thinking with success in life! Snippet 2",
      url: "https://i.ytimg.com/vi/NeB_-fwHwSI/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=NeB_-fwHwSI&feature=youtu.be"),
  Searching(
      name:
          "एक आदमी से पाँच आदमी का काम कैसे कराएं ? Employee Motivation | Dr Vivek Bindra",
      url: "https://img.youtube.com/vi/yAPivJtSjpY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=yAPivJtSjpY&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz"),
  Searching(
      name:
          "Business Strategy: बढ़िया Manpower को कैसे रोक के रखें | How To Retain Manpower | Hindi Video | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/8V2_rvCyErM/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=8V2_rvCyErM&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=2"),
  Searching(
      name:
          "Business Strategy: कम लागत में करोड़ो कैसे कमाएं ? | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/JKD_V4e22Mc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=JKD_V4e22Mc&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=3"),
  Searching(
      name:
          "Business Strategy: सबसे बड़ा डायमंड कैसे बनें | MLM Sales | Network Marketing | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/UPJt2jTzLoo/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=UPJt2jTzLoo&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=4"),
  Searching(
      name:
          "Business Strategy : छोटा दुकानदार Business कैसे बड़ा करे | 1 ब्रांच' से 100 ब्रांच का Formula | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/72BDLwHZeEs/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=72BDLwHZeEs&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=5"),
  Searching(
      name:
          "Business Strategy : Business को AUTOPILOT पे कैसे लेके जाएँ | TRA-TRS Formula | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/0CF30hp6TS8/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=0CF30hp6TS8&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=6"),
  Searching(
      name:
          "Business Strategy : 4 Step Formula for Strategic Execution | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/5bpb8nI9d1E/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=5bpb8nI9d1E&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=7"),
  Searching(
      name:
          "Business Strategy :Customer को Loyal कैसे बनाएँ | Full Video | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/vu6ye7ilDoY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=vu6ye7ilDoY&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=8"),
  Searching(
      name:
          "Business Strategy :इस Video को देखने के बाद Customer ज़िंदगी भर याद रखेगा | Jingle | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/2pWEXanKSC0/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=2pWEXanKSC0&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=9"),
  Searching(
      name:
          "Business Strategy : Low Cost Marketing Technique | Hook | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/SWRwHrtPIQw/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=SWRwHrtPIQw&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=10"),
  Searching(
      name:
          "Business Strategy : How To Generate Recall Value | Brand Promise | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/wQYn5g_0hYY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=wQYn5g_0hYY&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=11"),
  Searching(
      name:
          "Business Strategy : किस Business में पैसा लगाएँ | Adoption Curve | Market Analysis | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/B9bmjp9wVaw/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=B9bmjp9wVaw&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=12"),
  Searching(
      name:
          "Business Strategy : MARKET से फंसा हुआ पैसा, वापस कैसे लाएं? | Dr Vivek Bindra |",
      url: "https://i.ytimg.com/vi/_NUhy1b1WYk/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=_NUhy1b1WYk&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=13"),
  Searching(
      name:
          "Business Strategy : अपना PRODUCTIVITY PLANNER कैसे बनाएं | Dr Vivek Bindra |",
      url: "https://i.ytimg.com/vi/ZnWxhT-MEjc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=ZnWxhT-MEjc&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=14"),
  Searching(
      name:
          "Business Strategy : एक छोटी कम्पनी में Process कैसे बनाएं | Process Orientation | SOP | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/XetKX1nKWnU/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=XetKX1nKWnU&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=15"),
  Searching(
      name:
          "Business Strategy : बिना खर्चा किए ADVERTISING MARKETING कैसे करें | CROSS PROMOTION | Dr Vivek Bindra |",
      url: "https://i.ytimg.com/vi/cutFRx4W260/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=cutFRx4W260&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=16"),
  Searching(
      name:
          "Business Strategy High Sales Through Low Cost Marketing | GUERRILLA MARKETING | DR VIVEK BINDRA |",
      url: "https://i.ytimg.com/vi/AfIRQKt6ufo/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=AfIRQKt6ufo&list=PLOxBmXq4mdMPu_nuh6IidF6gDcVI8mNnz&index=17"),
  Searching(
      name:
          "Why is it necessary to understand the Behaviour of the Competitor ? Snippet 2",
      url: "https://i.ytimg.com/vi/gzkfoMqniec/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=gzkfoMqniec&feature=youtu.be"),
  Searching(
      name: "How to Present Product Catalog? Snippet 3",
      url: "https://i.ytimg.com/vi/BbXU219OsQs/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=BbXU219OsQs&feature=youtu.be"),
  Searching(
      name: "Make your life free of debt snippet 1",
      url: "https://i.ytimg.com/vi/pBeh5UJQqRc/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=pBeh5UJQqRc&feature=youtu.be"),
  Searching(
      name:
          "How to Manage Multiple Things and Main Things in Business Snippet 2",
      url: "https://i.ytimg.com/vi/ve6bJ4JnvUs/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=ve6bJ4JnvUs&feature=youtu.be"),
  Searching(
      name: "Make Your Review Meetings Effective! SNIPPET 1",
      url: "https://i.ytimg.com/vi/23hfHFXSbGk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=23hfHFXSbGk&feature=youtu.be"),
  Searching(
      name: "Sales :10 Tips You Must Know To Win a TENDER | DR VIVEK BINDRA | ",
      url: "https://i.ytimg.com/vi/Ff2KCEIck1Q/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=Ff2KCEIck1Q&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=22"),
  Searching(
      name:
          "Sales : PSP Formula | Business Training Video In Hindi | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/eP-jkoUxTG4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=eP-jkoUxTG4&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=23"),
  Searching(
      name:
          "Sales : अगर अपनी SALES 10 गुणा बढ़ाना चाहते हैं तो यह वीडियो जरूर देखें | DR VIVEK BINDRA |",
      url: "https://i.ytimg.com/vi/x9tGIkB1_54/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=x9tGIkB1_54&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=24"),
  Searching(
      name:
          "Sales :MARKET से फंसा हुआ पैसा, वापस कैसे लाएं? | Dr Vivek Bindra | ",
      url: "https://i.ytimg.com/vi/_NUhy1b1WYk/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=_NUhy1b1WYk&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=25"),
  Searching(
      name:
          "Sales : कैसे एक बड़ी Company अपना Product पूरे देश में पहुँचाती है | Dr. Vivek Bindra",
      url: "https://i.ytimg.com/vi/XUQMWzytYbw/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=XUQMWzytYbw&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=26"),
  Searching(
      name:
          "Sales : बिना खर्चा किए ADVERTISING MARKETING कैसे करें | CROSS PROMOTION | Dr Vivek Bindra |",
      url: "https://i.ytimg.com/vi/cutFRx4W260/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=cutFRx4W260&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=27"),
  Searching(
      name:
          "Sales : How To Grow Your Business Exponentially | Leadership Funnel | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/RlaubIO8WWM/maxresdefault.jpg",
      link: "https://i.ytimg.com/vi/RlaubIO8WWM/maxresdefault.jpg"),
  Searching(
      name:
          "Sales : 7 Strategies To Grow Your Sales | Super Salesman | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/BcW3PYLNIW4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=BcW3PYLNIW4&list=PLOxBmXq4mdMOKmRfqQsjQ7zAdnWC-nkPO&index=29"),
  Searching(
      name:
          "Marketing : कस्टमर को वफादार बनाने के तरीके | 5 Formulas For Customer Loyalty | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/bzmJDEljstI/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=bzmJDEljstI&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB"),
  Searching(
      name:
          "Marketing : Business को AUTOPILOT पे कैसे लेके जाएँ | TRA-TRS Formula | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/0CF30hp6TS8/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=0CF30hp6TS8&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=2"),
  Searching(
      name:
          "Marketing : 4 Step Formula for Strategic Execution | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/5bpb8nI9d1E/hqdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=5bpb8nI9d1E&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=3"),
  Searching(
      name:
          "Marketing :Customer को Loyal कैसे बनाएँ | Full Video | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/vu6ye7ilDoY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=vu6ye7ilDoY&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=4"),
  Searching(
      name:
          "Marketing :इस Video को देखने के बाद Customer ज़िंदगी भर याद रखेगा | Jingle | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/2pWEXanKSC0/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=2pWEXanKSC0&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=5"),
  Searching(
      name:
          "Marketing : How To Generate Recall Value | Brand Promise | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/wQYn5g_0hYY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=wQYn5g_0hYY&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=6"),
  Searching(
      name: "Marketing : Low Cost Marketing Technique | Hook | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/SWRwHrtPIQw/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=SWRwHrtPIQw&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=7"),
  Searching(
      name:
          "Marketing : Low Cost Innovation Ideas | Simple Ideas | Types of Innovations | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/DxR5gfIpTN8/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=DxR5gfIpTN8&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=8"),
  Searching(
      name:
          "Marketing : किस Business में पैसा लगाएँ | Adoption Curve | Market Analysis | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/B9bmjp9wVaw/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=B9bmjp9wVaw&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=9"),
  Searching(
      name:
          "Marketing :Strategy को Implement कैसे किया जाता है | Strategic Execution | Hindi | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/nvy_6MLxsnc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=nvy_6MLxsnc&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=10"),
  Searching(
      name:
          "Marketing : COCA Model | Cost of Customer Acquisition | Q&A Series | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/82kB-MpALn4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=82kB-MpALn4&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=11"),
  Searching(
      name:
          "Marketing : बिना पूंजी के बिज़नेस बड़ा कैसे करूं | 'B2B2C' Model | Q & A Series | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/cd8rR0GChc4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=cd8rR0GChc4&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=12"),
  Searching(
      name:
          "Marketing :कैसे खिंचा चला आता है Customer! | 7 Marketing Strategies | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/h5-LpwwQJ6M/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=h5-LpwwQJ6M&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=13"),
  Searching(
      name:
          "Marketing :एक छोटी कम्पनी में Process कैसे बनाएं | Process Orientation | SOP | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/XetKX1nKWnU/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=XetKX1nKWnU&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=14"),
  Searching(
      name:
          "Marketing : How To Do Business Without Money | Co-Operative Society | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/fhgl7P_zwwQ/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=fhgl7P_zwwQ&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=15"),
  Searching(
      name:
          "Marketing :8 Methods of Consumer Research & Innovation | Dr Vivek Bindra | Motivational Speaker ",
      url: "https://i.ytimg.com/vi/uCVl-9kuHf8/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=uCVl-9kuHf8&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=16"),
  Searching(
      name:
          "Marketing : 10 Easy Steps To Start Your E-Commerce Business | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/Vf9E07v-3Nc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=Vf9E07v-3Nc&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=17"),
  Searching(
      name:
          "Marketing :Quick Service Restaurant vs Full Service Restaurant | Business Case Study | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/cA5Xl-U74Ug/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=cA5Xl-U74Ug&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=18"),
  Searching(
      name:
          "Marketing :10 TIPS ON SEASONAL BUSINESS | OFF SEASON BUSINESS | DR VIVEK BINDRA ",
      url: "https://i.ytimg.com/vi/nLyceVlwYqY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=nLyceVlwYqY&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=19"),
  Searching(
      name:
          "Marketing : High Sales Through Low Cost Marketing | GUERRILLA MARKETING | DR VIVEK BINDRA |",
      url: "https://i.ytimg.com/vi/AfIRQKt6ufo/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=AfIRQKt6ufo&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=20"),
  Searching(
      name:
          "Marketing : Business में सफलता के उपाय | Leadership Funnel | Start Up Tips | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/6K-PPzWTJzI/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=6K-PPzWTJzI&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=21"),
  Searching(
      name:
          "Marketing : 10 Tips You Must Know To Win a TENDER | DR VIVEK BINDRA |",
      url: "https://i.ytimg.com/vi/Ff2KCEIck1Q/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=Ff2KCEIck1Q&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=22"),
  Searching(
      name:
          "Marketing : PSP Formula | Business Training Video In Hindi | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/eP-jkoUxTG4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=eP-jkoUxTG4&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=23"),
  Searching(
      name:
          "Marketing : अगर अपनी SALES 10 गुणा बढ़ाना चाहते हैं तो यह वीडियो जरूर देखें | DR VIVEK BINDRA |",
      url: "https://i.ytimg.com/vi/x9tGIkB1_54/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=x9tGIkB1_54&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=24"),
  Searching(
      name:
          "Marketing : MARKET से फंसा हुआ पैसा, वापस कैसे लाएं? | Dr Vivek Bindra |",
      url: "https://i.ytimg.com/vi/_NUhy1b1WYk/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=_NUhy1b1WYk&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=25"),
  Searching(
      name:
          "Marketing :कैसे एक बड़ी Company अपना Product पूरे देश में पहुँचाती है | Dr. Vivek Bindra ",
      url: "https://i.ytimg.com/vi/XUQMWzytYbw/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=XUQMWzytYbw&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=26"),
  Searching(
      name:
          "Marketing :बिना खर्चा किए ADVERTISING MARKETING कैसे करें | CROSS PROMOTION | Dr Vivek Bindra | ",
      url: "https://i.ytimg.com/vi/cutFRx4W260/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=cutFRx4W260&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=27"),
  Searching(
      name:
          "Marketing :How To Grow Your Business Exponentially | Leadership Funnel | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/RlaubIO8WWM/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=RlaubIO8WWM&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=28"),
  Searching(
      name:
          "Marketing : सबसे बड़ा डायमंड कैसे बनें | MLM Sales | Network Marketing | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/UPJt2jTzLoo/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=UPJt2jTzLoo&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=29"),
  Searching(
      name:
          "Marketing : Moment Marketing | Most Powerful Technique Of Guerilla Marketing | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/Hn6KdtOCr-M/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=Hn6KdtOCr-M&list=PLOxBmXq4mdMM_FiPpYDT5Yw0pmzt11wEB&index=30"),
  Searching(
      name:
          "Mind & Emotion Control: वशीकरण | How To Hypnotize | Influencing & Convincing Skills | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/1oR6AoHG9lA/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=1oR6AoHG9lA&list=PLOxBmXq4mdMP6_mPqSty2dys6gYE_Jmia&index=1"),
  Searching(
      name:
          "Mind & Emotion Control: How To Increase Your Will Power | Motivational Video | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/oAawkIU3V1A/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=oAawkIU3V1A&list=PLOxBmXq4mdMP6_mPqSty2dys6gYE_Jmia&index=2"),
  Searching(
      name:
          "Mind & Emotion Control:How to Handle Sex Attachment and Break-Ups in Life (Motivational Video in Hindi) By Mr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/O7J_YP4bb_o/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=O7J_YP4bb_o&list=PLOxBmXq4mdMP6_mPqSty2dys6gYE_Jmia&index=3"),
  Searching(
      name:
          "Case Study: Secret Formula of Sales and Marketing | Consumer Behaviour | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/Jxe8Tgnz2SA/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=Jxe8Tgnz2SA&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=22"),
  Searching(
      name:
          "Case Study:Amazing Case Study On Warren Buffett | Biography of Share Market Legend | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/HdeI82TVQk0/sddefault.jpg",
      link:
          "https://www.youtube.com/watch?v=HdeI82TVQk0&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=23"),
  Searching(
      name:
          "Case Study: अब तक का सबसे बड़ा खुलासा | Education System in India | Case Study by Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/zX65xRqH-S4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=zX65xRqH-S4&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=24"),
  Searching(
      name:
          "Case Study: कैसे बने देश के 8वें सबसे अमीर इंसान | आचार्य बालकृष्ण | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/wvHYHVq9xio/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=wvHYHVq9xio&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=25"),
  Searching(
      name: "How to Present Product Catalog? Snippet 3",
      url: "https://i.ytimg.com/vi/BbXU219OsQs/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=BbXU219OsQs&feature=youtu.be"),
  Searching(
      name: "Make your life free of debt snippet 1",
      url: "https://i.ytimg.com/vi/pBeh5UJQqRc/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=pBeh5UJQqRc&feature=youtu.be"),
  Searching(
      name:
          "How to Manage Multiple Things and Main Things in Business Snippet 2",
      url: "https://i.ytimg.com/vi/ve6bJ4JnvUs/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=ve6bJ4JnvUs&feature=youtu.be"),
  Searching(
      name: "Who Is Dr Vivek Bindra?",
      url: "https://i.ytimg.com/vi/o6UCmAoJi98/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=o6UCmAoJi98&feature=youtu.be"),
  Searching(
      name: "Use these 3 easy tips to increase sales ! Snippets 1",
      url: "https://i.ytimg.com/vi/6OlcZ3m-T2s/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=6OlcZ3m-T2s&feature=youtu.be"),
  Searching(
      name: "How To Increase Sales without Sale Expertise Snippet 1",
      url: "https://i.ytimg.com/vi/TffrkYphxyA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=TffrkYphxyA&feature=youtu.be"),
  Searching(
      name: "How to increase sales in new business Snippet 2",
      url: "https://i.ytimg.com/vi/SxhNwSXsoQc/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=SxhNwSXsoQc&feature=youtu.be"),
  Searching(
      name: "How to Increase Profit Margin and Sells? Snippet 6",
      url: "https://i.ytimg.com/vi/goY1acsU6Dc/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=goY1acsU6Dc&feature=youtu.be"),
  Searching(
      name: "How to Increase Sales Through Online Marketing ? Snippet 4",
      url: "https://i.ytimg.com/vi/_L23Mldk-H4/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=_L23Mldk-H4&feature=youtu.be"),
  Searching(
      name: "How to increase your sales snippet 6",
      url: "https://i.ytimg.com/vi/p8aCleYMALk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=p8aCleYMALk&feature=youtu.be"),
  Searching(
      name: "How to make Permanent to your CUSTOMER ? snippet 5",
      url: "https://i.ytimg.com/vi/b0RDB1VK3NY/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=b0RDB1VK3NY&feature=youtu.be"),
  Searching(
      name: "How to Make Customers Repeatable snippet 3",
      url: "https://i.ytimg.com/vi/etXPvO52zT8/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=etXPvO52zT8&feature=youtu.be"),
  Searching(
      name: "Raise Your Product Sale only in one day Snippet 1",
      url: "https://i.ytimg.com/vi/rIROziVF80M/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=rIROziVF80M&feature=youtu.be"),
  Searching(
      name: "Raise Your Product Sale only in one day Snippet 1",
      url: "https://i.ytimg.com/vi/rIROziVF80M/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=rIROziVF80M&feature=youtu.be"),
  Searching(
      name: "Raise Your Product Sale only in one day Snippet 1",
      url: "https://i.ytimg.com/vi/rIROziVF80M/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=rIROziVF80M&feature=youtu.be"),
  Searching(
      name: "4 ways to sell any products to customers Snippet 1",
      url: "https://i.ytimg.com/vi/H6D6ZvPY3bs/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=H6D6ZvPY3bs&feature=youtu.be"),
  Searching(
      name: "An easy way to increase sales ! snippet 1",
      url: "https://i.ytimg.com/vi/xVc_E1ez508/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=xVc_E1ez508&feature=youtu.be"),
  Searching(
      name: "Sales Problem Snippet 4",
      url: "https://i.ytimg.com/vi/arInS-e0rAg/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=arInS-e0rAg&feature=youtu.be"),
  Searching(
      name: "Do You Know Why Not Selling Your Product Snippet 2",
      url: "https://i.ytimg.com/vi/ZR0YmFpz-pE/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=ZR0YmFpz-pE&feature=youtu.be"),
  Searching(
      name:
          "high sales through low cost marketing guerrilla marketing Snippet 6",
      url: "https://i.ytimg.com/vi/zYD7NZBS3-g/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=zYD7NZBS3-g&feature=youtu.be"),
  Searching(
      name: "How to increase Product Sales Multiples ? Snippet 4",
      url: "https://i.ytimg.com/vi/YvUTJtUHjbk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=YvUTJtUHjbk&feature=youtu.be"),
  Searching(
      name: "Make Your Review Meetings Effective! SNIPPET 1",
      url: "https://i.ytimg.com/vi/23hfHFXSbGk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=23hfHFXSbGk&feature=youtu.be"),
  Searching(
      name:
          "Why is it necessary to understand the Behaviour of the Competitor ? Snippet 2",
      url: "https://i.ytimg.com/vi/gzkfoMqniec/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=gzkfoMqniec&feature=youtu.be"),
  Searching(
      name:
          "Motivational Outbound & Team Building Activities Workshop OBT by Trainer Vivek Bindra in Delhi India",
      url: "https://i.ytimg.com/vi/tWDob1A7EEo/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=tWDob1A7EEo&list=PLOxBmXq4mdMMiJ9iwSCkdii-qzH-OAflA&index=3"),
  Searching(
      name:
          " Best Team Building Outbound OBT Workshop Delhi India Trainers Seminar by Vivek Bindra.",
      url: "https://i.ytimg.com/vi/sR99xnLJyz8/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=sR99xnLJyz8&list=PLOxBmXq4mdMMiJ9iwSCkdii-qzH-OAflA&index=4"),
  Searching(
      name:
          "Motivational Seminar Video On Team Building in Pune Mumbai Vivek Bindra Part 2",
      url: "https://i.ytimg.com/vi/iGHmaFd5zec/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=iGHmaFd5zec&list=PLOxBmXq4mdMMiJ9iwSCkdii-qzH-OAflA&index=5"),
  Searching(
      name:
          "Power of Thoughts - Mind Tips by Vivek Bindra Best Motivational Speaker Delhi NCR India",
      url: "https://i.ytimg.com/vi/6KCZcj7Xk00/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=6KCZcj7Xk00&list=PLOxBmXq4mdMMiJ9iwSCkdii-qzH-OAflA&index=6"),
  Searching(
      name:
          "Team Building Activities and Games for Employees in India Global ACT",
      url: "https://i.ytimg.com/vi/TCDSqBfY6Fk/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=TCDSqBfY6Fk&list=PLOxBmXq4mdMMiJ9iwSCkdii-qzH-OAflA&index=7"),
  Searching(
      name:
          "WOMEN'S DAY पर अब तक का सबसे MOTIVATIONAL VIDEO | DR VIVEK BINDRA |",
      url: "https://i.ytimg.com/vi/vg4s4-648pc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=vg4s4-648pc&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M"),
  Searching(
      name:
          "How To Increase Your Will Power | Motivational Video | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/oAawkIU3V1A/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=oAawkIU3V1A&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=3"),
  Searching(
      name:
          "How To Convert Dreams Into Action Plan | Motivational Video For Students | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/AfDfoQE2iyM/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=AfDfoQE2iyM&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=4"),
  Searching(
      name: "पॉवरफुल मोटिवेशनल वीडियो | Rapid Growth Formula | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/YAwnH96aDuY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=YAwnH96aDuY&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=5"),
  Searching(
      name:
          "रौंगटे खड़े कर देने वाला Motivational Video | Battle of Chamkaur | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/lQlNjjyQmiQ/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=lQlNjjyQmiQ&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=6"),
  Searching(
      name:
          "How to Make Powerful New Year Resolution | Motivational Video in Hindi by Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/IefSimV461A/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=IefSimV461A&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=7"),
  Searching(
      name:
          "Success Habits of Great Leaders | TV v/s YouTube | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/Le5UkRtBahY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=Le5UkRtBahY&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=8"),
  Searching(
      name:
          "Must Watch नए साल का तोहफ़ा | Bhagavad Gita As It Is | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/GrUOn4yl1Lo/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=GrUOn4yl1Lo&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=9"),
  Searching(
      name:
          " अब तक का सबसे मोटिवेशनल वीडियो | Most Inspiring Video | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/aiOwXYRpKnc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=aiOwXYRpKnc&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=10"),
  Searching(
      name:
          "श्रीराम द्वारा Motivational Leadership Lesson | Video by डॉ विवेक बिंद्रा (हिंदी )",
      url: "https://i.ytimg.com/vi/o2GG38a6Q0k/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=o2GG38a6Q0k&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=11"),
  Searching(
      name:
          "कल का रिकॉर्ड आज तोड़ दूंगा, A Motivational Video (Hindi) by Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/kbA18rbp6uI/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=kbA18rbp6uI&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=15"),
  Searching(
      name:
          "How to Change Belief System | Powerful Motivational Video (Hindi) by Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/dCjdd1nkI3I/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=dCjdd1nkI3I&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=16"),
  Searching(
      name:
          "गरीबी से इतिहास रचने तक का सफर (Michael Jordan) Motivational Video by Dr. Vivek Bindra",
      url: "https://i.ytimg.com/vi/PofxohNMza0/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=PofxohNMza0&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=17"),
  Searching(
      name: " How to Bounce Back Motivational Video in Hindi by Vivek Bindra",
      url: "https://i.ytimg.com/vi/lHXU2EfSIhs/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=lHXU2EfSIhs&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=18"),
  Searching(
      name: "Optimist कैसे बनें motivational video in hindi by Vivek Bindra",
      url: "https://i.ytimg.com/vi/wO-qOQ9coZI/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=wO-qOQ9coZI&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=19"),
  Searching(
      name:
          "Extreme Motivational Video In Hindi on Major Dhyan Chand By Vivek Bindra",
      url: "https://i.ytimg.com/vi/fXZUyjLyTxA/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=fXZUyjLyTxA&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=20"),
  Searching(
      name:
          "Best of Vivek Bindra I इतिहास रटना नहीं है, इतिहास रचना है Motivational Speaker in Hindi India",
      url: "https://i.ytimg.com/vi/aRAPhG6ah-4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=aRAPhG6ah-4&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=21"),
  Searching(
      name:
          "Busyness Vs Business A Motivational Video in Hindi by Vivek Bindra",
      url: "https://i.ytimg.com/vi/9ZxY5-nkodE/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=9ZxY5-nkodE&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=22"),
  Searching(
      name:
          "Extreme Motivation on Belief System, Change Your Life in 2 Mins with Mr Vivek Bindra (Hindi)",
      url: "https://i.ytimg.com/vi/WgeJtkmYRBs/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=WgeJtkmYRBs&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=23"),
  Searching(
      name:
          "अगर Billion Dollar  Business चाहते हो तो देखें.. A Motivational Video in Hindi by Vivek Bindra",
      url: "https://i.ytimg.com/vi/WyCVj-iIKag/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=WyCVj-iIKag&list=PLOxBmXq4mdMPoQucD1Nqn7ap5KGqqAJ0M&index=24"),
  Searching(
      name:
          "Mind & Emotion Control: Art Of Mind Control, Mind Management & Mind Power Secret In Hindi by Vivek Bindra",
      url: "https://i.ytimg.com/vi/8b-En3k1qmg/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=8b-En3k1qmg&list=PLOxBmXq4mdMP6_mPqSty2dys6gYE_Jmia&index=4"),
  Searching(
      name:
          "Mind & Emotion Control:3 Tips How To Handle Negative Emotions, Emotional Intelligence in Hindi by Vivek Bindra ",
      url: "https://i.ytimg.com/vi/lKUto_kkUmE/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=lKUto_kkUmE&list=PLOxBmXq4mdMP6_mPqSty2dys6gYE_Jmia&index=5"),
  Searching(
      name:
          "Mind & Emotion Control:Stress Management Strategies Motivational Video in Hindi by Vivek Bindra ",
      url: "https://i.ytimg.com/vi/B7T5rITvMJY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=B7T5rITvMJY&list=PLOxBmXq4mdMP6_mPqSty2dys6gYE_Jmia&index=6"),
  Searching(
      name:
          "Mind & Emotion Control: How To Grow Your Business Exponentially | Leadership Funnel | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/RlaubIO8WWM/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=RlaubIO8WWM&list=PLOxBmXq4mdMP6_mPqSty2dys6gYE_Jmia&index=7"),
  Searching(
      name:
          "Case Study: DUBAI के पास इतना पैसा कहाँ से आया | महा मोटिवेशन | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/SxITOCRLIdQ/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=SxITOCRLIdQ&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI"),
  Searching(
      name:
          "Case Study: महाराणा प्रताप का वो सच जो आपसे छुपाया गया | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/3CTrU8-12a0/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=3CTrU8-12a0&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=2"),
  Searching(
      name:
          "Case Study: पानी पीने तक का नहीं था अधिकार | DR. B.R. AMBEDKAR | CASE STUDY | DR VIVEK BINDRA",
      url: "https://i.ytimg.com/vi/zI_87kiecsY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=zI_87kiecsY&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=3"),
  Searching(
      name:
          "Case Study: खून खौल उठेगा | शहीद-ए-आज़म Bhagat Singh| Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/h6NF4EnBzdo/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=h6NF4EnBzdo&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=4"),
  Searching(
      name:
          "Case Study: INDIA Vs CHINA | Business Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/F_nBES1lIyY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=F_nBES1lIyY&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=5"),
  Searching(
      name:
          "Case Study:आंसू रोक नहीं पाओगे | Chattrapati Sambhaji Maharaj | Case Study | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/i_AvRBoaAEA/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=i_AvRBoaAEA&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=6"),
  Searching(
      name: "How to make small business bigger in less time Snippet 1",
      url: "https://i.ytimg.com/vi/zZdjUfHkKys/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=zZdjUfHkKys&feature=youtu.be"),
  Searching(
      name: "Learn all the qualities of a good distributor Snippet 2",
      url: "https://i.ytimg.com/vi/nkSAdScu2LU/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=nkSAdScu2LU&feature=youtu.be"),
  Searching(
      name: "How to spread business all over the country Snippet 1",
      url: "https://i.ytimg.com/vi/4G8syVWtG1Q/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=4G8syVWtG1Q&feature=youtu.be"),
  Searching(
      name:
          "How To Give Incentives To Distributor To Increase Business Snippet 6",
      url: "https://i.ytimg.com/vi/EaEA85hqtQk/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=EaEA85hqtQk&feature=youtu.be"),
  Searching(
      name: "How to improve product and staff of an outlet?",
      url: "https://i.ytimg.com/vi/-wkqmHkNx-M/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=-wkqmHkNx-M&feature=youtu.be"),
  Searching(
      name: "How to maintain the quality of a outlet?",
      url: "https://i.ytimg.com/vi/UY2xib1cgpU/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=UY2xib1cgpU&feature=youtu.be"),
  Searching(
      name: "Use these methods to bring J-Curve in business!",
      url: "https://i.ytimg.com/vi/bXbNiOAbzLY/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=bXbNiOAbzLY&feature=youtu.be"),
  Searching(
      name: "How does Quick Service and Full Service Restaurant work?",
      url: "https://i.ytimg.com/vi/2jL4e2Al_bA/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=2jL4e2Al_bA&feature=youtu.be"),
  Searching(
      name: "Keep these things in mind when you start Restaurant!",
      url: "https://i.ytimg.com/vi/OULOcV_IqVg/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=OULOcV_IqVg&feature=youtu.be"),
  Searching(
      name: "The importance of DIGITALIZATION in Outlet!",
      url: "https://i.ytimg.com/vi/hdpOPEc8_5A/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=hdpOPEc8_5A&feature=youtu.be"),
  Searching(
      name: "Increase business by using Franchisee models!",
      url: "https://i.ytimg.com/vi/l-WyXeCvnzo/maxresdefault.jpg",
      link: "The importance of DIGITALIZATION in Outlet!"),
  Searching(
      name: "Ideas to bring innovation in business!",
      url: "https://i.ytimg.com/vi/n2WrZJJ7Wio/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=n2WrZJJ7Wio&feature=youtu.be"),
  Searching(
      name:
          "Case Study:How & Why NOKIA Failed | Case Study | Dr Vivek Bindra | Part -1 ",
      url: "https://i.ytimg.com/vi/e-Cpg_KR_z4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=e-Cpg_KR_z4&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=7"),
  Searching(
      name:
          "Case Study:अकबर शैतान था या महान था ? | Case Study | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/WBRPip9qNHw/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=WBRPip9qNHw&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=8"),
  Searching(
      name:
          "Case Study: Elon Musk | सदी का सबसे क्रांतिकारी आदमी | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/5CFZZHF-zjA/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=5CFZZHF-zjA&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=9"),
  Searching(
      name:
          "Case Study: Unheard Stories Of Sir Ratan Tata | Biography | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/zDhF8OMwsTY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=zDhF8OMwsTY&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=10"),
  Searching(
      name:
          "Case Study:Jeff Bezos | How He Became World's Richest Person | Case Study | Dr Vivek Bindra ",
      url: "https://i.ytimg.com/vi/fFUjFjisQrM/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=fFUjFjisQrM&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=11"),
  Searching(
      name:
          "Case Study: छोटा दुकानदार Business कैसे बड़ा करे | 1 ब्रांच' से 100 ब्रांच का Formula | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/72BDLwHZeEs/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=72BDLwHZeEs&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=12"),
  Searching(
      name: "Powerful tips for Make your company successful Snippets-1",
      url: "https://i.ytimg.com/vi/48_eolT6q6A/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=48_eolT6q6A&feature=youtu.be"),
  Searching(
      name: "How to do Implementation in business ? Snippet 2",
      url: "https://i.ytimg.com/vi/KG7YQUYpWHg/maxresdefault.jpg",
      link: "https://www.youtube.com/watch?v=KG7YQUYpWHg&feature=youtu.be"),
  Searching(
      name:
          "Case Study:WOMEN'S DAY पर अब तक का सबसे MOTIVATIONAL VIDEO | DR VIVEK BINDRA |",
      url: "https://i.ytimg.com/vi/vg4s4-648pc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=vg4s4-648pc&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=26"),
  Searching(
      name:
          "Case Study:Indian Medical System की असलियत | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/FSINB0Uiy2o/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=FSINB0Uiy2o&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=27"),
  Searching(
      name:
          "Case Study:PSP Formula | Business Training Video In Hindi | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/eP-jkoUxTG4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=eP-jkoUxTG4&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=28"),
  Searching(
      name:
          "Case Study:YouTube सफल कैसे बना ? | YouTube Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/ujnAgr7f6A0/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=ujnAgr7f6A0&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=29"),
  Searching(
      name:
          "Case Study: Patanjali Vs Baidyanath | Motivational Case Study in Hindi | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/E2TUQLxalMw/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=E2TUQLxalMw&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=30"),
  Searching(
      name:
          "Case Study:कैसे AMUL बना 36 लाख किसानो का मसीहा | CASE STUDY | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/vqkciGKC7Lo/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=vqkciGKC7Lo&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=31"),
  Searching(
      name:
          "Case Study:बिना खर्चा किये Brand Viral कैसे करें | Must Watch 5 Tips By Dr Vivek Bindra |",
      url: "https://i.ytimg.com/vi/gTp4BRg15g0/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=gTp4BRg15g0&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=32s"),
  Searching(
      name:
          "Case Study: HOW TO CONTROL YOUR MIND & EMOTIONS | Motivational Video | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/accOMtn8Od4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=accOMtn8Od4&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=33"),
  Searching(
      name:
          "Case Study:कम लागत में करोड़ो कैसे कमाएं ? | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/JKD_V4e22Mc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=JKD_V4e22Mc&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=34"),
  Searching(
      name:
          "Case Study:How To Convert Dreams Into Action Plan | Motivational Video For Students | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/AfDfoQE2iyM/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=AfDfoQE2iyM&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=35"),
  Searching(
      name:
          "Case Study:TCS Vs Infosys | Business Case Study in Hindi | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/YPL-E_cDjuo/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=YPL-E_cDjuo&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=36"),
  Searching(
      name:
          "Case Study:How To Increase Your Will Power | Motivational Video | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/oAawkIU3V1A/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=oAawkIU3V1A&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=37"),
  Searching(
      name:
          "Case Study:लिज्जत पापड़ | Amazing Case Study | 1600 Crore Turnover | By Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/PCDqFafx9o4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=PCDqFafx9o4&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=38"),
  Searching(
      name:
          "Case Study:3 Steps To Quick Success I स्टूडेंट्स यह वीडियो ज़रूर देखें I Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/XRZp78VhNpY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=XRZp78VhNpY&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=39"),
  Searching(
      name: "Case Study:Case Study On Apple | BCG Matrix | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/w9CdIKYyxBM/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=w9CdIKYyxBM&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=40"),
  Searching(
      name:
          "Case Study:आसानी से मिलेगी सरकारी नौकरी | घोटाला ! | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/munj48bcnLI/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=munj48bcnLI&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=41"),
  Searching(
      name:
          "Case Study:कैसे बना दुनिया का सबसे बड़ा FAST FOOD CHAIN McDonald's' | COMPLETE CASE STUDY | DR VIVEK BINDRA",
      url: "https://i.ytimg.com/vi/bnI5UVVxCpU/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=bnI5UVVxCpU&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=42"),
  Searching(
      name:
          "Case Study:Branding | Marketing | Positioning | Consumer Behaviour Part 2 | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/iWuYUhSHXHg/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=iWuYUhSHXHg&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=43"),
  Searching(
      name: "Case Study:Red Bus | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/VvH07fUL9dg/maxresdefault.jpg",
      link: "https://i.ytimg.com/vi/VvH07fUL9dg/maxresdefault.jpg"),
  Searching(
      name:
          "Case Study:कैसे Demonetization ने बनाया अरबपति ? | Paytm Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/-x6KnPi6yHQ/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=-x6KnPi6yHQ&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=45"),
  Searching(
      name:
          "Case Study:Quick Service Restaurant vs Full Service Restaurant | Business Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/cA5Xl-U74Ug/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=cA5Xl-U74Ug&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=46"),
  Searching(
      name:
          "Case Study:कैसे बनाई Chef Sanjeev Kapoor ने 10000000000 की कंपनी ? I Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/HdccMD1D9dM/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=HdccMD1D9dM&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=47"),
  Searching(
      name:
          "Case Study:How to Expand Your Business | Step by Step Formula | Dr. vivek Bindra | Hindi",
      url: "https://i.ytimg.com/vi/rv7qwY2cKuA/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=rv7qwY2cKuA&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=48"),
  Searching(
      name:
          "Case Study:कितनी बड़ी है E-Commerce Industry | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/cCyMxss5me0/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=cCyMxss5me0&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=49"),
  Searching(
      name:
          "Case Study:चौंकाने वाला सच | Kodak हुआ Bankrupt | Video in Hindi | By Dr. Vivek Bindra",
      url: "https://i.ytimg.com/vi/cgOmaaiCIis/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=cgOmaaiCIis&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=50"),
  Searching(
      name: "Case Study:Dabbawala | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/auDmAKDy418/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=auDmAKDy418&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=51"),
  Searching(
      name:
          "Case Study:कैसे एक बड़ी Company अपना Product पूरे देश में पहुँचाती है | Dr. Vivek Bindra",
      url: "https://i.ytimg.com/vi/XUQMWzytYbw/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=XUQMWzytYbw&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=52"),
  Searching(
      name:
          "Case Study:Case Study on Vision Mission | Strategy | Dr Vivek Bindra | Hindi",
      url: "https://i.ytimg.com/vi/EJ7cErowVbo/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=EJ7cErowVbo&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=53"),
  Searching(
      name:
          "Case Study:बिना खर्चा किए ADVERTISING MARKETING कैसे करें | CROSS PROMOTION | Dr Vivek Bindra |",
      url: "https://i.ytimg.com/vi/cutFRx4W260/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=cutFRx4W260&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=54"),
  Searching(
      name:
          "Case Study:Tata Nano Fail क्यों हो गई? | Business Skills Video in Hindi",
      url: "https://i.ytimg.com/vi/QDPcFit_WNQ/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=QDPcFit_WNQ&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=55"),
  Searching(
      name:
          "Case Study:अगर अपनी SALES 10 गुणा बढ़ाना चाहते हैं तो यह वीडियो जरूर देखें | DR VIVEK BINDRA ",
      url: "https://i.ytimg.com/vi/x9tGIkB1_54/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=x9tGIkB1_54&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=56"),
  Searching(
      name:
          "Case Study:How World’s Largest Vaccine Company Was Created | Adar Poonawalla | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/d_0tjOCSkuo/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=d_0tjOCSkuo&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=57"),
  Searching(
      name:
          "Case Study:10 Tips You Must Know To Win a TENDER | DR VIVEK BINDRA |",
      url: "https://i.ytimg.com/vi/Ff2KCEIck1Q/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=Ff2KCEIck1Q&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=58"),
  Searching(
      name:
          "Case Study:MARKET से फंसा हुआ पैसा, वापस कैसे लाएं? | Dr Vivek Bindra |",
      url: " ",
      link: "https://i.ytimg.com/vi/_NUhy1b1WYk/maxresdefault.jpg"),
  Searching(
      name:
          "Case Study:6 Tips on How to Grow Your Business for Entrepreneurs & StartUps by Vivek Bindra",
      url: "https://i.ytimg.com/vi/uuHAwco5c8o/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=uuHAwco5c8o&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=61"),
  Searching(
      name:
          "Case Study:क्यों बर्बाद हुआ Kodak? | Business Training Video by Dr.Vivek Bindra ( Hindi ) Part 2",
      url: "https://i.ytimg.com/vi/sURCNaaBeW0/sddefault.jpg",
      link:
          "https://www.youtube.com/watch?v=sURCNaaBeW0&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=62"),
  Searching(
      name:
          "Case Study:6 Point Formula To Avoid Franchisee Failure | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/xgaKtK9n73g/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=xgaKtK9n73g&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=63"),
  Searching(
      name:
          "Case Study:Adoption Curve | Business Success Formula for Entrepreneurs | Case Study | Dr. Vivek Bindra",
      url: "https://i.ytimg.com/vi/cXnhfNNLIUQ/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=cXnhfNNLIUQ&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=64"),
  Searching(
      name:
          "Case Study:अपना PRODUCTIVITY PLANNER कैसे बनाएं | Dr Vivek Bindra |",
      url: "https://i.ytimg.com/vi/ZnWxhT-MEjc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=ZnWxhT-MEjc&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=65"),
  Searching(
      name:
          "Successful Case Study of 6 Months Training by Global ACT Best Corporate Training Company in India",
      url: "https://i.ytimg.com/vi/D__fuxxvjlc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=D__fuxxvjlc&list=PLOxBmXq4mdMOd3RQ3bAWxz8siZ4pnOtjI&index=66"),
  Searching(
      name:
          "अगर विदेश जाना चाहते हैं तो यह Video जरूर देखें | IMMIGRATION | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/KVyy_2psoOM/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=KVyy_2psoOM&list=PLOxBmXq4mdMPhTOGdTOw-y18RO67bY4Nm&index=1"),
  Searching(
      name:
          "आंसू रोक नहीं पाओगे | Chattrapati Sambhaji Maharaj | Case Study | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/i_AvRBoaAEA/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=i_AvRBoaAEA&list=PLOxBmXq4mdMPhTOGdTOw-y18RO67bY4Nm&index=2"),
  Searching(
      name:
          "Students यह वीडियो ज़रूर देखें | Motivational Video for Students by Dr. Vivek Bindra",
      url: "https://i.ytimg.com/vi/kASX39gT3Ks/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=kASX39gT3Ks&list=PLOxBmXq4mdMM8kLMhePaMfpA6q0NJelsG&index=1"),
  Searching(
      name:
          "Good News For Students | My Next Seminar in IG Stadium Delhi | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/K3FW5g35yuo/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=K3FW5g35yuo&list=PLOxBmXq4mdMM8kLMhePaMfpA6q0NJelsG&index=2"),
  Searching(
      name:
          "Sandeep Maheshwari | Dr Vivek Bindra | Student Leadership Conclave @ IG Stadium",
      url: "https://i.ytimg.com/vi/2jU5ceu8vsY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=2jU5ceu8vsY&list=PLOxBmXq4mdMM8kLMhePaMfpA6q0NJelsG&index=3"),
  Searching(
      name:
          "4 Steps to Build Your Career | Student Leadership Conclave | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/vWr0CabwgFM/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=vWr0CabwgFM&list=PLOxBmXq4mdMM8kLMhePaMfpA6q0NJelsG&index=4"),
  Searching(
      name:
          "3 Steps To Quick Success I स्टूडेंट्स यह वीडियो ज़रूर देखें I Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/XRZp78VhNpY/maxresdefault.jpg ",
      link:
          "https://www.youtube.com/watch?v=XRZp78VhNpY&list=PLOxBmXq4mdMM8kLMhePaMfpA6q0NJelsG&index=5"),
  Searching(
      name:
          "How to Find Your Passion । Passion को Profession कैसे बनाएँ | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/THkCSwnTaME/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=THkCSwnTaME&list=PLOxBmXq4mdMM8kLMhePaMfpA6q0NJelsG&index=8"),
  Searching(
      name:
          "अब तक का सबसे बड़ा खुलासा | Education System in India | Case Study by Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/zX65xRqH-S4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=zX65xRqH-S4&list=PLOxBmXq4mdMM8kLMhePaMfpA6q0NJelsG&index=9"),
  Searching(
      name:
          "Goal Setting for Students : A High Power Motivational Video for Students",
      url: "https://i.ytimg.com/vi/8ynjcWAGBAk/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=8ynjcWAGBAk&list=PLOxBmXq4mdMM8kLMhePaMfpA6q0NJelsG&index=10"),
  Searching(
      name:
          "Five levels of Leadership by International Motivational Speaker Mr Vivek Bindra",
      url: "https://i.ytimg.com/vi/3xduc6otOzk/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=3xduc6otOzk&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV"),
  Searching(
      name:
          "Leadership in Pipeline for Entrepreneurs & Top Management Skill Will Matrix by Vivek Bindra",
      url: "https://i.ytimg.com/vi/F4N3Tb4pIj4/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=F4N3Tb4pIj4&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=2"),
  Searching(
      name:
          "Learn Coaching Mentoring & Counselling by Mr Vivek Bindra Best Corporate Leadership Trainer in India",
      url: "https://i.ytimg.com/vi/GLCqg8etTWI/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=GLCqg8etTWI&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=3"),
  Searching(
      name: "10 Tips to Manage Performance & Maximize Results by Vivek Bindra",
      url: "https://i.ytimg.com/vi/IZIHW9K8DMc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=IZIHW9K8DMc&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=4"),
  Searching(
      name: "Part 2 Secret Of Leadership Success by Vivek Bindra in India.",
      url: "https://i.ytimg.com/vi/KFpWpLVi_v0/sddefault.jpg",
      link:
          "https://www.youtube.com/watch?v=KFpWpLVi_v0&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=5"),
  Searching(
      name:
          "Part 4 How to Handle Complaint & Criticism by Best Motivational Speaker Mr Vivek Bindra",
      url: "https://i.ytimg.com/vi/yU0oOnBTcPg/sddefault.jpg",
      link: "https://i.ytimg.com/vi/yU0oOnBTcPg/sddefault.jpg"),
  Searching(
      name:
          "Part 5 Proactive Leadership Respond Vs React by Best Motivational Speaker in India.",
      url: "https://i.ytimg.com/vi/CK5YXI-_dp8/sddefault.jpg",
      link: "https://i.ytimg.com/vi/CK5YXI-_dp8/sddefault.jpg"),
  Searching(
      name:
          "Leadership Funnel By Vivek Bindra (Best Leadership Trainer In India & Asia",
      url: "https://i.ytimg.com/vi/wMZX9IMn9e4/sddefault.jpg",
      link:
          "https://www.youtube.com/watch?v=wMZX9IMn9e4&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=8"),
  Searching(
      name:
          "Success Mantra of Great Leaders, Motivational Story in Hindi Video by Vivek Bindra",
      url: "https://i.ytimg.com/vi/fkxABk-pzBc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=fkxABk-pzBc&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=9"),
  Searching(
      name:
          "Corporate Success & Bhagavad Gita Lessons for Leaders and Managers by Vivek Bindra Part 2",
      url: "https://i.ytimg.com/vi/HfHejHZ14NY/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=HfHejHZ14NY&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=10"),
  Searching(
      name:
          "Business Success with Bhagavad Gita. Motivation on Leadership & Management for Corporate",
      url: "https://i.ytimg.com/vi/rOA6H4n-tXs/maxresdefault.jpg",
      link:
          "Business Success with Bhagavad Gita. Motivation on Leadership & Management for Corporate"),
  Searching(
      name:
          "Management and Life Lesson from Lord Hanuman (hindi ) हिन्दी मोटिवेशनल विडियो - विवेक बिंद्रा",
      url: "https://i.ytimg.com/vi/xDfvv7qfpu0/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=xDfvv7qfpu0&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=12"),
  Searching(
      name:
          "Can You become a CEO, Leadership Video, Best Inspirational Speaker in India Vivek Bindra",
      url: "https://i.ytimg.com/vi/TR-4l86AYhU/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=TR-4l86AYhU&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=13"),
  Searching(
      name:
          "Motivational Trainer Leadership Seminar Inspirational Speaker in Hindi & English in Mumbai Pune",
      url: "https://i.ytimg.com/vi/qHwr37L0BMc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=qHwr37L0BMc&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=14"),
  Searching(
      name: "How to Convince People Convincing Skills in Hindi by Vivek Bindra",
      url: "https://i.ytimg.com/vi/KSYDCisqJQM/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=KSYDCisqJQM&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=15"),
  Searching(
      name:
          "Leadership Video Inspirational, Leadership Skills Qualities of a Great leader In English India",
      url: "https://i.ytimg.com/vi/AF2edLjQcaU/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=AF2edLjQcaU&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=16"),
  Searching(
      name: "सफ़लता के 3 सूत्र Motivational Video in Hindi by Mr Vivek Bindra",
      url: "https://i.ytimg.com/vi/Up19XYwIQlU/maxresdefault.jpgs",
      link:
          "https://www.youtube.com/watch?v=Up19XYwIQlU&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=17"),
  Searching(
      name:
          "Corporate Trainer on Leadership Skills from Bhagavad Gita in Ahmadabad Mumbai Pune India",
      url: "https://i.ytimg.com/vi/c6ScH1XWl0c/sddefault.jpg",
      link:
          "https://www.youtube.com/watch?v=c6ScH1XWl0c&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=18"),
  Searching(
      name:
          "Motivational Speaker Corporate Leadership Trainer Soft Skills in Delhi Mumbai India & Asia",
      url: "https://i.ytimg.com/vi/Q4v1vz7bYyU/sddefault.jpg",
      link:
          "https://www.youtube.com/watch?v=Q4v1vz7bYyU&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=19"),
  Searching(
      name: "10 Tips to Manage Performance & Maximize Results by Vivek Bindra",
      url: "https://i.ytimg.com/vi/IZIHW9K8DMc/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=IZIHW9K8DMc&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=20"),
  Searching(
      name:
          " How to Measure Customer Satisfaction by Mr Vivek Bindra Best Motivational Speaker",
      url: "https://i.ytimg.com/vi/tUdJOLoXBOg/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=tUdJOLoXBOg&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=21"),
  Searching(
      name: "Part 2 Secret Of Leadership Success by Vivek Bindra in India.",
      url: "https://i.ytimg.com/vi/KFpWpLVi_v0/sddefault.jpg",
      link:
          "https://www.youtube.com/watch?v=KFpWpLVi_v0&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=22"),
  Searching(
      name:
          "Leadership Skills - Corporate Training, Best Trainer Hindi English Delhi Gurgaon India Vivek Bindra",
      url: "https://i.ytimg.com/vi/sVtGk2yCQQs/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=sVtGk2yCQQs&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=23"),
  Searching(
      name:
          "Relationship Management Video Team Building Best Training Hindi English Delhi NCR India.",
      url: "https://i.ytimg.com/vi/pNA9t1ef5aE/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=pNA9t1ef5aE&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=24"),
  Searching(
      name: "अब बिज़नेस बड़ा करना आसान है | Dr Vivek Bindra",
      url: "https://i.ytimg.com/vi/SKRQ4xAQ6VM/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=SKRQ4xAQ6VM&list=PLOxBmXq4mdMMPhAp3yFbTHpmt_YtqSgoV&index=25"),
  Searching(
      name:
          "Relationship Management Video Team Building Best Training Hindi English Delhi NCR India",
      url: "https://i.ytimg.com/vi/pNA9t1ef5aE/maxresdefault.jpg",
      link:
          "https://www.youtube.com/watch?v=pNA9t1ef5aE&list=PLOxBmXq4mdMMiJ9iwSCkdii-qzH-OAflA"),
];
