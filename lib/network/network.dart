import 'dart:convert';
import 'package:covid/ModelClasses/CovidModel.dart';
import 'package:http/http.dart';

class Network{

  Future<CovidModelClass> getDetails() async{
    var finalUrl = "https://api.rootnet.in/covid19-in/stats/latest";

    final response = await get(Uri.encodeFull(finalUrl)); 

    if(response.statusCode==200){
      return CovidModelClass.fromJson(json.decode(response.body));
    }else{
      throw Exception("Error in fetching data");
    }

  }
}