import 'dart:math';

import 'package:socialmedia/story.dart';

List<String> profilename = [
  "Rio",
  "Alex",
  "Rose",
  "Sridhar",
  "Andrew",
  "Oscar",
];

List<String> profileimage = [
  "assest/pp1.jpg",
  "assest/pp2.jpg",
  "assest/pp3.jpg",
  "assest/pp4.jpg",
  "assest/pp5.jpg",
  "assest/pp6.jpg",
];
final sampleUsers = [
  UserModel([
    StoryModel(
        "https://images.unsplash.com/photo-1601758228041-f3b2795255f1?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    StoryModel(
        "https://images.unsplash.com/photo-1609418426663-8b5c127691f9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    StoryModel(
        "https://images.unsplash.com/photo-1609444074870-2860a9a613e3?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    StoryModel(
        "https://images.unsplash.com/photo-1609504373567-acda19c93dc4?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1MHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ], "Alex",
      "https://firebasestorage.googleapis.com/v0/b/socialmedia-4b865.appspot.com/o/pp6.jpg?alt=media&token=247de435-d8e5-48f2-8dcb-173c71905e13"),
  UserModel([
    StoryModel(
        "https://images.unsplash.com/photo-1609439547168-c973842210e1?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ], "Rose",
      "https://firebasestorage.googleapis.com/v0/b/socialmedia-4b865.appspot.com/o/pp1.jpg?alt=media&token=6bfeb212-b33f-4724-aed0-136e9e5e02ed"),
  UserModel([
    StoryModel(
        "https://images.unsplash.com/photo-1609421139394-8def18a165df?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDl8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    StoryModel(
        "https://images.unsplash.com/photo-1609377375732-7abb74e435d9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxODJ8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    StoryModel(
        "https://images.unsplash.com/photo-1560925978-3169a42619b2?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMjF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ], "Sridhar",
      "https://firebasestorage.googleapis.com/v0/b/socialmedia-4b865.appspot.com/o/pp4.jpg?alt=media&token=7a5429a4-5b5d-43a9-9d4d-56ceccaa6131"),
  UserModel([
    StoryModel(
        "https://images.unsplash.com/photo-1609439547168-c973842210e1?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ], "Andrew",
      "https://firebasestorage.googleapis.com/v0/b/socialmedia-4b865.appspot.com/o/pp1.jpg?alt=media&token=6bfeb212-b33f-4724-aed0-136e9e5e02ed"),
  UserModel([
    StoryModel(
        "https://images.unsplash.com/photo-1609439547168-c973842210e1?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ], "Oscar",
      "https://firebasestorage.googleapis.com/v0/b/socialmedia-4b865.appspot.com/o/pp1.jpg?alt=media&token=6bfeb212-b33f-4724-aed0-136e9e5e02ed"),
];

String getRandomNames() {
  final customerNames = [
    "Sridhar",
    "manohar",
    "maha",
    "Andrew",
    "Scarlett",
    "Gabriel",
    "Avery",
    "Christopher",
    "Sofia",
    "Jackson",
    "Camila",
    "Anthony",
    "Luna",
    "Dylan",
    "Grace",
    "Carter",
    "Chloe",
    "Nathan",
    "Victoria",
    "Thomas",
    "Penelope",
    "Leo",
    "Riley",
    "Luke",
    "Mohammed",
    "Aisha",
    "Ahmed",
    "Fatima",
    "Ali",
    "Zainab",
    "Omar",
    "Safiya",
    "Hassan",
    "Zahra",
    "Ibrahim",
    "Mariam",
    "Yusuf",
    "Khadija",
    "Mustafa",
    "Layla",
    "Vikram",
    "Anaya",
    "Prakash",
    "Diya",
    "Ravi",
    "Kavya",
    "Ashok",
    "Pooja",
    "Arjun",
    "Sneha",
    "Harish",
    "Meera",
    "Gopal",
    "Riya",
    "Rajesh"
  ];
  return customerNames[Random().nextInt(customerNames.length)];
}
