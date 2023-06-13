// To parse this JSON data, do
//
//     final firebasedata = firebasedataFromJson(jsonString);

import 'dart:convert';

Firebasedata firebasedataFromJson(String str) =>
    Firebasedata.fromJson(json.decode(str));

String firebasedataToJson(Firebasedata data) => json.encode(data.toJson());

class Firebasedata {
  Firebasedata({
    required this.allpost,
    required this.name,
    required this.commends,
    required this.followers,
    required this.like,
    required this.live,
    required this.livevideo,
    required this.location,
    required this.post,
    required this.profilephoto,
    required this.viewscount,
    required this.video,
  });

  List<String> allpost;
  String name;
  int commends;
  int followers;
  int like;
  bool live;
  String livevideo;
  String location;
  String post;
  String profilephoto;
  String viewscount;
  Video video;

  factory Firebasedata.fromJson(Map<String, dynamic> json) => Firebasedata(
        allpost: List<String>.from(json["allpost"].map((x) => x)),
        name: json["name"],
        commends: json["commends"],
        followers: json["followers"],
        like: json["like"],
        live: json["live"],
        livevideo: json["livevideo"],
        location: json["location"],
        post: json["post"],
        profilephoto: json["profilephoto"],
        viewscount: json["viewscount"],
        video: Video.fromJson(json["video"]),
      );

  Map<String, dynamic> toJson() => {
        "allpost": List<dynamic>.from(allpost.map((x) => x)),
        "name": name,
        "commends": commends,
        "followers": followers,
        "like": like,
        "live": live,
        "livevideo": livevideo,
        "location": location,
        "post": post,
        "profilephoto": profilephoto,
        "viewscount": viewscount,
        "video": video.toJson(),
      };
}

class Video {
  Video({
    required this.videocomments,
    required this.videolike,
    required this.videotopic,
    required this.videocount,
    required this.videolink,
  });

  int videocomments;
  String videolike;
  String videotopic;
  String videocount;
  String videolink;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        videocomments: json["comments"],
        videolike: json["like"],
        videotopic: json["topic"],
        videocount: json["videocount"],
        videolink: json["videolink"],
      );

  Map<String, dynamic> toJson() => {
        "comments": videocomments,
        "like": videolike,
        "topic": videotopic,
        "videocount": videocount,
        "videolink": videolink,
      };
}
