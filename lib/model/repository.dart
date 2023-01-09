

import 'package:live_app_api_5decembre/model/toy_model.dart';

import 'Toy.dart';

abstract class Repository {

  // mot clé FUTURE va permettre de faire des requêtes asynchrones
  Future<List<Toy>> getToys();
  Future postToys(ToyModel model);
  
  


}