

import 'dart:convert';

import 'package:live_app_api_5decembre/model/Toy.dart';
import 'package:live_app_api_5decembre/model/repository.dart';
import 'package:http/http.dart' as http;


class ToyRepository implements Repository {

  String dataUrl = "http://15.236.148.78/products/all?fbclid=IwAR21fNlKPwKyDidzqYi4NJoGBbfx2NLey0GC0mPfrRfOTj63QaXPOaDTTsU";

  @override
  Future<List<Toy>> getToys() async{
    // TODO: implement getToys
    final toys = <Toy>[];
    final uri = Uri.parse(dataUrl);
    final response = await http.get(uri);
    if (response.statusCode == 200){
      print("reception OK");
      List<dynamic> list = jsonDecode(response.body);
        for(int i=0; i<list.length; i++){
          toys.add(Toy.fromJson(list[i]));
        }
    }
    return toys;
  }

}