import 'package:covid/ModelClasses/GlobalModelClass.dart';
import 'package:covid/network/global_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getflutter/components/loader/gf_loader.dart';
import 'package:getflutter/types/gf_loader_type.dart';

class GlobalList extends StatefulWidget {
  @override
  _GlobalListState createState() => _GlobalListState();
}

class _GlobalListState extends State<GlobalList> {
  Future<GlobalModel> global;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    global = GNetwork().getGlobalDetails();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
        backgroundColor: Color(0xff000000),
        body: Container(
          child: FutureBuilder<GlobalModel>(
            future: global,
            builder:
                (BuildContext context, AsyncSnapshot<GlobalModel> snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                    backgroundColor: Colors.black,
                    body: Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: ListView.builder(
                          itemCount: snapshot.data.countries.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: Color(0xff1c313a),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text(
                                      "${snapshot.data.countries[index].country}",
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
                                                      "${snapshot.data.countries[index].totalConfirmed}",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white70),
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
                                                "Confirm",
                                                style: TextStyle(
                                                    color: Colors.white70),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      "${snapshot.data.countries[index].totalConfirmed}",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white70),
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
                                                      "${snapshot.data.countries[index].totalConfirmed - (snapshot.data.countries[index].totalDeaths + snapshot.data.countries[index].totalRecovered)}",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white70),
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
                                                "Recover",
                                                style: TextStyle(
                                                    color: Colors.white70),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      "${snapshot.data.countries[index].totalRecovered}",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white70),
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
                                                "Discharge",
                                                style: TextStyle(
                                                    color: Colors.white70),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      "${snapshot.data.countries[index].totalRecovered}",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white70),
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
                                                "Death",
                                                style: TextStyle(
                                                    color: Colors.white70),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      "${snapshot.data.countries[index].totalDeaths}",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white70),
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
                          }),
                    ));
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
