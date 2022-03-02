import 'package:cloud_firestore/cloud_firestore.dart';

class FollowingCommunity {
  FollowingCommunity(
      this.id,
      this.title,
      this.contents,
      this.creatorName,
      this.creatorImage,
      this.creatorUniversity,
      this.creatorFaculty,
      this.contentsImageUrl,
      this.createdAt,
      this.updatedAt);
  String id;
  String title;
  String contents;
  String creatorName;
  String creatorImage;
  String creatorUniversity;
  String creatorFaculty;
  String contentsImageUrl;
  Timestamp createdAt;
  Timestamp updatedAt;
}


class CollegeLifeCommunity {
  CollegeLifeCommunity(this.id, this.title, this.contents);
  String id;
  String title;
  String contents;
}

class StudyCommunity {
  StudyCommunity(this.id, this.title, this.contents);
  String id;
  String title;
  String contents;
}

class LectureCommunity {
  LectureCommunity(this.id, this.title, this.contents);
  String id;
  String title;
  String contents;
}

class ClubCommunity {
  ClubCommunity(this.id, this.title, this.contents);
  String id;
  String title;
  String contents;
}

class PartTimeCommunity {
  PartTimeCommunity(this.id, this.title, this.contents);
  String id;
  String title;
  String contents;
}

class InternshipCommunity {
  InternshipCommunity(this.id, this.title, this.contents);
  String id;
  String title;
  String contents;
}

class RecruitCommunity {
  RecruitCommunity(this.id, this.title, this.contents);
  String id;
  String title;
  String contents;
}

class LoveCommunity {
  LoveCommunity(this.id, this.title, this.contents);
  String id;
  String title;
  String contents;
}

class BeautyCommunity {
  BeautyCommunity(this.id, this.title, this.contents);
  String id;
  String title;
  String contents;
}

class HobbyCommunity {
  HobbyCommunity(this.id, this.title, this.contents);
  String id;
  String title;
  String contents;
}

class EntertainmentCommunity {
  EntertainmentCommunity(this.id, this.title, this.contents);
  String id;
  String title;
  String contents;
}

class SportsCommunity {
  SportsCommunity(this.id, this.title, this.contents);
  String id;
  String title;
  String contents;
}

class FoodCommunity {
  FoodCommunity(this.id, this.title, this.contents);
  String id;
  String title;
  String contents;
}
