import 'package:flutter/material.dart';

class ButtonsLikes extends StatefulWidget {
  final int userID;
  final String mediaType;
  final String mediaID;

  const ButtonsLikes({
    super.key,
    required this.userID,
    required this.mediaType,
    required this.mediaID,
  });

  @override
  ButtonsLikesState createState() => ButtonsLikesState();
}

class ButtonsLikesState extends State<ButtonsLikes> {
  bool inWishlist = false;
  bool isLike = false;
  bool isDislike = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Row(children: <Widget>[
          Center(
              child: Ink(
            decoration: const ShapeDecoration(
                shape: CircleBorder(), color: Color.fromRGBO(38, 6, 41, 1)),
            child: IconButton(
              onPressed: () {
                setState(() {
                  inWishlist = !inWishlist;
                });
              },
              tooltip: "Save to wishlist",
              icon: const Icon(Icons.bookmark),
              color: inWishlist
                  ? Color.fromRGBO(229, 204, 56, 1)
                  : Color.fromRGBO(127, 124, 124, 1),
            ),
          )),
          Spacer(),
          Center(
              child: Ink(
            decoration: const ShapeDecoration(
                shape: CircleBorder(), color: Color.fromRGBO(38, 6, 41, 1)),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isLike = !isLike;
                });
              },
              tooltip: "Like",
              icon: const Icon(Icons.favorite),
              color: isLike
                  ? Color.fromRGBO(230, 37, 167, 1)
                  : Color.fromRGBO(127, 124, 124, 1),
            ),
          )),
          SizedBox(width: 20),
          Center(
              child: Ink(
            decoration: const ShapeDecoration(
                shape: CircleBorder(), color: Color.fromRGBO(38, 6, 41, 1)),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isDislike = !isDislike;
                });
              },
              tooltip: "Dislike",
              icon: const Icon(Icons.thumb_down),
              color: isDislike
                  ? Color.fromRGBO(230, 37, 167, 1)
                  : Color.fromRGBO(127, 124, 124, 1),
            ),
          )),
        ]));
  }
}
