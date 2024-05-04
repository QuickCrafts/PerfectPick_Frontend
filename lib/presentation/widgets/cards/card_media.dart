import 'package:flutter/material.dart';
import 'package:perfectpick_wa/business_logic/cubits/auth_verificator.dart';
import 'package:perfectpick_wa/data/data_providers/client_declarator.dart';
import 'package:perfectpick_wa/data/repositories/likes/likes_repository.dart';
import 'package:perfectpick_wa/presentation/widgets/cards/buttons_likes.dart';
import 'package:perfectpick_wa/presentation/widgets/cards/rating.dart';
import 'package:provider/provider.dart';

class CardMedia extends StatefulWidget {
  final int userID;
  final String name;
  final String genre;
  final String author;
  final String mediaType; //'SON' | 'BOO' | 'MOV'
  final String mediaID;

  const CardMedia({
    super.key,
    required this.userID,
    required this.name,
    required this.genre,
    required this.author,
    required this.mediaType,
    required this.mediaID,
  });

  @override
  CardMediaState createState() => CardMediaState();
}

class CardMediaState extends State<CardMedia> {
  final LikesRepository mainLikesRepository =
      LikesRepository(client: graphqlClient.value);

  int userID = 0;
  String name = '';
  String genre = '';
  String author = '';
  String mediaType = 'SON'; //'SON' | 'BOO' | 'MOV'
  String mediaID = '';

  @override
  initState() {
    super.initState();
    name = widget.name;
    genre = widget.genre;
    userID = widget.userID;
    author = widget.author;
    mediaType = widget.mediaType;
    mediaID = widget.mediaID;
  }

  IconData getIcon() {
    if (mediaType == 'SON') return Icons.music_note;
    if (mediaType == 'BOO') return Icons.book;
    return Icons.videocam;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userToken = authProvider.token ?? '';


    return Column(
      children: [
        Container(
          width: 320,
          height: 245,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Color(0xFF260629),
            shadows: [
              BoxShadow(
                color: Color(0xFFF7BEE5),
                blurRadius: 4,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  height: 100,
                  decoration: ShapeDecoration(
                    color: Color(0xFF260629),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        getIcon(),
                        color: Color(0xFF5A0E61),
                        size: 35,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 0,
                width: 280,
                height: 30,
                child: ButtonsLikes(
                    userToken: userToken,
                    userID: userID,
                    mediaType: mediaType,
                    mediaID: mediaID,
                    likesRepository: mainLikesRepository),
              ),
              Container(
                width: double.infinity,
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          top: 15, left: 5, right: 5, bottom: 5),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [
                            Color(0x99E625A7),
                            Color(0x99260629),
                            Color(0xFF260629)
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Noto Sans SC',
                                      height: 0,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 180,
                                      child: Text(
                                        genre,
                                        style: TextStyle(
                                          color: Color(0xFFE5CC38),
                                          fontSize: 14,
                                          fontFamily: 'Noto Sans SC',
                                          height: 0,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        author,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Noto Sans SC',
                                          height: 0,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(children: [
                            Rating(
                                rateInput: true,
                                userToken: userToken,
                                userID: userID,
                                mediaType: mediaType,
                                mediaID: mediaID,
                                likesRepository: mainLikesRepository),
                            Spacer(),
                            Icon(
                              getIcon(),
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
