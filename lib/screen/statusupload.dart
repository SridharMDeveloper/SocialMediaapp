import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialmedia/screen/homepage.dart';
import 'package:socialmedia/story.dart';
import 'package:socialmedia/widgest/const.dart';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

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

  Future<void> _uploadImages() async {
    List<String> downloadUrls = [];

    for (var i = 0; i < _imageFiles.length; i++) {
      File imageFile = _imageFiles[i];
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference =
          FirebaseStorage.instance.ref().child('images/$fileName.jpg');
      UploadTask uploadTask = reference.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      print(downloadUrl);
      downloadUrls.add(downloadUrl);

      print('Image $i uploaded successfully!');
    }

    // Join the downloadUrls list into a single string using a delimiter
    String imageUrlList = downloadUrls.join(',');

    // Create a new StoryModel instance with the joined imageUrlList
    StoryModel story = StoryModel(imageUrlList);

    // Now you can use the story object as needed, e.g., pass it to the UserModel constructor

    sampleUsers.add(UserModel([story], getRandomNames().toString(),
        "https://firebasestorage.googleapis.com/v0/b/socialmedia-4b865.appspot.com/o/pp1.jpg?alt=media&token=6bfeb212-b33f-4724-aed0-136e9e5e02ed"));
    print('////////////sssssssssss');
    print(getRandomNames().toString());
    print(sampleUsers);
    print('////////////sssssssssss');
    // Clear the image files list after uploading
    setState(() {
      _imageFiles.clear();
    });

    print('data update successfully');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              LandingPage(email: 'sridhar@gmail.com', username: 'sh'),
        ));
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
        title: const Text('Story'),
        backgroundColor: const Color.fromARGB(255, 36, 35, 35),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _image != null
                ? SizedBox(
                    height: height * 0.77,
                    width: width,
                    child: Image.file(
                      _image!,
                      height: height * 0.77,
                      width: width,
                    ),
                  )
                : SizedBox(
                    height: height * 0.77,
                    width: width,
                    child: _imageFiles != null
                        ? Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _imageFiles.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.file(
                                    _imageFiles[index],
                                    height: height * 0.77,
                                    width: width * 0.7,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(),
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => _pickImages(),
                      icon: const Icon(
                        Icons.image,
                        size: 30,
                        color: Colors.white,
                      )),
                  InkWell(
                    onTap: () => _pickImage(ImageSource.camera),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _image != null ? uploadcameraimage() : _uploadImages();
                      },
                      icon: const Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 35,
                        color: Colors.white,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  uploadcameraimage() async {
    print("camera start");
    File imageFile = _image!;
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference =
        FirebaseStorage.instance.ref().child('images/$fileName.jpg');
    UploadTask uploadTask = reference.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    print(downloadUrl);

    StoryModel story = StoryModel(downloadUrl);

    sampleUsers.add(UserModel([story], getRandomNames().toString(),
        "https://firebasestorage.googleapis.com/v0/b/socialmedia-4b865.appspot.com/o/pp1.jpg?alt=media&token=6bfeb212-b33f-4724-aed0-136e9e5e02ed"));
    print('////////////sssssssssss');
    print(getRandomNames().toString());
    print(sampleUsers);
    print('////////////sssssssssss');
    // Clear the image files list after uploading
    setState(() {
      _imageFiles.clear();
    });

    print('data update successfully');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              LandingPage(email: 'sridhar@gmail.com', username: 'sh'),
        ));
  }
}
