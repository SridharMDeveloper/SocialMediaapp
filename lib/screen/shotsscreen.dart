import 'package:flutter/material.dart';
import 'package:socialmedia/widgest/glasscontainer.dart';
import 'package:socialmedia/widgest/videoplayer.dart';

class ShortScreen extends StatefulWidget {
  const ShortScreen({super.key});

  @override
  State<ShortScreen> createState() => _ShortScreenState();
}

class _ShortScreenState extends State<ShortScreen> {
  // late VideoPlayerController _videoPlayerController;
  // late Future _initializedVideoplayer;

  List<String> videourllist = [
    "assest/1.mp4",
    "assest/2.mp4",
    "assest/3.mp4",
    "assest/4.mp4",
    "assest/5.mp4",
  ];

  @override
  void initState() {
    // _videoPlayerController = VideoPlayerController.asset('assest/1.mp4');
    // _initializedVideoplayer = _videoPlayerController.initialize();
    // _videoPlayerController.setLooping(true);
    // _videoPlayerController.play();
    super.initState();
  }

  @override
  void dispose() {
    // _videoPlayerController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  int pageview = 0;

  List<String> Profilename = [
    "Rio",
    "Alex",
    "Rose",
    "Sridhar",
    "Andrew",
  ];

  List<String> profileimage = [
    'assest/pp2.jpg',
    'assest/pp3.jpg',
    'assest/pp4.jpg',
    'assest/pp5.jpg',
    'assest/pp6.jpg',
  ];
  List<String> addfav = [];

  List<dynamic> commentslist = [
    {
      'profileimage': 'assest/pp6.jpg',
      'name': 'Andrew  ',
      'time': '6m',
      'comments': 'super dances'
    },
    {
      'profileimage': 'assest/pp3.jpg',
      'name': 'Suriya  ',
      'time': '2m',
      'comments': 'Good Movie'
    },
    {
      'profileimage': 'assest/pp4.jpg',
      'time': '8m',
      'name': 'Michel  ',
      'comments': 'Any one like this movie'
    },
    {
      'profileimage': 'assest/pp8.jpg',
      'name': 'John  ',
      'time': '5m',
      'comments': 'nice'
    },
    {
      'profileimage': 'assest/pp9.jpg',
      'name': 'Oviya  ',
      'time': '10m',
      'comments': 'Seasons 2 waiting'
    },
    {
      'profileimage': 'assest/pp10.jpg',
      'name': 'OScar  ',
      'time': '10m',
      'comments': 'Good clip...'
    },
    {
      'profileimage': 'assest/pp5.jpg',
      'name': 'Rio  ',
      'time': '1m',
      'comments': 'super dances.........'
    }
  ];

  List<String> videodiscripiction = [
    'Wednesday addams dances clip..',
    'Car love whatsapp status',
    'Bugatti lover',
    'Racer whatsappp status ',
    'Bmw....',
  ];

  bool visible = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 36, 35, 35),
          body: PageView.builder(
            onPageChanged: (value) {
              pageview = value;
            },
            scrollDirection: Axis.vertical,
            itemCount: videourllist.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  VideoPlkayer(
                      video: videourllist[index],
                      currentindex: index,
                      pagviewindex: pageview),
                  Positioned(
                    bottom: 0,
                    child: Visibility(
                      visible: visible,
                      child: GlassContainer(
                        borderRadius: 20,
                        height: height * 0.2,
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                maxRadius: 25,
                                backgroundImage:
                                    AssetImage(profileimage[index]),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Profilename[index],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            visible = !visible;
                                          });

                                          // BottomSheetNew(context, height, width,
                                          //     index, visible);

                                          newSheet(
                                              context, height, width, index);
                                        },
                                        child: Image.asset(
                                          'assest/icons/message.png',
                                          color: Colors.white,
                                          height: 22,
                                          width: 22,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      Image.asset(
                                        'assest/icons/upload.png',
                                        color: Colors.white,
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            addfav.add(commentslist[index]
                                                ['profileimage']);
                                            print(addfav);
                                          });
                                        },
                                        child: Image.asset(
                                          addfav.contains(commentslist[index]
                                                      ['profileimage']) ==
                                                  true
                                              ? 'assest/icons/heart.png'
                                              : 'assest/icons/41.png',
                                          height: 27,
                                          width: 27,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                videodiscripiction[index],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          )),
    );
  }

  PersistentBottomSheetController<dynamic> newSheet(
      BuildContext context, double height, double width, int index) {
    return showBottomSheet(
      enableDrag: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return GlassContainer(
            height: height * 0.5,
            width: width,
            borderRadius: 10,
            child: Container(
              child: Column(
                children: [
                  Visibility(
                    visible: true,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                maxRadius: 25,
                                backgroundImage:
                                    AssetImage(profileimage[index]),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    visible = true;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  'assest/icons/close1.png',
                                  color: Colors.white,
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Profilename[index],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assest/icons/UP.png',
                                    color: Colors.white,
                                    height: 22,
                                    width: 22,
                                  ),
                                  SizedBox(
                                    width: width * 0.05,
                                  ),
                                  Image.asset(
                                    'assest/icons/upload.png',
                                    color: Colors.white,
                                    height: 20,
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: width * 0.05,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        addfav.add(commentslist[index]
                                            ['profileimage']);
                                        print(addfav);
                                      });
                                    },
                                    child: Image.asset(
                                      addfav.contains(commentslist[index]
                                                  ['profileimage']) ==
                                              true
                                          ? 'assest/icons/heart.png'
                                          : 'assest/icons/41.png',
                                      height: 25,
                                      width: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.05,
                                  ),
                                ],
                              )
                            ],
                          ),
                          Text(
                            videodiscripiction[index],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: commentslist.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 70,
                          width: width,
                          child: Row(
                            children: [
                              CircleAvatar(
                                maxRadius: 25,
                                backgroundImage: AssetImage(
                                    commentslist[index]['profileimage']),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: commentslist[index]['name'],
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 233, 228, 228),
                                            fontSize: 18),
                                        children: [
                                          TextSpan(
                                            text: commentslist[index]['time'],
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 87, 87, 87),
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ]),
                                  ),
                                  Text(
                                    commentslist[index]['comments'],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
