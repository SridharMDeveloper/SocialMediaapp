import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:socialmedia/widgest/advancecontainer.dart';
import 'package:socialmedia/widgest/const.dart';
import 'package:socialmedia/widgest/glasscontainer.dart';
import 'package:chips_choice/chips_choice.dart';

import 'homepage.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  List<File> _imageFiles = [];

  Future<void> _pickImages() async {
    List<XFile> selectedImages =
        await ImagePicker().pickMultiImage(imageQuality: 50);
    setState(() {
      _imageFiles =
          selectedImages.map((XFile xfile) => File(xfile.path)).toList();
    });
    print('/////////////////');
    print(selectedImages.length);
    print(selectedImages);
    print('/////////////////');
  }

  List<String> options = [
    'Food',
    'Travel',
    'Advancers',
    'Hot News',
    'Sport',
    'Education',
    'Fashion',
    'Tech'
  ];
  List<String> tags = [];

  create(String imageurl) async {
    String name = getRandomNames().toString();
    await FirebaseFirestore.instance.collection('social media').doc(name).set({
      "allpost": ["hello", "bro"],
      "name": getRandomNames().toString(),
      "commends": 5,
      "followers": 600,
      "like": 800,
      "live": false,
      "livevideo": "htttps",
      "location": "madras",
      "post": imageurl,
      "profilephoto":
          "https://firebasestorage.googleapis.com/v0/b/socialmedia-4b865.appspot.com/o/pp3.jpg?alt=media&token=03d69d01-2e6a-487c-b8c5-b53676e3e1ae",
      "viewscount": "1.5k",
      "video": {
        "comments": 200,
        "like": "100k",
        "topic": "car Draft",
        "videocount": "500k",
        "videolink": "https"
      }
    });
    Get.snackbar(
      "Post", // Title of the snackbar
      "Post Upload Successfully", // Message of the snackbar
      snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
      duration: const Duration(seconds: 3), // Duration to show the snackbar
      backgroundColor: Colors.red, // Background color of the snackbar
      colorText: Colors.white, // Text color of the snackbar
      borderRadius: 10.0, // Border radius of the snackbar
    );
    print('data update successfully');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              LandingPage(email: 'sridhar@gmail.com', username: 'sh'),
        ));
  }

  Future<void> _uploadImages() async {
    for (var i = 0; i < _imageFiles.length; i++) {
      File imageFile = _imageFiles[i];
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference =
          FirebaseStorage.instance.ref().child('images/$fileName.jpg');
      UploadTask uploadTask = reference.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      print(downloadUrl);
      print('Image $i uploaded successfully!');
      if (i == 0) {
        print("import the url");
        create(downloadUrl);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 35, 35),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LandingPage(email: 'sridhar@gmail.com', username: 'sh'),
                  ));
            },
            icon: const Icon(Icons.keyboard_arrow_left)),
        elevation: 0,
        centerTitle: true,
        title: const Text('Submit Post'),
        backgroundColor: const Color.fromARGB(255, 36, 35, 35),
        actions: [
          TextButton(
              onPressed: () {
                if (_imageFiles.isNotEmpty) {
                  _uploadImages();
                } else {
                  Get.snackbar(
                    "Error", // Title of the snackbar
                    "Images not Selected", // Message of the snackbar
                    snackPosition:
                        SnackPosition.BOTTOM, // Position of the snackbar
                    duration: const Duration(
                        seconds: 3), // Duration to show the snackbar
                    backgroundColor:
                        Colors.red, // Background color of the snackbar
                    colorText: Colors.white, // Text color of the snackbar
                    borderRadius: 10.0, // Border radius of the snackbar
                  );
                }
              },
              child: const Text(
                "Done",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GlassContainer(
                  height: height * 0.35,
                  width: width,
                  borderRadius: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AdvanceGlassContainer(
                          height: height * 0.065,
                          width: width,
                          borderRadius: 0,
                          child: TextFormField(
                            key: const ValueKey('Heading'),
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: " Heading Text",
                                hintStyle: TextStyle(color: Colors.grey)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Fill the heading Text';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                print('username is  $value');
                              });
                            },
                          ),
                        ),
                        AdvanceGlassContainer(
                          height: height * 0.2,
                          width: width,
                          borderRadius: 0,
                          child: TextFormField(
                            maxLength: null,
                            maxLines: null,
                            key: const ValueKey('disc'),
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: " Type Description",
                                hintStyle: TextStyle(color: Colors.grey)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Fill the Description ';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                print('username is  $value');
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: height * 0.025,
              ),
              GlassContainer(
                  height: height * 0.1,
                  width: width,
                  borderRadius: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          'Location',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(
                          width: width * 0.35,
                        ),
                        const Expanded(
                            child: TextField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              hintText: " Location",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ))
                      ],
                    ),
                  )),
              SizedBox(
                height: height * 0.025,
              ),
              GlassContainer(
                  height: height * 0.2,
                  width: width,
                  borderRadius: 8,
                  child: _imageFiles.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _imageFiles.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.file(
                                  _imageFiles[index],
                                  height: 60,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            _pickImages();
                          },
                          child: Image.network(
                            'https://img.icons8.com/carbon-copy/100/FFFFFF/plus-2-math.png',
                            width: 100,
                            height: 100,
                          ),
                        )),
              SizedBox(
                height: height * 0.025,
              ),
              GlassContainer(
                  height: height * 0.24,
                  width: width,
                  borderRadius: 16,
                  child: Column(
                    children: [
                      ChipsChoice<String>.multiple(
                        spinnerColor: Colors.white,
                        value: tags,
                        onChanged: (val) => setState(() => tags = val),
                        choiceItems: C2Choice.listFrom<String, String>(
                          source: options,
                          value: (i, v) => v,
                          label: (i, v) => v,
                        ),
                        wrapped: true,
                        choiceStyle: C2ChipStyle.filled(
                          foregroundStyle: const TextStyle(
                              fontSize: 18, color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          selectedStyle: C2ChipStyle.filled(),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
