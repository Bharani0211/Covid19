import 'dart:convert';
import 'package:covid/ModelClasses/GlobalModelClass.dart';
import 'package:http/http.dart';

class GNetwork{

  Future<GlobalModel> getGlobalDetails() async{
    var Url = "https://api.covid19api.com/summary";

    final response = await get(Uri.encodeFull(Url));

    if(response.statusCode==200){
      return GlobalModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Error in fetching data");
    }

  }
}