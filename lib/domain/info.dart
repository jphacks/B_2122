import 'package:cloud_firestore/cloud_firestore.dart';

class TopInfo {
  TopInfo(
    this.id,
    this.title,
    this.contents,
    this.writerName,
    this.writerImage,
    this.contentsImageUrl,
    this.createdAt,
    this.updatedAt,
  );
  String id;
  String title;
  String contents;
  String writerName;
  String writerImage;
  String? contentsImageUrl;
  Timestamp createdAt;
  Timestamp updatedAt;
}

class SubInfo {
  SubInfo(
      this.id,
      this.title,
      this.contents,
      this.writerName,
      this.writerImage,
      this.contentsImageUrl,
      this.createdAt,
      this.updatedAt,
      );
  String id;
  String title;
  String contents;
  String writerName;
  String writerImage;
  String? contentsImageUrl;
  Timestamp createdAt;
  Timestamp updatedAt;
}
