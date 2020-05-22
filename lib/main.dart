import 'package:covid/pages/GlobalList.dart';
import 'package:covid/pages/global.dart';
import 'package:covid/pages/all.dart';
import 'package:covid/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pageIndex = 0;

  final HomePage _hp = HomePage();
  final AllPages _all = AllPages();
  final GlobalPage _gl = GlobalPage();
  final GlobalList _glist = GlobalList();

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
        return _gl;
        break;
      case 3:
        return _glist;
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
          title: Text("Covid19"),
          backgroundColor: Color(0xff455a64),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: pageIndex,
          height: 60.0,
          items: <Widget>[
            Icon(MdiIcons.home, size: 30, color: Colors.white,),
            Icon(MdiIcons.viewList, size: 30, color: Colors.white,),
            Icon(MdiIcons.allInclusive, size: 30, color: Colors.white,),
            Icon(MdiIcons.expandAll, size: 30, color: Colors.white,),
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
