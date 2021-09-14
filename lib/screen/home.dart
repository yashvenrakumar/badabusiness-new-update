import 'package:flutter/material.dart';

import 'payoutscreen/article.dart';
import 'payoutscreen/community/cummunity.dart';
import 'payoutscreen/gallery.dart';
import 'payoutscreen/homescreen.dart';

//import 'payoutscreen/gallery.dart';
import 'payoutscreen/show.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    HomeScreen(),
    Show(),
    Arti(),
    Community(),
    Galleryy(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.orange[800],
        unselectedItemColor: Colors.orange[300],
        elevation: 0.0,
        items: [
          Icons.home,
          Icons.store,
          Icons.article,
          Icons.group,
          Icons.style_rounded,
        ]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    // ignore: deprecated_member_use
                    title: Text(''),
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: _currentIndex == key
                            ? Colors.blue[600]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(value),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}
