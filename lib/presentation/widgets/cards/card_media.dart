import 'package:flutter/material.dart';
import 'package:perfectpick_wa/presentation/widgets/cards/buttons_likes.dart';
import 'package:perfectpick_wa/presentation/widgets/cards/rating.dart';

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
  int userID = 0;
  String name = '';
  String genre = '';
  String author = '';
  String mediaType = 'SON'; //'SON' | 'BOO' | 'MOV'
  String mediaID = '';

  @override
  initState() {
    super.initState();
    userID = widget.userID;
    name = widget.name;
    genre = widget.genre;
    author = widget.author;
    mediaType = widget.mediaType;
    mediaID = widget.mediaID;
  }

  @override
  Widget build(BuildContext context) {
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
                        Icons.videocam,
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
                    userID: userID, mediaType: mediaType, mediaID: mediaID),
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
                                Row(
                                  children: [
                                    Text(
                                      name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Noto Sans SC',
                                        height: 0,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: 5),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      genre,
                                      style: TextStyle(
                                        color: Color(0xFFE5CC38),
                                        fontSize: 14,
                                        fontFamily: 'Noto Sans SC',
                                        height: 0,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      author,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Noto Sans SC',
                                        height: 0,
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
                                userID: userID,
                                mediaID: mediaID,
                                mediaType: mediaType,
                                rateInput: true), //todo RateInput if loggedin
                            Spacer(),
                            Icon(
                              Icons.videocam,
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
