import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:socialmedia/screen/homepage.dart';

class VideoPlkayer extends StatefulWidget {
  String video;
  int currentindex;
  int pagviewindex;
  VideoPlkayer({
    Key? key,
    required this.video,
    required this.currentindex,
    required this.pagviewindex,
  }) : super(key: key);

  @override
  State<VideoPlkayer> createState() => _VideoPlkayerState();
}

class _VideoPlkayerState extends State<VideoPlkayer> {
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppBar(height),
              ),
              Visibility(
                visible: visible,
                child: Center(
                  child: Image.asset(
                    play == true
                        ? 'assest/icons/play.png'
                        : 'assest/icons/pause.png',
                    height: 70,
                    width: 70,
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

  Row AppBar(double height) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            _videoPlayerController.pause();
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return LandingPage(username: 'f', email: 's');
              },
            ));
          },
          child: Icon(
            Icons.arrow_back,
            size: height * 0.04,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            print('camera start');
          },
          child: Image.asset(
            'assest/icons/camera.png',
            height: height * 0.04,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
