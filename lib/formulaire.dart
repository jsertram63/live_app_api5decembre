import 'package:flutter/material.dart';
import 'package:live_app_api_5decembre/controller/toycontroller.dart';
import 'package:live_app_api_5decembre/model/toy_model.dart';



class Formulaire extends StatefulWidget {
  const Formulaire({super.key});

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {

// on va gérer notre formulaire avec un controller
final _controller = ToyController();
late ToyModel _modelToy;
final  formKey = GlobalKey<FormState>();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _modelToy = ToyModel(name: "name", img: "https://m.media-amazon.com/images/I/71yid3nK8mL._AC_SL1015_.jpg", age: "age",
     reference: "reference", price: "price",
      timing: "timing", video: "https://www.youtube.com/embed/4JhFhyvGdik", description: "DES", nbPlayers: "nbPlayers");
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(children: [
            // empilement de TextField
            Padding(
              padding: const EdgeInsets.all(8.0),
      
              child: TextFormField(
                onChanged: (value){
                  _modelToy.name = value;
                },
                decoration: InputDecoration(hintText: "Entrez nom du jouet",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                validator: (value) => value != null && value.isEmpty ? 'Entrez le nom du jouet' : null
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value){
                  _modelToy.description = value;
                },
                decoration: InputDecoration(hintText: "Entrez la description du jouet",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value){
                  _modelToy.price;
                },
                decoration: InputDecoration(hintText: "Entrez le prix du jouet",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value){
                  _modelToy.reference;
                },
                decoration: InputDecoration(hintText: "Entrez la référence du jouet",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value){
                  _modelToy.age = value;
                },
                decoration: InputDecoration(hintText: "Age des joueurs",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: ((value) => _modelToy.nbPlayers = value),
                decoration: InputDecoration(hintText: "Nombre de joueurs",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => _modelToy.timing = value,
                decoration: InputDecoration(hintText: "Temps de jeu",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
              ),
            ),
            ElevatedButton(onPressed: ()async{
              // on met un async car ca sera suivi d'un await pour faire
              // notre requete réseau (POST)
              final form = formKey.currentState!;
              final isValide = form.validate();

              if (isValide){
              await _controller.createToys(_modelToy!);
              Navigator.pop(context);
              }
              
          
          
          
            }, child: Text("Valider"))
          
          
          
          ],),
      ),
    );
  }
}