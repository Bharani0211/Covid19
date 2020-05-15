import 'package:covid/ModelClasses/CovidModel.dart';
import 'package:covid/network/network.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/loader/gf_loader.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<CovidModelClass> covidObject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    covidObject = Network().getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff000000),
        body: Container(
          child: FutureBuilder<CovidModelClass>(
            future: covidObject,
            builder: (BuildContext context,
                AsyncSnapshot<CovidModelClass> snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "ALL INDIA STATISTICS",
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
                                                    top: 45.0, left: 35),
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
                                                          top: 8.0, left: 35),
                                                  child: Text(
                                                      "${snapshot.data.data.summary.total}",
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
                                                  top: 45.0, left: 30),
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
                                                          top: 8.0, left: 35),
                                                  child: Text(
                                                      "${snapshot.data.data.summary.total - (snapshot.data.data.summary.discharged + snapshot.data.data.summary.deaths)}",
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
                                                top: 40.0, left: 30),
                                            child: Text(
                                                "Confirmed\nCases Indian",
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
                                                    "${snapshot.data.data.summary.confirmedCasesIndian}",
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
                                                top: 40.0, left: 20),
                                            child: Text(
                                                "Confirmed\nCases Foreign",
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
                                                    top: 8.0, left: 15),
                                                child: Text(
                                                    "${snapshot.data.data.summary.confirmedCasesForeign}",
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
                                                top: 40.0, left: 25),
                                            child: Text("Discharged/\nCured",
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
                                                    "${snapshot.data.data.summary.discharged}",
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
                                                top: 50.0, left: 45),
                                            child: Text("Deaths",
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
                                                    top: 2.0, left: 45),
                                                child: Text(
                                                    "${snapshot.data.data.summary.deaths}",
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
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                    'Last refreshed on: ${snapshot.data.lastRefreshed}',
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
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                    'Last origin updated on: ${snapshot.data.lastOriginUpdate}',
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
