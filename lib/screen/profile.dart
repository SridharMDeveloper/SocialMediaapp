import 'package:flutter/material.dart';
import 'package:socialmedia/screen/homepage.dart';
import 'package:socialmedia/widgest/glasscontainer.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:socialmedia/widgest/profilevideoplayer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TabController? _controller;
  int profileindex = 0;

  // TabController controller=TabController(length: 3, vsync: this);

  List<String> assest = [
    'assest/icons/dribble.png',
    'assest/icons/dribble.png',
    'assest/icons/behance.png',
    'assest/icons/youtube.png',
    'assest/icons/githube.png',
  ];
  List<String> assestname = [
    "Dribbble",
    "Dribbble",
    "Behance",
    "youtube",
    "Githube",
  ];

  List<String> postlist = [
    // 'assest/conform1.jpg',
    // 'assest/conform2.jpg',
    // 'assest/conform3.jpg',
    // 'assest/conform6.jpg',
    // 'assest/newpost4.jpg',
    // 'assest/newpost5.jpg',
    // 'assest/newpost6.jpg',
    'assest/pp1.jpg',
    'assest/pp2.jpg',
    'assest/pp3.jpg',
    'assest/pp4.jpg',
    'assest/pp5.jpg',
    'assest/pp6.jpg',
    'assest/pp7.jpg',
    'assest/pp8.jpg',
    'assest/pp9.jpg',
    'assest/pp10.jpg',
    'assest/p1.jpg',
    'assest/p2.jpg',
    'assest/p3.jpg',
    'assest/p4.jpg',
    'assest/p5.jpg',
    'assest/p7.jpg',
    'assest/p8.jpg',
    'assest/p9.jpg',
    'assest/p10.jpg',
  ];

  List<String> saved = [
    'assest/p1.jpg',
    'assest/p2.jpg',
    'assest/p3.jpg',
    'assest/p4.jpg',
    'assest/p5.jpg',
    'assest/p7.jpg',
    'assest/p8.jpg',
    'assest/p9.jpg',
    'assest/p10.jpg',
  ];

  List<String> videourllist = [
    "assest/1.mp4",
    "assest/2.mp4",
    "assest/3.mp4",
    "assest/4.mp4",
    "assest/5.mp4",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int isclicked = 1;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 36, 35, 35),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: height * 0.15,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                          image: AssetImage('assest/bi1.jpeg'),
                          fit: BoxFit.cover)),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return LandingPage(username: 'H', email: 'j');
                              },
                            ));
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assest/icons/setting.png',
                          color: Colors.white,
                          height: height * 0.04,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.25,
                  // color: Colors.amber,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              HeadingText('23', 22, Colors.white),
                              HeadingText('Posts', 19,
                                  const Color.fromARGB(255, 172, 170, 170)),
                            ],
                          ),
                          Column(
                            children: [
                              HeadingText('24.6k', 22, Colors.white),
                              HeadingText('Followers', 19,
                                  const Color.fromARGB(255, 172, 170, 170)),
                            ],
                          ),
                        ],
                      ),
                      Transform.translate(
                        offset: Offset(-0, -height * 0.05),
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: height * 0.15,
                                width: width * 0.25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                    image: const DecorationImage(
                                        image: AssetImage('assest/pp6.jpg'))),
                                child: Transform.translate(
                                  offset: const Offset(40, 50),
                                  child: const Icon(
                                    Icons.add_circle_sharp,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              HeadingText('Cabeza Patata ', 22, Colors.white),
                              const SizedBox(
                                height: 5,
                              ),
                              HeadingText('Designer', 18, Colors.white),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              HeadingText('62', 22, Colors.white),
                              HeadingText('Following', 19,
                                  const Color.fromARGB(255, 172, 170, 170)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              HeadingText('500.6k', 22, Colors.white),
                              HeadingText('Page Views', 19,
                                  const Color.fromARGB(255, 172, 170, 170)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // HeadingText(
                //     'A full-service creative studio specialising in character design',
                //     18,
                //     Colors.white),
                // SizedBox(
                //   height: height * 0.03,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isclicked == 0
                        ? Container(
                            height: height * 0.06,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Contact',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                isclicked = 0;
                              });
                            },
                            child: GlassContainer(
                                height: height * 0.06,
                                width: width * 0.3,
                                borderRadius: 15,
                                child:
                                    HeadingText('Contact', 18, Colors.white)),
                          ),
                    isclicked == 1
                        ? Container(
                            height: height * 0.06,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Startistics',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                isclicked = 1;
                              });
                            },
                            child: GlassContainer(
                                height: height * 0.06,
                                width: width * 0.3,
                                borderRadius: 15,
                                child: HeadingText(
                                    'Startistics', 18, Colors.white)),
                          ),
                    isclicked == 2
                        ? Container(
                            height: height * 0.06,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                isclicked = 2;
                              });
                            },
                            child: GlassContainer(
                                height: height * 0.06,
                                width: width * 0.3,
                                borderRadius: 15,
                                child: HeadingText(
                                    'Edit Profile', 18, Colors.white)),
                          ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                SizedBox(
                  height: height * 0.13,
                  width: width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: assest.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 20.0, top: 8, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: height * 0.08,
                              width: height * 0.08,
                              decoration: BoxDecoration(
                                color: profileindex == index
                                    ? Colors.transparent
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Image.asset(
                                profileindex == index
                                    ? 'assest/icons/addnew.png'
                                    : assest[index],
                                color:
                                    profileindex == index ? Colors.white : null,
                              ),
                            ),
                            Text(
                              profileindex == index ? "New" : assestname[index],
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: width,
                  height: 600,
                  child: ContainedTabBarView(
                    tabBarProperties:
                        const TabBarProperties(indicatorColor: Colors.white),
                    tabs: [
                      HeadingText('Post', 20, Colors.white),
                      HeadingText('Videos', 20, Colors.white),
                      HeadingText('Saved', 20, Colors.white)
                    ],
                    views: [
                      MasonryGridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: postlist.length,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: InstaImageViewer(
                                child: Image.asset(postlist[index])),
                          );
                        },
                      ),
                      MasonryGridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: videourllist.length,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              height: height * 0.4,
                              width: 60,
                              child: profilePlayer(
                                  video: videourllist[index],
                                  currentindex: 0,
                                  pagviewindex: 0),
                            ),
                          );
                        },
                      ),
                      MasonryGridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: saved.length,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: InstaImageViewer(
                                child: Image.asset(saved[index])),
                          );
                        },
                      ),
                    ],
                    onChange: (index) => print(index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text HeadingText(String heading, double size, Color color) {
    return Text(
      heading,
      style: TextStyle(fontSize: size, color: color),
    );
  }
}
