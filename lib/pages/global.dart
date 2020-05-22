import 'package:covid/ModelClasses/GlobalModelClass.dart';
import 'package:covid/network/global_network.dart';
import 'package:flutter/material.dart';
import 'package:covid/network/global_network.dart';
import 'package:getflutter/components/loader/gf_loader.dart';
import 'package:getflutter/types/gf_loader_type.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalPage extends StatefulWidget {
  @override
  _GlobalPageState createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {

  Future<GlobalModel> globalObject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    globalObject = GNetwork().getGlobalDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff000000),
        body: Container(
          child: FutureBuilder<GlobalModel>(
            future: globalObject,
            builder: (BuildContext context,
                AsyncSnapshot<GlobalModel> snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "STATISTICS ALL OVER THE WORLD",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 30)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  height: 180,
                                  width: 180,
                                  child: Card(
                                    color: Color(0xff1c313a),
                                    child: Row(
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 55.0, left: 25),
                                                child: Text("Total cases",
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.white,
                                                            fontWeight:
                                                            FontWeight
                                                                .w600))),
                                              ),
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 8.0, left: 25),
                                                  child: Text(
                                                      "${snapshot.data.global.totalConfirmed}",
                                                      style: GoogleFonts.openSans(
                                                          textStyle: TextStyle(
                                                              fontSize: 30,
                                                              color:
                                                              Colors.white,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w800))),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  height: 180,
                                  width: 180,
                                  child: Card(
                                    color: Color(0xff1c313a),
                                    child: Row(
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 55.0, left: 25),
                                              child: Text("Active cases",
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontWeight: FontWeight
                                                              .w600))),
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 8.0, left: 25),
                                                  child: Text(
                                                      "${snapshot.data.global.totalConfirmed - (snapshot.data.global.totalDeaths + snapshot.data.global.totalRecovered)}",
                                                      style: GoogleFonts.openSans(
                                                          textStyle: TextStyle(
                                                              fontSize: 30,
                                                              color:
                                                              Colors.white,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w800))),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                height: 180,
                                width: 180,
                                child: Card(
                                  color: Color(0xff1c313a),
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 35.0, left: 25),
                                            child: Text(
                                                "Discharged/\nRecovered",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.openSans(
                                                    textStyle: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w600))),
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, left: 25),
                                                child: Text(
                                                    "${snapshot.data.global.totalRecovered}",
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                            fontSize: 30,
                                                            color: Colors.white,
                                                            fontWeight:
                                                            FontWeight
                                                                .w800))),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                height: 180,
                                width: 180,
                                child: Card(
                                  color: Color(0xff1c313a),
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 50.0, left: 30),
                                            child: Text(
                                                "Deaths",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.openSans(
                                                    textStyle: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w600))),
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, left: 30),
                                                child: Text(
                                                    "${snapshot.data.global.totalDeaths}",
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                            fontSize: 30,
                                                            color: Colors.white,
                                                            fontWeight:
                                                            FontWeight
                                                                .w800))),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                height: 180,
                                width: 180,
                                child: Card(
                                  color: Color(0xff1c313a),
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 35.0, left: 35),
                                            child: Text("New\nConfirmed",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.openSans(
                                                    textStyle: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w600))),
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0, left: 30),
                                                child: Text(
                                                    "${snapshot.data.global.newConfirmed}",
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                            fontSize: 30,
                                                            color: Colors.white,
                                                            fontWeight:
                                                            FontWeight
                                                                .w800))),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                height: 180,
                                width: 180,
                                child: Card(
                                  color: Color(0xff1c313a),
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 50.0, left: 25),
                                            child: Text("New Deaths",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.openSans(
                                                    textStyle: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w600))),
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0, left: 030),
                                                child: Text(
                                                    "${snapshot.data.global.newDeaths}",
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                            fontSize: 30,
                                                            color: Colors.white,
                                                            fontWeight:
                                                            FontWeight
                                                                .w800))),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                    'Last origin updated on: ${snapshot.data.date}',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: GFLoader(
                    type: GFLoaderType.circle,
                  ),
                );
              }
            },
          ),
        ));
  }
}