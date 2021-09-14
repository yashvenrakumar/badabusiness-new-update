import 'package:badabusiness/screen/search/searchbutton.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class Arti extends StatefulWidget {
  @override
  _ArtiState createState() => _ArtiState();
}

class _ArtiState extends State<Arti> {
  @override
  Widget build(BuildContext context) {
    return aList.length == 0
        ? CircularProgressIndicator()
        : Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                primary: true,
                slivers: <Widget>[
                  searchbuttion(context),
                  // SliverAppBar(
                  //     floating: true,
                  //     pinned: true,
                  //     actions: [
                  //       Expanded(
                  //         flex: 1,
                  //         child: Container(
                  //           margin: EdgeInsets.only(
                  //               left: 110, right: 110, top: 15, bottom: 5),
                  //           child: Image.asset(
                  //             "assets/images/logo.png",
                  //             fit: BoxFit.fitWidth,
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //     backgroundColor: Colors.blue[50],
                  //     iconTheme: IconThemeData(color: Colors.yellow),
                  //     expandedHeight: 100,
                  //     centerTitle: true,
                  //     flexibleSpace: FlexibleSpaceBar(
                  //       title: Text(
                  //         ' ',
                  //         style: TextStyle(
                  //           fontSize: 18,
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       centerTitle: true,
                  //       background: Row(
                  //         children: [
                  //           Expanded(
                  //             child: Image.asset(
                  //               "assets/images/i9.png",
                  //               fit: BoxFit.contain,
                  //             ),
                  //           ),
                  //           Expanded(
                  //             child: Image.asset(
                  //               "assets/images/i3.png",
                  //               fit: BoxFit.contain,
                  //             ),
                  //           ),
                  //           Expanded(
                  //             child: Image.asset(
                  //               "assets/images/i1.png",
                  //               fit: BoxFit.contain,
                  //             ),
                  //           ),
                  //           Expanded(
                  //             child: Image.asset(
                  //               "assets/images/i19.png",
                  //               fit: BoxFit.contain,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     )),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          height: 700,
                          child: aList.length == 0
                              ? CircularProgressIndicator()
                              : ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: aList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        article(aList[index].link);
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
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    margin: EdgeInsets.only(
                                                        left: 20, right: 20),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: aList[index]
                                                              .url
                                                              .isEmpty
                                                          ? CircularProgressIndicator()
                                                          : FadeInImage(
                                                              image:
                                                                  new NetworkImage(
                                                                      aList[index]
                                                                          .url),
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
                                                    aList[index].name,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400),
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

class Article {
  final String name;
  final String url;
  final String link;

  Article({required this.name, required this.url, required this.link});
}

List<Article> aList = [
  Article(
      name:
          "7 सबसे शक्तिशाली महिलाओं द्वारा प्रेरित उद्धरण जो महिला उद्यमियों के आत्मविश्वास को बढ़ाएगा",
      url: "https://miro.medium.com/max/4500/1*7iN8UzFiyN178hMtrJsGeg.png",
      link:
          "https://yashvendrajnv95.medium.com/7-%E0%A4%B8%E0%A4%AC%E0%A4%B8%E0%A5%87-%E0%A4%B6%E0%A4%95%E0%A5%8D%E0%A4%A4%E0%A4%BF%E0%A4%B6%E0%A4%BE%E0%A4%B2%E0%A5%80-%E0%A4%AE%E0%A4%B9%E0%A4%BF%E0%A4%B2%E0%A4%BE%E0%A4%93%E0%A4%82-%E0%A4%A6%E0%A5%8D%E0%A4%B5%E0%A4%BE%E0%A4%B0%E0%A4%BE-%E0%A4%AA%E0%A5%8D%E0%A4%B0%E0%A5%87%E0%A4%B0%E0%A4%BF%E0%A4%A4-%E0%A4%89%E0%A4%A6%E0%A5%8D%E0%A4%A7%E0%A4%B0%E0%A4%A3-%E0%A4%9C%E0%A5%8B-%E0%A4%AE%E0%A4%B9%E0%A4%BF%E0%A4%B2%E0%A4%BE-%E0%A4%89%E0%A4%A6%E0%A5%8D%E0%A4%AF%E0%A4%AE%E0%A4%BF%E0%A4%AF%E0%A5%8B%E0%A4%82-%E0%A4%95%E0%A5%87-%E0%A4%86%E0%A4%A4%E0%A5%8D%E0%A4%AE%E0%A4%B5%E0%A4%BF%E0%A4%B6%E0%A5%8D%E0%A4%B5%E0%A4%BE%E0%A4%B8-%E0%A4%95%E0%A5%8B-%E0%A4%AC%E0%A4%A2%E0%A4%BC%E0%A4%BE%E0%A4%8F%E0%A4%97%E0%A4%BE-8fa6016d1209"),
  Article(
      name: "जीवन में सफल कैसे बनें?",
      url: "https://miro.medium.com/max/4500/1*ewb8XZ3-r_E8zWRKoWtREw.png",
      link:
          "https://yashvendrajnv95.medium.com/%E0%A4%9C%E0%A5%80%E0%A4%B5%E0%A4%A8-%E0%A4%AE%E0%A5%87%E0%A4%82-%E0%A4%B8%E0%A4%AB%E0%A4%B2-%E0%A4%95%E0%A5%88%E0%A4%B8%E0%A5%87-%E0%A4%AC%E0%A4%A8%E0%A5%87%E0%A4%82-599c4c92d175"),
  Article(
      name: "जीवन में कठिन परिस्थितियों को कैसे संभालना है",
      url: "https://miro.medium.com/max/5040/1*xF2-KMtern83FcY4nYFwtg.jpeg",
      link:
          "https://yashvendrajnv95.medium.com/%E0%A4%9C%E0%A5%80%E0%A4%B5%E0%A4%A8-%E0%A4%AE%E0%A5%87%E0%A4%82-%E0%A4%95%E0%A4%A0%E0%A4%BF%E0%A4%A8-%E0%A4%AA%E0%A4%B0%E0%A4%BF%E0%A4%B8%E0%A5%8D%E0%A4%A5%E0%A4%BF%E0%A4%A4%E0%A4%BF%E0%A4%AF%E0%A5%8B%E0%A4%82-%E0%A4%95%E0%A5%8B-%E0%A4%95%E0%A5%88%E0%A4%B8%E0%A5%87-%E0%A4%B8%E0%A4%82%E0%A4%AD%E0%A4%BE%E0%A4%B2%E0%A4%A8%E0%A4%BE-%E0%A4%B9%E0%A5%88-1e401b6b8451"),
  Article(
      name: "Bada Business an Initiative By Dr Vivek Bindra",
      url: "https://miro.medium.com/max/2880/1*zaxbm_XVKS6Ic9Eu47oZmQ.gif",
      link:
          "https://yashvendrajnv95.medium.com/bada-business-an-initiative-by-dr-vivek-bindra-34f9d85f6c7c"),
  Article(
      name: "5 Ways To Protect Your Business From Cybercrime",
      url: "https://miro.medium.com/max/4516/1*RqWd3ooNMdOfcu2JRg1JcA.png",
      link:
          "https://yashvendrajnv95.medium.com/5-ways-to-protect-your-business-from-cybercrime-1fa39fac2b7"),
  Article(
      name: "5 Strategies to build world-class customer experience",
      url: "https://miro.medium.com/max/4500/1*yCd_xThw-FMH6BF8NmU9rQ.jpeg",
      link:
          "https://yashvendrajnv95.medium.com/5-strategies-to-build-world-class-customer-experience-c79517b51484"),
  Article(
      name: "11 strategies to increase Employee Productivity",
      url: "https://miro.medium.com/max/5040/1*kWG9SFz6-8Ph6tSwCgdZ5g.jpeg",
      link:
          "https://yashvendrajnv95.medium.com/11-strategies-to-increase-employee-productivity-5a5a3f2ac028"),
  Article(
      name: "5 Ideas to Rebuild Small Businesses Amid COVID-19 Pandemic",
      url: "https://miro.medium.com/max/4496/1*kUlN8xXQdItlQA0GZOlYjg.png",
      link:
          "https://yashvendrajnv95.medium.com/5-ideas-to-rebuild-small-businesses-amid-covid-19-pandemic-cbddcfb2c81a"),
  Article(
      name: "How to Grow your Business from 1 Store to 100 Stores",
      url: "https://miro.medium.com/max/4500/1*7_NH2jJwdzPaXw__l8t9gQ.png",
      link:
          "https://yashvendrajnv95.medium.com/how-to-grow-your-business-from-1-store-to-100-stores-e545e49d6e37"),
  Article(
      name:
          "7 Online Business Ideas : How to Start an Online Business Instantly",
      url: "https://miro.medium.com/max/4500/1*w7C3FttjyYGvun65y3ZV-A.png",
      link:
          "https://yashvendrajnv95.medium.com/7-online-business-ideas-how-to-start-an-online-business-instantly-e0bdab0f3b0a"),
  Article(
      name: "How to Create a Successful Subscription Business Model",
      url: "https://miro.medium.com/max/4500/1*H6XhQPf9F02G5vBFOrT6Cw.png",
      link:
          "https://yashvendrajnv95.medium.com/how-to-create-a-successful-subscription-business-model-989dad917050"),
  Article(
      name: "5 Business Automation Tools to Grow Your Business",
      url: "https://miro.medium.com/max/4500/1*KEKDTdUQDtNJJK7tE8ai3Q.png",
      link:
          "https://yashvendrajnv95.medium.com/5-business-automation-tools-to-grow-your-business-312ad7573e3f"),
  Article(
      name: "5 Fastest Growing Industries to Start a Business In 2020",
      url: "https://miro.medium.com/max/4500/1*riFPGsRBGPXr_5Xdli6-BA.jpeg",
      link:
          "https://yashvendrajnv95.medium.com/yashvendrdar-5-fastest-growing-industries-to-start-a-business-in-2020-170aad4f0e42"),
  Article(
      name: "5 Business Strategies That Can Run Business Without You",
      url: "https://miro.medium.com/max/5040/1*KTDp5cf3ZsLHPGYDzq3GQQ.png",
      link:
          "https://yashvendrajnv95.medium.com/5-business-strategies-that-can-run-business-without-you-58f0b7d1ea11"),
  Article(
      name: "How to Make Your Startup Into a Large Business",
      url: "https://miro.medium.com/max/4500/1*2RQikWo48MElPXKAvuR17A.png",
      link:
          "https://yashvendrajnv95.medium.com/how-to-make-your-startup-into-a-large-business-6ae8be68858c"),
  Article(
      name: "5 Tips for an Early Stage Fundraising from a Venture Capitalist",
      url: "https://miro.medium.com/max/4772/1*OpxA4Hu1n2wN-g4cE4R2ng.jpeg",
      link:
          "https://yashvendrajnv95.medium.com/5-tips-for-an-early-stage-fundraising-from-a-venture-capitalist-8bab63fee6bd"),
  Article(
      name: "Online Business From Home: 5 Steps For Starting Up Virtually",
      url: "https://miro.medium.com/max/4500/1*5YLM4Tk3K05uiPRviDbQEA.png",
      link:
          "https://yashvendrajnv95.medium.com/online-business-from-home-5-steps-for-starting-up-virtually-31cb918ceb03"),
  Article(
      name: "Checklist for Your Dream Restaurant!",
      url: "https://miro.medium.com/max/5040/1*nNH50MLz8L9R7o-nr6_9Dg.png",
      link:
          "https://yashvendrajnv95.medium.com/checklist-for-your-dream-restaurant-b9feecc80922"),
  Article(
      name: "6 Benefits How Technology Can Be Beneficial for Your Business",
      url: "https://miro.medium.com/max/4000/1*N9c2JtDuvNtVSNxFzpuz_g.png",
      link:
          "https://yashvendrajnv95.medium.com/6-benefits-how-technology-can-be-beneficial-for-your-business-d45e455c2b0d"),
  Article(
      name:
          "Digital Marketing Tips for Small Businesses in 2020: 3 Ways to Up Your Business Online",
      url: "https://miro.medium.com/max/3800/1*2OGcql23QSN6ca68vd3kFQ.png",
      link:
          "https://yashvendrajnv95.medium.com/digital-marketing-tips-for-small-businesses-in-2020-3-ways-to-up-your-business-online-37034c1ad13d"),
  Article(
      name: "7 Business Marketing Strategies to Build Your Brand!",
      url: "https://miro.medium.com/max/3840/1*jg0ItmtU2akCTFt3Ai5NxA.png",
      link:
          "https://yashvendrajnv95.medium.com/7-business-marketing-strategies-to-build-your-brand-4ded33f2a1c8"),
  Article(
      name: "Businesses Of Future: 3 Ideas That Are Going To Hit The Jackpot",
      url: "https://miro.medium.com/max/2400/1*idYCK_lviKEzKU9uUXYZug.jpeg",
      link:
          "https://yashvendrajnv95.medium.com/businesses-of-future-3-ideas-that-are-going-to-hit-the-jackpot-f48daeca5362"),
  Article(
      name:
          "Starting Up a Business: 5 Things Young Entrepreneurs Should Know to Make Their Business a Success",
      url: "https://miro.medium.com/max/4024/1*HZm2Wppz5ox3Ko5VhfW-pg.png",
      link:
          "https://yashvendrajnv95.medium.com/starting-up-a-business-5-things-young-entrepreneurs-should-know-to-make-their-business-a-success-ee6e2e339039"),
  Article(
      name: "7 things people who are good with money never buy",
      url: "https://miro.medium.com/max/4000/1*nHpvjwQWYQ36g-NTn9o6AQ.jpeg",
      link:
          "https://medium.com/business-insider/7-things-people-who-are-good-with-money-never-buy-70cfff912729"),
  Article(
      name: "What Seven Years at Airbnb Taught Me About Building a Business",
      url: "https://miro.medium.com/max/6206/1*cufFG8OsK1K0z2zTmdaDnw.png",
      link:
          "https://marker.medium.com/what-seven-years-at-airbnb-taught-me-about-building-a-company-e1d035d49c56"),
  Article(
      name:
          "How my friends and I grew our side project into a dollers 17,000/month business",
      url: "https://miro.medium.com/max/4000/1*NUS8qMfEvmD6N2dHc_3d5A.jpeg",
      link:
          "https://medium.com/free-code-camp/growing-a-side-project-into-a-17-000-month-business-46024d2aa87f"),
  Article(
      name:
          "How training my brain to focus helped me to build two profitable businesses",
      url: "https://miro.medium.com/max/4000/1*rqwYdXAEPFygHIYCNS-h3A.jpeg",
      link:
          "https://medium.com/swlh/how-training-my-brain-to-focus-helped-me-to-build-two-profitable-businesses-7d3174f22c9b"),
  Article(
      name: "Why businesses fail at machine learning",
      url: "https://miro.medium.com/max/875/1*Yi1y98MLXsbWKUhkL_r2aw.png",
      link:
          "https://medium.com/hackernoon/why-businesses-fail-at-machine-learning-fbff41c4d5db"),
  Article(
      name:
          "Building a Business From a Bedroom, dollers 98,130 and 11-Months In",
      url: "https://miro.medium.com/max/11876/1*CwUZkNdcLkmUN96Tj8pd5Q.jpeg",
      link:
          "https://medium.com/the-post-grad-survival-guide/building-a-business-from-a-bedroom-98-130-and-11-months-in-7a55774b2a0"),
  Article(
      name: "7 signs you’re rich, even if it doesn’t feel like it",
      url: "https://miro.medium.com/max/4000/1*_wCaNRD3vzKFie3tCMU8CA.jpeg",
      link:
          "https://medium.com/business-insider/7-signs-youre-rich-even-if-it-doesn-t-feel-like-it-8f8d33602ce"),
];

article(String link) async {
  String url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
