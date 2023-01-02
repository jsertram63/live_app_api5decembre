

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:live_app_api_5decembre/image_container.dart';

import 'model/Toy.dart';

class ToyDetailPage extends StatelessWidget {

  final Toy toyParse;

  const ToyDetailPage({super.key,required this.toyParse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details fiche jouet")),
      body: Center(child:Column(children: [
        _builderBanner(),
        _buildMain(context)
      ],)),

    );
  }

  Widget _builderBanner(){
    return Container(
      child: Padding(padding:const EdgeInsets.all(15),
      child: ImageContainer(url: toyParse.img,width: 200,height: 200,),
      ),
    );
  }

  Widget _buildMain(BuildContext context){
    return Padding(padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(toyParse.name,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
        Padding(padding: const EdgeInsets.all(10),
        child: Text(toyParse.description,
        style: TextStyle(fontSize: 16.0,fontWeight:FontWeight.w300)
        ))
        ])

        );
  }


}
