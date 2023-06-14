import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class Lecteur extends StatefulWidget {
  var place;
  Lecteur({required this.place});

  @override
  State<Lecteur> createState() => _LecteurState();
}


class _LecteurState extends State<Lecteur> {
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.network('https://emploie.alwaysdata.net/daywatch/film/'+widget.place)
      ..initialize().then((_){
        setState(() {
          _videoPlayerController!.value.isPlaying
              ?_videoPlayerController!.pause()
              :_videoPlayerController!.play();
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      bottomNavigationBar: Container(
        height: 80,
        child: Column(
          children: [
            Container(
              child: VideoProgressIndicator(
                _videoPlayerController!,
                allowScrubbing: true,
                padding: EdgeInsets.all(0.0),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: FloatingActionButton.extended(
                  onPressed:(){
                    _videoPlayerController!.value.isPlaying
                        ?_videoPlayerController!.pause()
                        :_videoPlayerController!.play();
                  },
                  label:Icon(Icons.play_arrow,color: Colors.red,)),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _videoPlayerController!.value.isInitialized
          ?Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: AspectRatio(aspectRatio: _videoPlayerController!.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController!),
              ),
            ),
          ):Center(child: CircularProgressIndicator(color: Colors.red,)),

        ],
      ),
    );
  }
}
