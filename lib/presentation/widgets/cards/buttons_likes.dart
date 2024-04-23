import 'package:flutter/material.dart';
import 'package:perfectpick_wa/data/models/likes/likes_models.dart';
import 'package:perfectpick_wa/data/repositories/likes/likes_repository.dart';

class ButtonsLikes extends StatefulWidget {
  final String userToken;
  final int userID;
  final String mediaType;
  final String mediaID;
  final LikesRepository likesRepository;

  const ButtonsLikes({
    super.key,
    required this.userToken,
    required this.userID,
    required this.mediaType,
    required this.mediaID,
    required this.likesRepository,
  });

  @override
  ButtonsLikesState createState() => ButtonsLikesState();
}

class ButtonsLikesState extends State<ButtonsLikes> {
  bool inWishlist = false;
  bool isLike = false;
  bool isDislike = false;

  @override
  void initState() {
    super.initState();
    checkLikeStatus();
  }

  Future<void> checkLikeStatus() async {
    try {
      SpecificLikeResponseModel likeResponse = await widget.likesRepository
          .getSpecificLike(widget.userToken, widget.userID, widget.mediaID,
              widget.mediaType);

      setState(() {
        if (likeResponse.likeType == 'LK') {
          isLike = true;
          isDislike = false;
        } else if (likeResponse.likeType == 'DLK') {
          isDislike = true;
          isLike = false;
        }
      });
    } catch (e) {
      print('Error getting preference status: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Row(children: <Widget>[
          Center(
              child: Ink(
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color:
                  Color.fromRGBO(66, 39, 79, 1), // Color.fromRGBO(38, 6, 41, 1)
            ),
            child: IconButton(
              // onPressed: () {
              //   setState(() {
              //     inWishlist = !inWishlist;
              //   });
              // },
              onPressed: null,
              tooltip: "Wishlist soon!",
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
                  if (!isDislike) {
                    isLike = !isLike;
                  } else {
                    isDislike = isLike;
                    isLike = !isLike;
                  }
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
                  if (!isLike) {
                    isDislike = !isDislike;
                  } else {
                    isLike = isDislike;
                    isDislike = !isDislike;
                  }
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
