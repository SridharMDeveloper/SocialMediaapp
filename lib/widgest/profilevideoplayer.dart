import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class profilePlayer extends StatefulWidget {
  String video;
  int currentindex;
  int pagviewindex;
  profilePlayer({
    Key? key,
    required this.video,
    required this.currentindex,
    required this.pagviewindex,
  }) : super(key: key);

  @override
  State<profilePlayer> createState() => _profilePlayerState();
}

class _profilePlayerState extends State<profilePlayer> {
  late VideoPlayerController _videoPlayerController;
  late Future _initializedVideoplayer;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset(widget.video);
    _initializedVideoplayer = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    _videoPlayerController.play();

    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  bool visible = false;
  bool play = true;

  Time() {
    Timer(
      const Duration(milliseconds: 800),
      () {
        setState(() {
          visible = !visible;
          print(visible);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // widget.pagviewindex == widget.currentindex
    //     ? _videoPlayerController.play()
    //     : _videoPlayerController.pause();

    return FutureBuilder(
      future: _initializedVideoplayer,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              GestureDetector(
                  onTap: () {
                    // play == true
                    //     ? _videoPlayerController.play()
                    //     :

                    setState(() {
                      play = !play;
                      visible = !visible;
                    });
                    Time();

                    if (play == true) {
                      _videoPlayerController.play();
                      print('********************play*******');
                    }

                    if (play == false) {
                      _videoPlayerController.pause();
                      print('********************pause*******');
                    }

                    print('pppppp///$play///ppppppppppppppppppppppp');
                    // print('clicking start');
                    // print(visible);
                  },
                  child: VideoPlayer(_videoPlayerController)),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: AppBar(height),
              // ),
              Visibility(
                visible: visible,
                child: Center(
                  child: Image.asset(
                    play == true
                        ? 'assest/icons/play.png'
                        : 'assest/icons/pause.png',
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        } else {
          return Container(
            color: Colors.black,
          );
        }
      },
    );
  }
}
