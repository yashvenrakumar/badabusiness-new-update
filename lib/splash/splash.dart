import 'dart:async';
import 'dart:ui';

import 'package:badabusiness/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GettingStartedScreen extends StatefulWidget {
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 12),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => BottomNavScreen())));
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 5) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        children: [
                          Screen1(),
                          Screen2(),
                          Screen3(),
                          Screen4(),
                          Screen5(),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for (int i = 0; i < 5; i++)
                                if (i == _currentPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // ignore: deprecated_member_use
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      child: Shimmer.fromColors(
                        baseColor: Colors.black,
                        highlightColor: Colors.yellow.shade500,
                        loop: 700,
                        enabled: true,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Text(
                                'Get Started Click Here',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 30,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(15),
                      color: Colors.orange[50],
                      textColor: Colors.black,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BottomNavScreen()));
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget Screen1() {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.center,
          colors: <Color>[Colors.orange.shade100, Colors.white]),
    ),
    child: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    child: Image.asset(
                      "assets/images/i2.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    height: 130,
                    width: 500,
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: RichText(
                    text: new TextSpan(children: [
                      TextSpan(
                          text: "Dr Vivek Bindra",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      TextSpan(
                          text: "\nFounder & CEO - Bada Business",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 20))
                    ]),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    width: 500,
                    height: 200,
                    margin: EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/images/i29.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.center,
            colors: <Color>[Colors.orange.shade200, Colors.white]),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: RotationTransition(
                        turns: _animation,
                        child: Image.asset("assets/images/i1.png"))),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/hr.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5, right: 5, bottom: 10),
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
                                        child: Text("HR"),
                                      ),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/finance.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5, right: 5, bottom: 10),
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
                                        child: Text("Finance"),
                                      ),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/it.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5, right: 5, bottom: 10),
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
                                        child: Text("IT"),
                                      ),
                                    ))
                              ],
                            )),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/legal.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5, right: 5, bottom: 10),
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
                                        child: Text("Legal"),
                                      ),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/dm.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5, right: 5, bottom: 10),
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
                                        child: Text("Digital Maketing"),
                                      ),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/leadership.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5, right: 5, bottom: 10),
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
                                        child: Text("Leadership"),
                                      ),
                                    ))
                              ],
                            )),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.orange.shade100, Colors.white]),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: RotationTransition(
                        turns: _animation,
                        child: Image.asset("assets/images/i19.png"))),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/execution.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5, right: 5, bottom: 10),
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
                                        child: Text("Execution"),
                                      ),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/product.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5, right: 5, bottom: 10),
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
                                        child: Text("Product"),
                                      ),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/retail.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5, right: 5, bottom: 10),
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
                                        child: Text("Retail"),
                                      ),
                                    ))
                              ],
                            )),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/sales.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5, right: 5, bottom: 10),
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
                                        child: Text("Sales"),
                                      ),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/strategy.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5, right: 5, bottom: 10),
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
                                        child: Text("Strategy"),
                                      ),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/marketing.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5, right: 5, bottom: 10),
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
                                        child: Text("Marketing"),
                                      ),
                                    ))
                              ],
                            )),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.center,
            colors: <Color>[Colors.orange.shade100, Colors.white]),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      child: RotationTransition(
                          turns: _animation,
                          child: Image.asset("assets/images/i21.png")),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/eae.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Text(
                        "Everything About Entrepreneurship (EAE) Program  ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/i5.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Transform(
                                      alignment: FractionalOffset.center,
                                      transform: new Matrix4.identity()
                                        ..rotateX(45),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 5, right: 5, bottom: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: <Color>[
                                                Colors.orange.shade100,
                                                Colors.white
                                              ]),
                                        ),
                                        child: Center(),
                                      ),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/i8.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Transform(
                                      alignment: FractionalOffset.center,
                                      transform: new Matrix4.identity()
                                        ..rotateX(45),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 5, right: 5, bottom: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: <Color>[
                                                Colors.orange.shade100,
                                                Colors.white
                                              ]),
                                        ),
                                        child: Center(),
                                      ),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/i17.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Transform(
                                      alignment: FractionalOffset.center,
                                      transform: new Matrix4.identity()
                                        ..rotateX(45),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 5, right: 5, bottom: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: <Color>[
                                                Colors.orange.shade100,
                                                Colors.white
                                              ]),
                                        ),
                                      ),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/i18.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Transform(
                                      alignment: FractionalOffset.center,
                                      transform: new Matrix4.identity()
                                        ..rotateX(45),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 5, right: 5, bottom: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: <Color>[
                                                Colors.orange.shade100,
                                                Colors.white
                                              ]),
                                        ),
                                      ),
                                    ))
                              ],
                            )),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Screen5 extends StatefulWidget {
  @override
  _Screen5State createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.center,
            colors: <Color>[Colors.orange.shade100, Colors.white]),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      child: RotationTransition(
                          turns: _animation,
                          child: Image.asset("assets/images/i9.png")),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/1.png.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Text(
                        "Become an Independent Business Consultant (IBC) ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/i5.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Transform(
                                      alignment: FractionalOffset.center,
                                      transform: new Matrix4.identity()
                                        ..rotateX(45),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 5, right: 5, bottom: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: <Color>[
                                                Colors.orange.shade100,
                                                Colors.white
                                              ]),
                                        ),
                                        child: Center(),
                                      ),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/i20.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Transform(
                                      alignment: FractionalOffset.center,
                                      transform: new Matrix4.identity()
                                        ..rotateX(45),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 5, right: 5, bottom: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: <Color>[
                                                Colors.orange.shade100,
                                                Colors.white
                                              ]),
                                        ),
                                        child: Center(),
                                      ),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/i17.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Transform(
                                      alignment: FractionalOffset.center,
                                      transform: new Matrix4.identity()
                                        ..rotateX(45),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 5, right: 5, bottom: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: <Color>[
                                                Colors.orange.shade100,
                                                Colors.white
                                              ]),
                                        ),
                                      ),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Image.asset(
                                            "assets/images/i23.png"))),
                                Expanded(
                                    flex: 1,
                                    child: Transform(
                                      alignment: FractionalOffset.center,
                                      transform: new Matrix4.identity()
                                        ..rotateX(45),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 5, right: 5, bottom: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: <Color>[
                                                Colors.orange.shade100,
                                                Colors.white
                                              ]),
                                        ),
                                      ),
                                    ))
                              ],
                            )),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
