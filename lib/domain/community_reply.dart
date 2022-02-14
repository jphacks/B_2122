import 'package:cloud_firestore/cloud_firestore.dart';

class CommunityReplyMessage {
  CommunityReplyMessage(this.id,this.replierName,this.replyMessage,this.createdAt,this.replierImageUrl,this.replierUniversity,this.replierFaculty);
  String id;
  String replierName;
  String replyMessage;
  Timestamp createdAt;
  String replierImageUrl;
  String replierUniversity;
  String replierFaculty;
}