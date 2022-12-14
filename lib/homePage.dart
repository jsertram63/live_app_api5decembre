import 'package:flutter/material.dart';
import 'package:live_app_api_5decembre/controller/toycontroller.dart';
import 'model/toy.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final monController = ToyController();

  // on va faire appell à un widget FutureBuilder qui va construire une liste quand il aura récupéré les données.
 final _controller = ToyController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BOAD GAMes")),
      body: FutureBuilder<List<Toy>>(
      future: _controller.fetchToys(),  // <====== le controleur récupère les données 
      builder:(context, snapshot) {
      final toys = snapshot.data;
    
      if (toys == null){
        return  Center(child: Container(child: Column(children: [
          CircularProgressIndicator(),
          Text("Chargement des données")
        ]),));
      }
      return ListView.separated(
        itemBuilder: ((context, index) {
          return ListTile(title: Text(toys[index].name),);
        }),
         separatorBuilder:((context, index) => const Divider(
          height: 5,
          color: Colors.grey,
          endIndent: 50,
          indent: 50,
         ) ),
          itemCount: toys.length);
    })
    );
  }}

