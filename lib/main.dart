import 'package:covid/pages/about.dart';
import 'package:covid/pages/all.dart';
import 'package:covid/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pageIndex = 0;

  final HomePage _hp = HomePage();
  final AllPages _all = AllPages();
  final AboutPage _about = AboutPage();

  Widget _showPage = new HomePage();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _hp;
        break;
      case 1:
        return _all;
        break;
      case 2:
        return _about;
        break;
      default:
        new Container(
          child: Center(
            child: Text("No pages anymore"),
          ),
        );
    }
  }

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Covid19 IN"),
          backgroundColor: Color(0xff455a64),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: pageIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.golf_course, size: 30, color: Colors.white,),
            Icon(Icons.list, size: 30, color: Colors.white,),
            Icon(Icons.compare_arrows, size: 30, color: Colors.white,),
          ],
          color: Color(0xff455a64),
          buttonBackgroundColor: Color(0xff455a64),
          backgroundColor: Color(0xff000000),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 400),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Color(0xff718792),
          child: Center(
            child: _showPage,
          ),
        ));
  }
}
