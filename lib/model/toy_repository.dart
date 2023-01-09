

import 'dart:convert';

import 'package:live_app_api_5decembre/model/Toy.dart';
import 'package:live_app_api_5decembre/model/repository.dart';
import 'package:http/http.dart' as http;
import 'package:live_app_api_5decembre/model/toy_model.dart';


class ToyRepository implements Repository {

  String dataUrl = "http://15.236.148.78/products/all?fbclid=IwAR21fNlKPwKyDidzqYi4NJoGBbfx2NLey0GC0mPfrRfOTj63QaXPOaDTTsU";
  String dataUrl2 = "http://15.236.148.78/products/add";

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
  
  @override
  Future postToys(ToyModel model) async {
    // TODO: implement postToys
    throw UnimplementedError();
    final url = Uri.parse(dataUrl2);
    final headers = {"content-type":"application/json"};
    final response = await http.post(url, headers: headers,
     body:jsonEncode([<String, String>{
      "name":model.name,
      "img":model.img,
      "description":model.description,
      "age":model.age,
      "timing":model.timing,
      "video":model.video,
      "age":model.video
     }]));

     print('Status code : ${response.statusCode}');

     if (response.statusCode == 200 || response.statusCode == 201){
      print("la requête a bien été prise ne compte sur le serveur");
     }

     


  }





}