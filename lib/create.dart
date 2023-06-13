import 'package:cloud_firestore/cloud_firestore.dart';

create() async {
  await FirebaseFirestore.instance.collection('social media').doc('Mio').set({
    "allpost": ["hello", "bro"],
    "commends": 5,
    "followers": 600,
    "like": 800,
    "live": false,
    "livevideo": "htttps",
    "location": "thanjai",
    "post": "hello",
    "profilephoto": "photo",
    "viewscount": "1.5k",
    "video": {
      "comments": 200,
      "like": "100k",
      "topic": "car Draft",
      "videocount": "500k",
      "videolink": "https"
    }
  });
  print('data update successfully');
}
