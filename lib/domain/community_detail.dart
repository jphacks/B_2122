import 'package:cloud_firestore/cloud_firestore.dart';

class FollowingCommunityDetail {
  FollowingCommunityDetail(this.id,this.senderName,this.message,this.createdAt,this.senderImageUrl,this.senderUniversity,this.senderFaculty);
  String id;
  String senderName;
  String message;
  Timestamp createdAt;
  String senderImageUrl;
  String senderUniversity;
  String senderFaculty;
}

class CollegeLifeCommunityDetail {
  CollegeLifeCommunityDetail(this.id,this.sender_name,this.message);
  String id;
  String sender_name;
  String message;
}

class StudyCommunityDetail {
  StudyCommunityDetail(this.id,this.sender_name,this.message);
  String id;
  String sender_name;
  String message;
}

class LectureCommunityDetail {
  LectureCommunityDetail(this.id,this.sender_name,this.message);
  String id;
  String sender_name;
  String message;
}

class ClubCommunityDetail {
  ClubCommunityDetail(this.id,this.sender_name,this.message);
  String id;
  String sender_name;
  String message;
}

class PartTimeCommunityDetail {
  PartTimeCommunityDetail(this.id,this.sender_name,this.message);
  String id;
  String sender_name;
  String message;
}

class InternshipCommunityDetail {
  InternshipCommunityDetail(this.id,this.sender_name,this.message);
  String id;
  String sender_name;
  String message;
}

class RecruitCommunityDetail {
  RecruitCommunityDetail(this.id,this.sender_name,this.message);
  String id;
  String sender_name;
  String message;
}

class LoveCommunityDetail {
  LoveCommunityDetail(this.id,this.sender_name,this.message);
  String id;
  String sender_name;
  String message;
}

class BeautyCommunityDetail {
  BeautyCommunityDetail(this.id,this.sender_name,this.message);
  String id;
  String sender_name;
  String message;
}

class HobbyCommunityDetail {
  HobbyCommunityDetail(this.id,this.sender_name,this.message);
  String id;
  String sender_name;
  String message;
}

class EntertainmentCommunityDetail {
  EntertainmentCommunityDetail(this.id,this.sender_name,this.message);
  String id;
  String sender_name;
  String message;
}

class SportsCommunityDetail {
  SportsCommunityDetail(this.id,this.sender_name,this.message);
  String id;
  String sender_name;
  String message;
}

class FoodCommunityDetail {
  FoodCommunityDetail(this.id,this.sender_name,this.message);
  String id;
  String sender_name;
  String message;
}