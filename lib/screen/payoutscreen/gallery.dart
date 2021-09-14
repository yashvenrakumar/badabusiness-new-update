// import 'package:badabusiness/screen/payoutscreen/others/msg.dart';
// import 'package:badabusiness/screen/registration/payment.dart';
import 'package:badabusiness/screen/payoutscreen/others/msg.dart';
import 'package:badabusiness/screen/registration/payment.dart';
import 'package:badabusiness/screen/search/searchbutton.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'others/fullimage.dart';
//import 'others/fullimage.dart';

class Galleryy extends StatefulWidget {
  @override
  State<Galleryy> createState() => _GalleryyState();
}

class _GalleryyState extends State<Galleryy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: gal.length == 0
          ? CircularProgressIndicator()
          : Scaffold(
              body: CustomScrollView(
                slivers: <Widget>[
                  searchbuttion(context),
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
                    // expandedHeight: 100.0,
                    // floating: true,

                    // flexibleSpace: FlexibleSpaceBar(
                    //     centerTitle: true,

                    //     background: Image.asset(
                    //       "assets/images/i29.png",
                    //       fit: BoxFit.fill,
                    //     )),
                    backgroundColor: Colors.white,
                  ),

                  SliverToBoxAdapter(
                    child: Container(
                        height: 900,
                        child: ListView.builder(
                            itemCount: gal.length,
                            itemBuilder: (Context, index) {
                              String url = gal[index];
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Full(url)));
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => Msg()));
                                      },
                                      child: Card(
                                        child: Container(
                                          color: Colors.white,
                                          margin: EdgeInsets.all(15),
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  Center(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      child: Container(
                                                          child: Opacity(
                                                              opacity: .3,
                                                              child:
                                                                  Image.network(
                                                                      url))),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.all(30),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        child: Container(
                                                          child:
                                                              new FadeInImage(
                                                            image:
                                                                new NetworkImage(
                                                                    url),
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
                                              Text(
                                                "Call Now +91 7549135542",
                                                style: TextStyle(
                                                    color: Colors.yellow[700],
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "Dr Vivek Bindra - Bada Business team",
                                                style: TextStyle(
                                                    color: Colors.yellow[700],
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Paymentt()));
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.all(6),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                                    colors: [
                                                              Colors.green
                                                                  .shade100,
                                                              Colors.green
                                                                  .shade200
                                                            ])),
                                                        child: Container(
                                                            height: 50,
                                                            // width: MediaQuery.of(context).size.width - 10,
                                                            child: Center(
                                                                child: Text(
                                                              "Enhance Learning 👨‍👩‍👧‍👦",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ))),
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })

                        // StreamBuilder<QuerySnapshot>(
                        //     stream: FirebaseFirestore.instance
                        //         .collection('thought')
                        //         .snapshots(),
                        //     builder: (BuildContext context,
                        //         AsyncSnapshot<QuerySnapshot> snapshot) {
                        //       if (snapshot.hasError) {
                        //         return Center(
                        //             child:
                        //                 CircularProgressIndicator() //Text('Error: ${snapshot.error}'),
                        //             );
                        //       }
                        //       return Container(
                        //         color: Colors.white,
                        //         child: ListView(
                        //           scrollDirection: Axis.vertical,
                        //           children: snapshot.data!.docs
                        //               .map<Widget>((DocumentSnapshot document) {
                        //             String url = document['url'];

                        // return SingleChildScrollView(
                        //   child: Column(
                        //     children: [
                        //       InkWell(
                        //         onTap: () {
                        //           Navigator.of(context).push(
                        //               MaterialPageRoute(
                        //                   builder: (context) => Full(url)));
                        //           Navigator.of(context).push(
                        //               MaterialPageRoute(
                        //                   builder: (context) => Msg()));
                        //         },
                        //         child: Card(
                        //           child: Container(
                        //             color: Colors.white,
                        //             margin: EdgeInsets.all(15),
                        //             child: Column(
                        //               children: [
                        //                 Stack(
                        //                   children: [
                        //                     Center(
                        //                       child: ClipRRect(
                        //                         borderRadius:
                        //                             BorderRadius.circular(
                        //                                 6),
                        //                         child: Container(
                        //                             child: Opacity(
                        //                                 opacity: .3,
                        //                                 child:
                        //                                     Image.network(
                        //                                         url))),
                        //                       ),
                        //                     ),
                        //                     Center(
                        //                       child: Container(
                        //                         margin: EdgeInsets.all(30),
                        //                         child: ClipRRect(
                        //                           borderRadius:
                        //                               BorderRadius.circular(
                        //                                   6),
                        //                           child: Container(
                        //                             child: new FadeInImage(
                        //                               image:
                        //                                   new NetworkImage(
                        //                                       url),
                        //                               fit: BoxFit.fill,
                        //                               placeholder:
                        //                                   new AssetImage(
                        //                                 "assets/lo.gif",
                        //                               ),
                        //                             ),
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //                 Text(
                        //                   "Call Now +91 7549135542",
                        //                   style: TextStyle(
                        //                       color: Colors.yellow[700],
                        //                       fontSize: 17,
                        //                       fontWeight: FontWeight.bold),
                        //                 ),
                        //                 Text(
                        //                   "Dr Vivek Bindra - Bada Business team",
                        //                   style: TextStyle(
                        //                       color: Colors.yellow[700],
                        //                       fontSize: 16,
                        //                       fontWeight: FontWeight.bold),
                        //                 ),
                        //                 InkWell(
                        //                     onTap: () {
                        //                       Navigator.of(context).push(
                        //                           MaterialPageRoute(
                        //                               builder: (context) =>
                        //                                   Paymentt()));
                        //                     },
                        //                     child: Container(
                        //                       margin: EdgeInsets.all(6),
                        //                       child: ClipRRect(
                        //                         borderRadius:
                        //                             BorderRadius.circular(
                        //                                 40),
                        //                         child: Container(
                        //                           decoration: BoxDecoration(
                        //                               gradient:
                        //                                   LinearGradient(
                        //                                       colors: [
                        //                                 Colors
                        //                                     .green.shade100,
                        //                                 Colors
                        //                                     .green.shade200
                        //                               ])),
                        //                           child: Container(
                        //                               height: 50,
                        //                               // width: MediaQuery.of(context).size.width - 10,
                        //                               child: Center(
                        //                                   child: Text(
                        //                                 "Enhance Learning 👨‍👩‍👧‍👦",
                        //                                 style: TextStyle(
                        //                                     color: Colors
                        //                                         .black,
                        //                                     fontSize: 20,
                        //                                     fontWeight:
                        //                                         FontWeight
                        //                                             .w600),
                        //                               ))),
                        //                         ),
                        //                       ),
                        //                     )),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // );
                        //           }).toList(),
                        //         ),
                        //       );
                        //     }),
                        ),
                  ),

                  // SliverToBoxAdapter(
                  //   child: Container(
                  //     height: 300,
                  //     color: Colors.black,
                  //     child: gallery(),
                  //   ),
                  // ),
                  // gallery(),
                ],
              ),
            ),
    );
  }
}

SliverToBoxAdapter gallery() {
  return SliverToBoxAdapter(
    child: Scaffold(
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('thought').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child:
                        CircularProgressIndicator() //Text('Error: ${snapshot.error}'),
                    );
              }
              return Container(
                color: Colors.white,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data!.docs
                      .map<Widget>((DocumentSnapshot document) {
                    String url = document['url'];

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => Full(url)));
                            },
                            child: Card(
                              child: Container(
                                color: Colors.white,
                                margin: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            child: Container(
                                                child: Opacity(
                                                    opacity: .3,
                                                    child: Image.network(url))),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            margin: EdgeInsets.all(30),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              child: Container(
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
                                      ],
                                    ),
                                    Text(
                                      "Call Now 8887694282",
                                      style: TextStyle(
                                          color: Colors.yellow[700],
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Dr Vivek Bindra - Bada Business team",
                                      style: TextStyle(
                                          color: Colors.yellow[700],
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          // Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             Paymentt()));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(6),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [
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
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ))),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
      ),
    ),
  );
}

List<String> gal = [
  "https://yt3.ggpht.com/81qSLY5OeeNb_fbFMrTCIJPP7Ox3LvhLw7yYsIaQTcmIrRYfdUjjY-wA0JXwY3wvQ7XdcQOOE_rQap0=s720-c-fcrop64=1,00000000bfffffff-nd",
  "https://yt3.ggpht.com/CVICYoF4ZEfYNPuuSqg3Oq3IlLsVOjCulEa7tUustxqZ38Sc0NLBHQa2bNaMXMfUme0IEtcmOM35=s640-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/hO89EiwTlhwDdBjsv5_uy-ikDGaxi-KoSVXbW7UA83R7RoGpm8TCKh1TAhFWNsQ54jmydhYas34LEg=s640-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/axBFN80TzBk7X2_TxH0Cz-3CDnBHLjT3e5pPrzCmU41Z_PdQ9QzzmxJcED7o_bvEb1Y2CWU2RSp3ug=s640-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/hdXrgtoVVSRhyZD6ho_-ecgEgq42Cmn7SRFF8zSUWo2h-86hKT01Lcd8IY-FSoX1hlis-B6OEQji=s640-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/n0BRohbA-bHKQDs_cLvymg2q597_TA1N6H7l0PkBY5Qvep1oj_d9oBJ2H0wOK_IB9KJcF1Y1vbtXPg=s640-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/lwM5iuXYv5eay3sxXsU_IoRpcuDefb8InNjavXlZXBT_SuyBaFXQcciaJGXq-SrvYY-Rtbe0enUNTQ=s640-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/jNIKYmeZ6PcbTuLK2bfL5BcYFHqZuqXoKhjzEB9CEunGfrMWMoUXLJkHXzeZ2OwH0G_3sjOeX88v=s640-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/rsUXjcRhJ4nMzJqu00NxHRYGrdxPzu8wi83cJU1kyFaFrRW5t4egJ7P_lyeYjDpEltfcAviHEEmbPw=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/XaPZz4JJh12DcP1ec-NES7yDrzXpqeu4gcVfyJlihmB6I5LEFUJE9vIwfpTyQwdmhOxUI1VdDpI5qV0=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/WXbn04Tc7tysCOuzoryGAN-F9lfAuTEeT-ojuE1FUajl6bfbdJchiZ6AySdmUvk_-xHagG85Zj8icA=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/3ePzIjOJJg-cO7GUTGK8--v3XvjodVUE2dFkLNhjcq_XUuR8ZEDCo7fNLse_vQapWCYQa7akbcdSgA=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/arGhDwrWGi3mc5wlQi9EZHp9peNwrtc-s02tyP1beSkjx-s8yJAx_xtZD-v5UpkzBsqfNTPLV_vz_84=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/ESXGSc3mADMK5Oy4Drgp0tiEJkXEQDrI2BZUDECMV6zhcX6gAs3lUoDOK54gNjY1oY1Zd2jdiqAxuQ=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/zE8xGtigaoDcfyfEXd144v4eMRjC3GMvJN63BFEw7I99Ltqu0Fb9I4U_R6acq0HJiNmZF9EBAeYfKo0=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/zTQ9jSOe0He1sRocFubNFpAttBKXwUCXB543Jy51P88T_aSWw6_X-OqF_H6iIOhN6lR0X8ImqQh7NA=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/kOe78wh_HCJJFOq_CSdz-ZGDCYsdN6Rld6db6Ht1ilhqaMif2vsdq_u6PrPie4lyZxtP8NRkeXtX=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/LW75FicOTv8enYeXYH5vgcI-o_Ry73qRI9w-X-EZn-1UBAhFPsZwnEHqlvZEdl9gS59dJ-WQorEzsmg=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/D2kABQWTi3YyiujRv7cIjuOJc14liXn14JnsRYnkt_R5FO7vpIwtcKgbvhnZL4QlF7kHYJybo3tr=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/hxNcj7JLblVeAJF03cjWu_F1Dc-X8sx-OliXJkDei3Fn8gm4qcM_bDuRxFA6JrTmE2t5ZApM-Cp3Syo=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/pDxHsyQLRoHeRjp5CM9Xb3bAHxYxFAw-S6beJKfNO-w5HvvqqYvzjpR-yWO5AvYE8fIJuktkresvZ10=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/97NlWtqTDtUPacwOmzbtpZEjHYWWW1CDyYC3-5EfJ5b8wjdNjkFqRwxykbZvE8aB5GtZLrCO7yM_Zw=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/Pvb2xxGAkjpTQekK9KLwuSTZE8WWArtYKU3cxh1p1ytYpZNf-In9AF5By4ON51w9sNRbGuAnL8t1Eg=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/EYpC0qe6d-DJ0ZBoXnjlRGbNPHdKSXW095lVQ-To_Kn00Bf86Vo9eHLqdGxoZTcFar-KVwdqgaH8BQ=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/jgABjXkJ1zSddExl-TLpVYqb7cKQ-2lYi0s1vdv5vryCRthoIawSipv02vTt_Ta-t16bc-d6HhY57g=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/4AyygULKUShQrfSYrdLG7RQrNGFB5aKQgCduImXtOZm4QHobWksm74-OjnmfPNtTmULJnp7thYRHj4A=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/ovNEgVEmxrEvVo9fCktT0kISQ4OdKsY5UsjNnVtORbt3rM2mwyZwPbV1t6RT_sMH-d7-rwyapRmXOQ=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/r1WJZgeQgpV4T0ITgFCsjHMH3ADmEBByLCU4jYzPtPzZ0fegDFzJe9-DlyMokbepnSNNqu-1DEJPh64=s800-c-fcrop64=1,0000001affffffe5-nd",
  "https://yt3.ggpht.com/mfzXXW0jjAN12bKawQrMfxBuyPG2A5egtB2sxg8CeI7oEbpcPZaG4F0vpSd8RdMFQCikHm1bIw5RLzY=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/ylw_V-UbBgMVjKfkB74ddBTaYSonspeU2tNMxe8nGjLauTthG6EeyfnHNgucgPjR9zINzV2ExITisG0=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/qwn-6tCOW9EcHPSJFJr2ZaXxwdKTkpuC8rWpK9qCFiqIfiftj1hVVLJzov3J-pfXZYGqnFqGvzpJiA=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/SOlkaU8wQo4aKDfp1qq3Asn2LhdMi_mh0WPJg3NDSWzszGoF6XQxIy9TmIFEihk6VsPwYt1UZRV0=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/toeXbhSXhgV_19XYzIVLpqiboW1SCuUy_mqpDDKobirf58keCXDKwLCVm9W6M1kQ4YMeeJD92LirBQ=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/jlzuNPEDE_jlDuDLcg-4pPsT9r5mQh8UziHgNNJWYvKBO1gydlLynzARlAkb6ftSm-DFN8FY-mCe=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/jlzuNPEDE_jlDuDLcg-4pPsT9r5mQh8UziHgNNJWYvKBO1gydlLynzARlAkb6ftSm-DFN8FY-mCe=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/5j64MM4PWkhfpIsBf1iKnksyzXt9TneCxBAZPpPj_QnXZwmAQcV8JHIgRWL6uiXbvLUOHo0EmWG_eQ=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/TRHKmQ4QSqz1h39uDCe99A21D2RubEncD_oLTnctvQYwYVnpDpiOkv5Op30wnXCczNhlzyki4AnDsQ=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/KZ5JrA9lBLV0YZyeQ3_ZAcbcKyW1YypzCkOhy0H2Y3z_SXGPxgYO28gAAB4Jdk7dTLbK8YWhkug=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/ORd12dEPy-9fY5Yvns3epXIUOmLFsAXenLXIPyYqca3MX0pDX6h651VqvchV6nK2cS5Frgx5MWdDq2s=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/UrdyVRokSP1FYKM93WfGTQMJyiAsumWU_S-97qRRIUQAlVIcTMUrdCBezVHN6V0IJiaw56N1gjV8=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/Lr-JkwZywYPiTrlWUxMJm4WzNPycTqgvj39z-hNTaHUKP-1yNyeZYvIZwPuZ09lA6Li60005lS9tAQ=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/4xLyMaZlbAI_6Cgk-guYTafPPPzty4ZHPYccwr73I4autYnsR2TkBeCVSTGvkQHM7EKdqfihi-TwcA=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/88kgFLYrUmQTLqSLjUmskKLeQ86uKP0WjELzBmg4LPZTTeYglDDQ9otpNj_E-FQ5f-Nvo5DSbydg6Ss=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/sXqGMyS24h2Gw8ntq6_X0EZ-fA0RcwrI1f_x3JaWKW85YxIjKr-g420vaGMCCPCvKZItaoZBJkKEarc=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/z2IN53NE4MD6-796zy8lPoZDka95MpowTyroM6y-OJDwZakI_v5HTtXtWqbTemWt_mB7MhHZo0Dz=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/Fs8WXPyg5eNCn_R2rQRdpQDyvC-Y884jZijfginTXjhTlYtupTIEcd-8o3FBNhSDuASvflsCqpY3hw=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/jYP3kT3pJHtV2ErusncoIyccIY27tK8W18c1WHEcos2ylr28Dx8YyOJTGQr39oXCP9LRASqPOYX4sQ=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/KMdhh09ZyGMKUrcCqzVQQr902cpY5TBjpiOfBJSPTIvNoaIRFy8NDiYzQDLtmc7O0f9TBJTvss4T=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/Mj9xgR0J3jSek4CK3fNJ87mHDo7Iy10s9ZeKVtaONJK9zOnsZBmf3JW2Qu_e_6L6fNtCuJ8IFfmkbOY=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/5KARIzATJcabbiVKRMZ9kHBtr65BiM4PKLFvsVZdGg_EQ9q91tjqoAmwUKhnuYTRP0VBq437aMhmyQ=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/RBUqpV0c0_fZkFWwy9soJ6AQJYdwiXjLXNaWpgvn-gI-4JmBHgnpW7ClTj0IiHJx2-RhKtwOaxmg-QA=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/jffypdE3CEUbkL6wSckKJhIPYu_WWQid6SPUDsbtdHkBkISMkICC1PVl04icfFltB9njVVAqHXlV7Q=s800-c-fcrop64=1,00001e66ffffffff-nd",
  "https://yt3.ggpht.com/mqSoOjY2ZytOm_vm7Qbcnklvun7t2ZBpTgCpnRlo2tBUrOycN6mUgOjNJDJM-Wkkgl_4p4ZCGXIt=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/lKRAIg7ReD2w0DX5YKBjHEoUmo8QvEwbrjCBtf803yy6-MNN7kLuelHcNUvtt27LHzNDcdHVaLGq_w=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/kYzePj5ncQaL55tT6i2nYKm5wqLu4J8D_AXPr1I4fDiC7Kl5gwJmCHxz-hlZmxLk-MpVWMFpR0_Dwg=s800-c-fcrop64=1,0000004fffffffb0-nd",
  "https://yt3.ggpht.com/LmP4ndcyVZWlL_1CEV2ADianZk_fj_HkLmde4qFIy5sX5X_LEqDZAxgDfRqgmpgMjZih95d2T6cL=s800-c-fcrop64=1,00001999ffffe665-nd",
  "https://yt3.ggpht.com/2kP0sFGNOMoR72xf9yO-VfR-o-fBi7G6M0tAkdBDXUA7HQWC6bB_LnEMspM29ReQM_uyoi25sISI=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/5GekeZJ0hgNIWKheJXDE2vLKd3bm9KY4GB2hCZVCRbFqqznHqb2KG_tTQefqv4I5aApNWXC9eJMa=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/iO0mVGkop1UW2C2J4oLMiWqmTN2uDf3canwwxbFZVxbjPbrQRdIXS2v3xl6akoOFoQ8CiekkieW9Zw=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/q05NVZNq9Rsy8j474yLZMb2s1Cx3TNgEZ4Xg8vc5AOsnoN8OgabIOtfAQcbP5K8BTcplu7JNsW2dew=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/2nT0SANCFGJCvvcIN9tQJtJHqgwqpMe4CRS3c063XJZo9wXmI78u8C1cjNQarccVMHD5ZxUC-yEcIA=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/BuW8uIMhX7V9FPMdmRv_9XhqpaGuFhsShZIcsilrWtpiK66P6qW4BoqrGS8ScDLpHtgQky14mUDfYw=s720-c-fcrop64=1,20000000dfffffff-nd",
  "https://yt3.ggpht.com/zM1-vUSowljQnQ8vw5E5xvFYXEPifBOLtEzSKsCCXQdHkXSOJQ8KIcT8ZEEod6G2-OfndAoMztXVmpk=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/inUQJmVabD2ZgNRRrGbynxpFF3adU-2VTVohrV3gTt5eQl8zt-SHP0NHkzofNtV8D-xsPyO0g6i6m4E=s754-c-fcrop64=1,1b770000e488ffff-nd",
  "https://yt3.ggpht.com/Fk0phnpHTr5Dt23vqA2lDLhs_KNcaf1ZyWXB7rSgwHpoKtNjkZYA2E02fR3sxBCt1iK5I34Vaw2n=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/_Foi_OIxPxOd9g6P-Z2argp_a39_Ao4EncbMA5KZc7wvejjfC0soKoMXwgEV2_i4MKZjPvVmja4i-Ok=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/zYE_dQ3tT8Bt9x30KMU9aQaVZhvYM-Ck9yRC3Z89vXh8M1fVVMdT7pI1zMf5JmH7a5Cdx875EpPE3Q=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/o-DA4aZje1Cum9QKB634PSFmzcrUf5ndm5almKYzYEGDj9pnBE8UjWrUB8ytTfIBdQAlD0i0GG8qzw=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/X3nY8ctqg5BBU3IO5MuWhAHG86DAUZdn6poUV1wXgfFA6KtbmGsOf69jKHS6zEuT6jaJeHWMYy0kjw=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/zT4czsdJEtIzQdiULLDXcIROgfo17EjCqYYZVnD8NyzMhZ2AUa0hBvQo_6H6rhC1MOdw0TuIlZcR-A=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/uXJKwXGDg6LE0ldaJkDSBqeYVTFVGUO859GYe3FAAXP_4X2QDdcfQaYJFDkYvSV25kd8GLOV_SlYJQ=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/UEiH5XvDgixM0OmQhdg5W9Trb6R70vL9bLzG8Nu9GECBMWykrwQgJnDvY7YpQMowM1vIF974SeB4=s640-c-fcrop64=1,34bb0000df65ffff-nd",
  "https://yt3.ggpht.com/l8otqJ3naNUJJrnExV-CBCKNbE2i_KZuFaDxvEod90ADNuXnwNgnaYTtJ6OFB9KgbVoBd9jGYEwAtw=s719-c-fcrop64=1,002e0000ffd1ffff-nd",
  "https://yt3.ggpht.com/nyZ4RL9t0DiyNkktcMfFCmdwwrisS11Xdi5QgAR0TgLr6HRIp_VhLMCfh5ux046JUBvck9W8hhOeBw=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/AMIG8aU6qcuUKQHXsFyKPAngXEfNEHMrCzzff-fLs270uk7zHuchkMZixINoIzQMxDTxwVFy8s3G=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/ONbCAjPO-vUlK2prATbMlIrHYZ-7IlMU9ETUDISh_iTItQUtH1Wp0yQDiO6S_5qczb5lvhxKozRGtM4=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/zTaHyY5h2zyLWTk5vcR5ELLVRDg-Q4WP6C7axHP0LlRa8SC0zR5vGsKLj0bTcQkNS2jSI7b3lruEaQ=s800-c-fcrop64=1,20000000dfffffff-nd",
  "https://yt3.ggpht.com/gFUbW4yLyNCAsDEvWsDHj68ccm3tiqy0ghvpRCnOMA7urK5W1BPbicxQLPSFjqYWiDcxAD93aDy3=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/nLVx4izKgLMmwA6qivcQApijPOWCPjQPWwVmol7YAVk-nHNNiMjDQts7K6J8LB9Ltux3ooqkycsqEg=s691-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/kNlepssc9U44FXqaCfSwqEK9IeueFqf6DghJzYD0tc2K78zuK9Gd9Gb9H3udf7bVL0owoZM8wGZKtg=s800-c-fcrop64=1,00080000c007ffff-nd",
  "https://yt3.ggpht.com/-x5HdG_ddgVjAY_bYbByZ_zGbfk4Bu_8q7AAXVd6jz2IZk8oD9ZQjpwCQle6Itw0Y6-NpecaiNkb7g=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/81qSLY5OeeNb_fbFMrTCIJPP7Ox3LvhLw7yYsIaQTcmIrRYfdUjjY-wA0JXwY3wvQ7XdcQOOE_rQap0=s720-c-fcrop64=1,00000000bfffffff-nd",
  "https://yt3.ggpht.com/vPJU47r6h3qxHDDKNbDNIbyPJ5Db-ojzINfTBtztWk-v9gKT0x3Jb2olWd-M7NejDZU9JHuW8RMfYw=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/PoQ9Sq3w1qWpTCpAIQbaeXhoTZC2xQqtqdb3jxN8At3eHahdEnNLf716ckerFpsY0iHKEO6n0W7MVg=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/rn7nM7NYTEYgQrVtWYYGH2EBOZ9LkP76kbB1vR2VO_qvZ1nMm2GSlfnbUKUwFiI_izTA7IqoVJWQSQ=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/vyiLDut3nu616U4K4fZkE6zLSQiQgVB2v9O3WJjQlTvxQkhu3MwPwDTXNHlDn_NDC7VBKxSUjqx7nw=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/f9DvLj16zTbNgF7UQTHYMUz1DGKLiOI9lZrRNnh-PE0qEh2xFA_GacLd-eRHuoBEcL0PmA8gX8LiJdU=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/VxOeHKK0Ahq8I5BEV6QmIeFtRxyENS-erTb7cRt_qWZbpcRRYyHjOCP0e-EdrR1xEDxFDy8YSYYXNg=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/EhUFqj5qigKQvLOkCZY0waro7H-Ski5AlpXaNVqLZ1fiy5TQe1Todoy8YPzBH2o2UzbjH46Sw4htTOw=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/cF7jjbnER7du8Fo2qa9PbY_w29Ey4oE4qjYSqnIJAcm8YPD6tYndORdj4eAz31pBb7I0ly3OBGEhZQ=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/INkuS4dDeHiLIXg0OgmeS9dRzWscfnFVZ1a92Z_4wwUEEPsoH3tVt2NvlQpEju2PuKAN4dorVvchfg=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/tt6Kcuf1FnjDy3UFKNwyL-o0wYrn5b2VR2cFbDcOFfkMPGKPWZxBgkFIF6Oed15TvLpH1xQfOGXIww=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/uuCMIX3TjIUhaFPc4q8BzVqKnCRA8Kx0jkywbiMQaanLzR7r-NJSSTs1g3ZYpjwpmKHRFzEFFfMSsQ=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/AwLF5xRdJEwAEqLSY3zfHfj8oiBQnXsDeMEu8lYLGH_0lDdU8yl8LRKs-Kb76LwSe5qHq1PQNWgq1tU=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/fhADcPiBreZmNLjGT3B1sGCThea-e1ih5TmtIkX1V6uZUkzGoYoKhjwWzLf1XgS_0dkp8ETddKGBfNw=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/qkqexerTJivzVYb14mFrJpYH_ysNNe0CxmPsW01El3gJI7jc0gNywAjEoPzY_EYCIjvNzYru1UvACD4=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/eUS0vSsvUueRQ_N_t5oc-Nc37Bi7eHoalYDha4rOnlTU2C8UBswi6-YjZlo_hOhZvJml017RPU71gg=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/dX5y-E4VvttJWbf5U02ztbutzhksrqdfiFUiAVUHoOF6zA1tPeLtD7AQm8tFa8yVb2wOm890iMawVHc=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/uIkUa-Pm3qdEaiBFtdVZobVHtEd8DxBLRNQFAvlrh1-c7cNdytYaqAG9U-QH4PcSg0UpBvmHqReP=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/-rms5F8GJpf_evNN2j7frGep1RZo_gyoFARwZfKNnWff7SW6KV33nW7nFUSrcfNFfRDoLIvptmQs4g=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/ZnC4HwsrJnd9bwaI8WLww_QA5xijRlqnVlwyfejm4X_58oxW1-ovoESArwFldSPa6t6zuR3_13Prc7U=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/CrJxrP-dIJYejIM9RizkCpOLbAtSdPeha75hL1O_mnNfIMW0JEX73blwXnRtnZtQEM6fDUz10y8F4Q=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/3DJw6dnJ6nVI3PyZcluiWQhosLnzi3Bbnn-7U-csVTRww-zIoZkckRQHb_oZbU2s5MIE8rxWXg-Ozg=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/YW1awk5BEr36AZWQCHKL9ogS-POLJcyp10nA1AfPcWd8gmBHwXxFEYS-_CP1krRqB7DSIdMqiWVc=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/qC1G-QFy_cEB8yGHYADkpk2KBy--0QcqEP65594U_v0UtlyIQp5vLkbOwnsg7K-TY1Bkx9SyVnd39A=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/rdYIdlm9d9VUs4Y9KNQc382ixh5ff-k3MEQD7b8YBIYLSNNlTToY_pJlKZVBal_sTBgVt3NlcZScMw=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/zWaKPlf8XQrRKB2zJbMXiOD1WP3DTjqj3Pciq4-8if4IAAaqL76I9lxlWg0uzxRHev_Vj0TzUb_3QA=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/10BEueLudnYhKxStUcQGTYHunN4l_hwwS7-3nX0O7tl-GzmU6FcNeHVWVrOJc4iJBzN2QraegZP6=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/9vGEJwgodDkvIxvvW5Rrv-rR8QRFC5PwpczytRblOt02FlrFfmEl7GNmDY_juE9u18Y9CmvNnbKZVw=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/Qg0f1rPLzzc3lqNh0-hvIlM8fGZReHx24NQTh9C--g_zth7cQzpHMWvx46NpfqmtRz5glMmbW_feUg=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/EQwxSGmX2Pp1nCFxYy46tXAhf5wu9gPqn6ZaPG6ctMop_jqn-b1Fl2Asd9D7M2TBriGEjNpWQZH1sw=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/55m_9w7433zwrxAYn9Bu3dNsRRSpVoLAMno-krCHalthpmzMPpcSGbyMJs7fm24XOqdEvFuvuXdQ6lw=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/GTQfrqZp9ge5eqhD098RxRjISrpJJMTftJ131GjvtNOtucgJaRLG40O7cXo9Dn8o5UcdYEG5x6ZxbQ=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/ebmE3lsEUUl2OKf1LeVQtCK79OHH4Kv3d0EHp7hBIvRjgLH0toNIvd61eQAg0HiVVwJqGsuhmhK9b98=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/Zb68wYFSntbYGV9Cba38sH480l05liHxiNlpvCPjj4Bb-Z1QM1EpZgzyDlFTTpqbdtqfEq4yk6MmQA=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/LSQ3lPnnYaiFojzNF5MPt7HU0u-J8FrNy2WXRZjeZAHKvdczKVcN4k1eLnTsKRO39ZOG-AOlZAlm=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/Bfo2u__le2BBbY5Ara--pMzc-dzGnKPikWws1t-hCysecKNNzxlDTTt3zwY4xG4TKu7rlqzNyO6XHpU=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/TMtDC8hY4m9b4CKgKm37ak4Hwx6K33IHJ9yQbzBuCrTWfrr1NzZrqRdTPAWHqgNzFMwQNm5pBUm7=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/IMkt31FDg623NLNF-fZKv7RWl4810zKdMxKW9S-AwooReekfjmWW1jkZ2ovf81irOHfx4r0ZXf2FGKY=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/IzZFvsXwSU68aTPt8IU3DP3bN_RIvq8WqWHc7gMX9Cwa3LLckB92SVz9rQnBGRivFaZizgoh67pwOA=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/MCK2ikJpRiNJ_QPBERAQQY8raLn6YEneu-j0eZMWyjZrsmgtL9xe9csfpkL47A_UpoyrnAklrJbX4A=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/kFX5PytQAK3oGxWGkbbkXKUR124N7utoSWh5dkBTvCirCM6MAvfTu8c7y-GBq7z3fvtGnf9sjQvJ=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/8Ub_faTaIqB7-0cr5Qi_-Dw9KL-TY7JPYnKMB2eseEkdrvM0xfoYStDzn4gY9PJf67dpgP4cJPfP=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/gbuWwb2ILknl34bmvJJQfoCPTSrPc772tBTBxItaq8uDjN91MjD31dgKEU6ei_sJLhjImUmEWFkH1A=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/ZAQlwhg_50Ym_2jgDYLGMu12odrkdQ-jwHN4e_Ey5w0s0e_4uTgdT0q5JXzK0lm1KnpYrfukWWRJ=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/_BLvCd80X1bumrklfEo-bh7mdmP5QgPEwb_OyBKPXZziazgv6I7gUXzq30HH4uNnSKqphXdQZzNXOD8=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/arL7sDvOjN7GqDVyGyBGBG5fU1NkwRejdIvyOJ-1c3eMBaUHEFl0ImpQE6ziZerxGk_0Jjii5WTVAA=s800-c-fcrop64=1,00000000ffffffff-nd",
  "https://yt3.ggpht.com/EmILZ4DU6BWca7IIARoBxODgLmrgroc6xMJicIm48j8XGs_85pGeyYI997dDtwzRo8RwDeay3hx4=s800-nd",
];

// class Galleryy extends StatefulWidget {
//   @override
//   _GalleryyState createState() => _GalleryyState();
// }

// class _GalleryyState extends State<Galleryy> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: 
//     );
//   }
// }

//       body: StreamBuilder<QuerySnapshot>(
//           stream: Firestore.instance.collection('notify').snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error: ${snapshot.error}'),
//               );
//             }
//             return GridView.count(
//               crossAxisCount: 1,
//               childAspectRatio: 2 / 2.2,
//               scrollDirection: Axis.vertical,
//               children: snapshot.data.documents
//                   .map<Widget>((DocumentSnapshot document) {
//                 // String namee = document['url'];
//                 // String name = document['name'];
//                 // String url = document['url'];
//                 // String link = document['link'];
//                 // String name = document['name'];
//                 // String des = document['des'];

//                 return InkWell(
//                   onTap: () {
//                     // _register();
//                     // getMessage();
//                     // Navigator.of(context).push(MaterialPageRoute(
//                     //     builder: (context) => Notifull(url, link, name, des)));
//                   },

//                 );
//                 // return Container(
//                 //   color: Colors.amber,
//                 //   margin: EdgeInsets.all(4),

//                 //   child: InkWell(
//                 //     onTap: () {
//                 //  },
//                 //     child: new Hero(
//                 //       tag: url,
//                 //       child: new FadeInImage(
//                 //         image: new NetworkImage(url),
//                 //         fit: BoxFit.fill,
//                 //         placeholder: new AssetImage("assets/vb.jpg"),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // );
//               }).toList(),
//             );
//           }),
//     );
//   }
// }

// _register();
// getMessage();
// Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => Notifull(url, link, name, des)));
