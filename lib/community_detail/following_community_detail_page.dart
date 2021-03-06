import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:testapp/domain/community.dart';
import 'package:testapp/community_detail_model/community_detail_page_model.dart';
import 'package:testapp/domain/community_detail.dart';

class FollowingCommunityDetailPage extends StatelessWidget {
  final FollowingCommunity followingCommunity;

  FollowingCommunityDetailPage(this.followingCommunity);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommunityDetailPageModel>(
      create: (_) => CommunityDetailPageModel()
        ..fetchFollowingCommunityDetailList(followingCommunity)
        ..getBooleanValue(followingCommunity.id),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            followingCommunity.contents,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: false,
        ),
        body: Consumer<CommunityDetailPageModel>(
            builder: (context, model, child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Stack(
                      children: [
                        Consumer<CommunityDetailPageModel>(
                          builder: (context, model, child) {
                            final List<FollowingCommunityDetail>?
                                followingCommunityDetails =
                                model.followingCommunityDetails;

                            if (followingCommunityDetails == null) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ],
                              );
                            }

                            //????????????????????????
                            final List<Widget> followingCommunityDetailWidgets =
                                followingCommunityDetails
                                    .map(
                                      (followingCommunityDetails) => Card(
                                        elevation: 0.0,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: CachedNetworkImage(
                                                height: 50,
                                                width: 50,
                                                imageUrl:
                                                    followingCommunityDetails
                                                        .senderImageUrl,
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                placeholder: (context, url) =>
                                                    CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                              title: Text(
                                                followingCommunityDetails
                                                    .senderName,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Text(followingCommunityDetails
                                                      .senderUniversity),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(followingCommunityDetails
                                                      .senderFaculty),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                                followingCommunityDetails
                                                                    .message),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            DateFormat.yMMMd(
                                                                    'ja')
                                                                .format(followingCommunityDetails
                                                                    .createdAt
                                                                    .toDate()),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList();

                            //TODO:??????????????????????????????????????????????????????widget?????????

                            return Column(
                              children: [
                                Card(
                                  child: Column(children: <Widget>[
                                    ListTile(
                                      leading: CachedNetworkImage(
                                        height: 50,
                                        width: 50,
                                        imageUrl:
                                            followingCommunity.creatorImage,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                      title: Text(
                                        followingCommunity.creatorName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text(followingCommunity
                                              .creatorUniversity),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(followingCommunity
                                              .creatorFaculty),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: followingCommunity
                                                  .contentsImageUrl
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal:10.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Text(followingCommunity
                                                          .contents),
                                                    ),
                                                  ]),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        DateFormat.yMMMd('ja')
                                                            .format(
                                                            followingCommunity
                                                                .createdAt
                                                                .toDate()),
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          IconButton(
                                                            onPressed: () async {
                                                              model.bookmark
                                                                  ? await model
                                                                  .deleteBookMark(
                                                                  followingCommunity
                                                                      .id)
                                                                  : await model
                                                                  .createBookMark(
                                                                  followingCommunity
                                                                      .id);
                                                            },
                                                            icon: Icon(
                                                              Icons.bookmark,
                                                              size: 25,
                                                              color: model.bookmark
                                                                  ? Colors.amber
                                                                  : Colors.black12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  elevation: 0.0,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                ListView(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: followingCommunityDetailWidgets,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  color: Colors.white,
                  child: SafeArea(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        border: InputBorder.none,
                        labelText: '????????????????????????',
                        suffixIcon: IconButton(
                          onPressed: () async {
                            //_handleSubmit(_controller.text);

                            await model.addText(_controller.text, followingCommunity.id);
                            await model.fetchFollowingCommunityDetailList(
                                followingCommunity);
                            _controller.text = "";
                          },
                          icon: Icon(Icons.send, size: 20, color: Colors.amber),
                        ),
                      ),
                      controller: _controller,
                      onSubmitted: (String message) async {
                        final db = FirebaseFirestore.instance;
                        final uid = FirebaseAuth.instance.currentUser!.uid;
                        final document = await FirebaseFirestore.instance
                            .collection('users')
                            .doc(uid)
                            .get();

                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;

                        await db
                            .collection("communities")
                            .doc("following_communities")
                            .collection("following_community_details")
                            .doc(followingCommunity.id)
                            .collection('messages')
                            .add({
                          "senderName": data['nickname'],
                          "senderUniversity": data['university'],
                          "senderFaculty": data['faculty'],
                          //TODO:??????????????????????????????????????????????????????
                          //"senderGenderName":data['senderGenderName'],
                          "senderImageUrl": data['photoUrl'],
                          "message": message,
                          "createdAt": DateTime.now()
                        });

                        await model.fetchFollowingCommunityDetailList(
                            followingCommunity);
                        _controller.text = "";
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
                ),
              ]),
            ],
          );
        }),
      ),
    );
  }
}
