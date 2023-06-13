import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:socialmedia/widgest/const.dart';

import 'package:socialmedia/widgest/glasscontainer.dart';

import '../story.dart';
import '../widgest/datamodel.dart';

import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:insta_like_button/insta_like_button.dart';

import 'createpost.dart';
import 'favorate.dart';
import 'notification.dart';
import 'profile.dart';
import 'shotsscreen.dart';
import 'statusupload.dart';

class LandingPage extends StatefulWidget {
  String username;
  String email;

  LandingPage({
    Key? key,
    required this.username,
    required this.email,
  }) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Future<List<Firebasedata>> retrieveEmployees() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection("social media").get();
    return snapshot.docs
        .map((docSnapshot) => Firebasedata.fromJson(docSnapshot.data()))
        .toList();
  }

  List<String> iconList = [
    "assest/icons/1.png",
    "assest/icons/2.png",
    "assest/icons/3.png",
    "assest/icons/4.png",
    "assest/icons/5.png",
  ];

  List<String> addfav = [];
  List<int> storyview = [1, 2, 3, 4, 5];

  int navindex = 0;

  int profileindex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 36, 35, 35),
          body: FutureBuilder(
            future: retrieveEmployees(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          AppBar(height),
                          SizedBox(
                            height: height * 0.012,
                          ),
                          StoryListView(height, width, snapshot),
                          SizedBox(
                            height: height * 0.012,
                          ),
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                print("top width$width");
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: GlassContainer(
                                    borderRadius: 15,
                                    height: height * 0.4,
                                    width: width,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: InstaImageViewer(
                                            child: InstaLikeButton(
                                              height: double.infinity,
                                              width: double.infinity,
                                              imageBoxfit: BoxFit.cover,
                                              image: NetworkImage(
                                                snapshot.data![index].post,
                                              ),
                                              onChanged: () {
                                                setState(() {
                                                  addfav.add(snapshot
                                                      .data![index].post);
                                                  print(addfav);
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    maxRadius: 25,
                                                    backgroundImage:
                                                        NetworkImage(snapshot
                                                            .data![index]
                                                            .profilephoto),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                        text:
                                                            '${snapshot.data![index].name}\n',
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        children: [
                                                          TextSpan(
                                                            text: snapshot
                                                                .data![index]
                                                                .location,
                                                            style: const TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        200,
                                                                        209,
                                                                        209,
                                                                        209),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        ]),
                                                  ),
                                                  const Spacer(),
                                                  Image.asset(
                                                    'assest/icons/menu1.png',
                                                    color: Colors.white,
                                                    height: height * 0.025,
                                                  )
                                                ],
                                              ),
                                              const Spacer(),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    addfav.contains(snapshot
                                                                .data![index]
                                                                .post) ==
                                                            true
                                                        ? 'assest/icons/heart.png'
                                                        : 'assest/icons/41.png',
                                                    // color: Colors.white,
                                                    height: height * 0.038,
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Text(
                                                    snapshot.data![index].like
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Image.asset(
                                                    'assest/icons/message.png',
                                                    color: Colors.white,
                                                    height: height * 0.038,
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Text(
                                                    snapshot
                                                        .data![index].commends
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Image.asset(
                                                    'assest/icons/send.png',
                                                    color: Colors.white,
                                                    height: height * 0.038,
                                                  ),
                                                  const Spacer(),
                                                  Image.asset(
                                                    'assest/icons/instasave.png',
                                                    color: Colors.white,
                                                    height: height * 0.038,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                    BottomNavBar(height, width)
                  ],
                );
              } else {
                return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.white,
                    size: 60,
                  ),
                );
              }
            },
          )),
    );
  }

  Positioned BottomNavBar(double height, double width) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: GlassContainer(
          height: height * 0.075,
          width: width,
          borderRadius: 1,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LandingPage(
                          email: '5',
                          username: '5',
                        );
                      },
                    ));
                  },
                  child: Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(color: Colors.white, blurRadius: 25)
                    ]),
                    child: Image.asset(
                      iconList[0],
                      height: height * 0.05,
                      width: height * 0.05,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const ShortScreen();
                      },
                    ));
                  },
                  child: Image.asset(
                    iconList[1],
                    height: height * 0.05,
                    width: height * 0.05,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const CreatePostScreen();
                      },
                    ));
                  },
                  child: Image.asset(
                    iconList[2],
                    height: height * 0.05,
                    width: height * 0.05,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const FaviorteScreen();
                      },
                    ));
                  },
                  child: Image.asset(
                    iconList[3],
                    height: height * 0.05,
                    width: height * 0.05,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const ProfilePage();
                      },
                    ));
                  },
                  child: Image.asset(
                    iconList[4],
                    height: height * 0.05,
                    width: height * 0.05,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Row AppBar(double height) {
    return Row(
      children: [
        // Image.asset(
        //   'assest/icons/camera.png',
        //   height: height * 0.05,
        //   color: Colors.white,
        // ),
        const Spacer(),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ));
          },
          child: Image.asset(
            'assest/icons/communication.png',
            height: height * 0.05,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  StoryListView(
      double height, double width, AsyncSnapshot<List<Firebasedata>> snapshot) {
    return SizedBox(
      height: height * 0.13,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: profileimage.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 8, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const ImageUploadScreen();
                      },
                    ));
                  },
                  child: profileindex == index
                      ? Container(
                          height: height * 0.08,
                          width: height * 0.08,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                  image: AssetImage('assest/plus.png')),
                              border: Border.all(
                                  color: profileindex != index &&
                                          storyview.contains(index)
                                      ? Colors.white
                                      : Colors.black,
                                  style: BorderStyle.solid,
                                  width: 2)),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const StoryPage();
                              },
                            ));
                          },
                          child: Container(
                            height: height * 0.08,
                            width: height * 0.08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: AssetImage(profileimage[index]),
                                ),
                                border: Border.all(
                                    color: profileindex != index &&
                                            storyview.contains(index)
                                        ? Colors.white
                                        : Colors.black,
                                    style: BorderStyle.solid,
                                    width: 2)),
                          ),
                        ),
                ),
                Text(
                  profileindex == index ? " Add Story" : profilename[index],
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
