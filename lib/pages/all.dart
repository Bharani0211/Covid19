import 'package:covid/ModelClasses/CovidModel.dart';
import 'package:covid/network/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getflutter/components/loader/gf_loader.dart';
import 'package:getflutter/types/gf_loader_type.dart';

class AllPages extends StatefulWidget {
  @override
  _AllPagesState createState() => _AllPagesState();
}

class _AllPagesState extends State<AllPages> {
  Future<CovidModelClass> covidObject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    covidObject = Network().getDetails();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
        backgroundColor: Color(0xff000000),
        body: Container(
          child: FutureBuilder<CovidModelClass>(
            future: covidObject,
            builder: (BuildContext context,
                AsyncSnapshot<CovidModelClass> snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                    backgroundColor: Colors.black,
                    body: ListView.builder(
                        itemCount: snapshot.data.data.regional.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: Color(0xff1c313a),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(
                                    "${snapshot.data.data.regional[index].loc}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Total",
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    "${snapshot.data.data.regional[index].totalConfirmed}",
                                                    style: TextStyle(
                                                        color: Colors.white70),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Active",
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    "${snapshot.data.data.regional[index].totalConfirmed - (snapshot.data.data.regional[index].discharged + snapshot.data.data.regional[index].deaths)}",
                                                    style: TextStyle(
                                                        color: Colors.white70),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Indian",
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    "${snapshot.data.data.regional[index].confirmedCasesIndian}",
                                                    style: TextStyle(
                                                        color: Colors.white70),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Foreign",
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    "${snapshot.data.data.regional[index].confirmedCasesForeign}",
                                                    style: TextStyle(
                                                        color: Colors.white70),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Discharged",
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    "${snapshot.data.data.regional[index].discharged}",
                                                    style: TextStyle(
                                                        color: Colors.white70),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Indian",
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    "${snapshot.data.data.regional[index].deaths}",
                                                    style: TextStyle(
                                                        color: Colors.white70),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }));
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
