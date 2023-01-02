

import 'Toy.dart';

abstract class Repository {

  // mot clé FUTURE va permettre de faire des requêtes asynchrones
  Future<List<Toy>> getToys();
  


}