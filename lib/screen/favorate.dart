import 'package:flutter/material.dart';

import '../widgest/glasscontainer.dart';
import 'homepage.dart';

class FaviorteScreen extends StatefulWidget {
  const FaviorteScreen({super.key});

  @override
  State<FaviorteScreen> createState() => _FaviorteScreenState();
}

class _FaviorteScreenState extends State<FaviorteScreen> {
  List<dynamic> adduserlist = [
    {
      'profileimage': 'assest/pp6.jpg',
      'name': 'Andrew ',
      'title': 'Designer',
    },
    {
      'profileimage': 'assest/pp3.jpg',
      'name': 'Suriya ',
      'title': 'Ropper',
    },
    {
      'profileimage': 'assest/pp4.jpg',
      'name': 'Sridhar ',
      'title': 'Designer',
    },
    {
      'profileimage': 'assest/pp8.jpg',
      'name': 'John  ',
      'title': 'Model',
    },
    {
      'profileimage': 'assest/pp9.jpg',
      'name': 'Oviya  ',
      'title': '3d Artiest',
    },
    {
      'profileimage': 'assest/pp10.jpg',
      'name': 'OScar  ',
      'title': 'Gamer',
    },
    {
      'profileimage': 'assest/pp5.jpg',
      'name': 'Rio  ',
      'title': 'Developer',
    }
  ];

  List<dynamic> notificationList = [
    {
      'profileimage': 'assest/pp10.jpg',
      'name': 'Andrew ',
      'title': 'Commented',
      'time': '7 min ago',
      'image': 'assest/conform1.jpg',
    },
    {
      'profileimage': 'assest/pp1.jpg',
      'name': 'Suriya ',
      'title': 'Like Your Post',
      'time': '50 min ago',
      'image': 'assest/conform2.jpg',
    },
    {
      'profileimage': 'assest/pp8.jpg',
      'name': 'Sridhar ',
      'title': 'Commented ',
      'time': '7 day ago',
      'image': 'assest/conform3.jpg',
    },
    {
      'profileimage': 'assest/pp6.jpg',
      'name': 'John  ',
      'title': 'Commented ',
      'time': '1 houre ago',
      'image': 'assest/conform5.jpg',
    },
    {
      'profileimage': 'assest/pp9.jpg',
      'name': 'Oviya  ',
      'title': 'Like Your Post',
      'time': '30 min ago',
      'image': 'assest/conform6.jpg',
    },
    {
      'profileimage': 'assest/pp10.jpg',
      'name': 'OScar  ',
      'title': 'Commented ',
      'time': '5 min ago',
      'image': 'assest/new9.jpg',
    },
    {
      'profileimage': 'assest/pp5.jpg',
      'name': 'Rio  ',
      'title': 'Commented ',
      'time': '10 min ag0',
      'image': 'assest/new9.jpg',
    }
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 36, 35, 35),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(height),
              SizedBox(
                height: height * 0.02,
              ),
              TopListView(height, width),
              SizedBox(
                height: height * 0.02,
              ),
              HeadingText('New (23)', 20, Colors.white),
              Expanded(
                  child: ListView.builder(
                itemCount: notificationList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GlassContainer(
                      height: height * 0.15,
                      width: width,
                      borderRadius: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: height * 0.10,
                              width: width * 0.17,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                    style: BorderStyle.solid,
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(notificationList[index]
                                        ['profileimage']),
                                  )),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: notificationList[index]['name'],
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 21),
                                      children: [
                                        TextSpan(
                                          text: notificationList[index]
                                              ['title'],
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ]),
                                ),
                                // HeadingText(notificationList[index]['title'],
                                //     14, Colors.grey),
                                HeadingText(notificationList[index]['time'], 14,
                                    Colors.grey)
                              ],
                            ),
                            SizedBox(
                              height: height * 0.13,
                              width: height * 0.10,
                              child: Image.asset(
                                notificationList[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }

  SizedBox TopListView(double height, double width) {
    return SizedBox(
        height: height * 0.25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: adduserlist.length,
          itemBuilder: (context, index) {
            print("favorate$height");
            return Padding(
              padding: const EdgeInsets.only(right: 35, top: 10, bottom: 10),
              child: GlassContainer(
                  height: height * 0.12,
                  width: width * 0.32,
                  borderRadius: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                            maxRadius: 35,
                            backgroundImage:
                                AssetImage(adduserlist[index]['profileimage'])),
                        HeadingText(
                            adduserlist[index]['name'], 20, Colors.white),
                        HeadingText(
                            adduserlist[index]['title'], 18, Colors.grey),
                        Transform.translate(
                          offset: const Offset(40, 10),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: height * 0.045,
                              width: height * 0.06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assest/icons/adduser.png',
                                    height: height * 0.034,
                                    width: height * 0.034,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            );
          },
        ));
  }

  Text HeadingText(String heading, double size, Color color) {
    return Text(
      heading,
      style: TextStyle(fontSize: size, color: color),
    );
  }

  AppBar(double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
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
        HeadingText('Activity', 30, Colors.white),
        const Spacer(),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
            onTap: () {
              print('camera start');
            },
            child: Icon(
              Icons.people_alt,
              size: height * 0.04,
              color: Colors.white,
            ))
      ],
    );
  }
}
