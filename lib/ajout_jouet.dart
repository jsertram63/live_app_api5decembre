import 'package:flutter/material.dart';
import 'package:live_app_api_5decembre/formulaire.dart';


class AjoutJouet extends StatefulWidget {
  const AjoutJouet({super.key});

  @override
  State<AjoutJouet> createState() => _AjoutJouetState();
}

class _AjoutJouetState extends State<AjoutJouet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Ajouet d'un jouet")),
      body:Formulaire()
    );
  }
}