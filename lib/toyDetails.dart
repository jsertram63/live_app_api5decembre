

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:live_app_api_5decembre/image_container.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'model/Toy.dart';

class ToyDetailPage extends StatefulWidget {

  final Toy toyParse;

  const ToyDetailPage({super.key,required this.toyParse});

  @override
  State<ToyDetailPage> createState() => _ToyDetailPageState();
}

class _ToyDetailPageState extends State<ToyDetailPage> {

  late YoutubePlayerController _controller;


@override
  void initState() {
    // TODO: implement initState
    final videoId = YoutubePlayer.convertUrlToId(widget.toyParse.video);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!, 
      flags: YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

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
      child: ImageContainer(url: widget.toyParse.img,width: 200,height: 200,),
      ),
    );
  }

  Widget _buildMain(BuildContext context){
    return Padding(padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
         
          Text(widget.toyParse.name,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
        Padding(padding: const EdgeInsets.all(10),
        child: Text(widget.toyParse.description,
        style: TextStyle(fontSize: 16.0,fontWeight:FontWeight.w300)
        ),
      
        ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: YoutubePlayer(controller: _controller,
           showVideoProgressIndicator: true,
           bottomActions: [
            CurrentPosition(),
            ProgressBar(
              isExpanded: true,
            )
           ],
           ),
         )
        ],
        
        )

        );
  }
}
