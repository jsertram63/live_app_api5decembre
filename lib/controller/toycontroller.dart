import 'package:live_app_api_5decembre/model/repository.dart';
import 'package:live_app_api_5decembre/model/toy.dart';
import 'package:live_app_api_5decembre/model/toy_repository.dart';


class ToyController {
  final Repository _repository = ToyRepository();
  // Future permet de faire des requetes asynchrones 
  Future<List<Toy>> fetchToys(){
    print("récupération des jouets");
    return _repository.getToys();
    
  }


}
