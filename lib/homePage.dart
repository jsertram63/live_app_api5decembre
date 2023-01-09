import 'package:flutter/material.dart';
import 'package:live_app_api_5decembre/ajout_jouet.dart';
import 'package:live_app_api_5decembre/controller/toycontroller.dart';
import 'package:live_app_api_5decembre/toyDetails.dart';

import 'model/Toy.dart';



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
      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader(decoration:BoxDecoration(
          color: Colors.blue
          ), child: Column(
            children: [
              CircleAvatar(
               backgroundImage: AssetImage('assets/jeu.png'),
               radius: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Board Games', 
                style: TextStyle(fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w800
                
                ),),
              ),
            ],
          ) ,),

          ListTile(title:Text("Liste De jouets"),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomePage()
            ));
          },),
          ListTile(title: Text("Ajout jouet"),
            onTap:(){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AjoutJouet())
              );
            },
          )
        ],
    
        ),
      ),
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
          return 
          _buildrows(toys[index]);
        }),
         separatorBuilder:((context, index) => const Divider(
          height: 10,
          color: Colors.grey,
          thickness: 2,
          endIndent: 50,
          indent: 50,
         ) ),
          itemCount: toys.length);
    })
    );
  }

  Widget _buildrows(Toy toy){
    return ListTile(

      onTap: (){
        // la fonction callback quand on va taper sur une cellule 
        // afficher la vue détail 
        Navigator.of(context).push<MaterialPage>(
          MaterialPageRoute(builder: (context) => ToyDetailPage(toyParse: toy))

        );

      },
      title: Text(toy.name, style: const TextStyle(fontSize: 14),),
      subtitle: Text(toy.description),
      leading:Image.network(toy.img),
   
     



    );

  }  
  
  
}

