import 'package:flutter/material.dart';
import 'package:perfectpick_wa/data/repositories/likes/likes_repository.dart';

class Rating extends StatefulWidget {
  final String userToken;
  final int userID;
  final String mediaType;
  final String mediaID;
  final bool rateInput;
  final LikesRepository likesRepository;

  const Rating({
    super.key,
    required this.userToken,
    required this.userID,
    required this.mediaType,
    required this.mediaID,
    required this.rateInput,
    required this.likesRepository,
  });

  @override
  RatingState createState() => RatingState();
}

class RatingState extends State<Rating> {
  bool rateInput = false;
  double rating = 0.0;
  bool star1 = false;
  bool star2 = false;
  bool star3 = false;
  bool star4 = false;
  bool star5 = false;

  @override
  initState() {
    super.initState();
    rateInput = widget.rateInput;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  rating.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Noto Sans SC',
                    height: 0,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '/ 5.0',
                  style: TextStyle(
                    color: Color(0xFF7F7C7C),
                    fontSize: 16,
                    fontFamily: 'Noto Sans SC',
                    height: 0,
                  ),
                ),
              ],
            ),
            Row(children: <Widget>[
              Text(
                'Your rate:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Noto Sans SC',
                  height: 0,
                ),
              ),
              Center(
                  child: IconButton(
                onPressed: () {
                  setState(() {
                    star1 = true;
                    star2 = false;
                    star3 = false;
                    star4 = false;
                    star5 = false;
                  });
                },
                icon: const Icon(Icons.star),
                color: star1
                    ? Color.fromRGBO(229, 204, 56, 1)
                    : Color.fromRGBO(127, 124, 124, 1),
              )),
              Center(
                  child: IconButton(
                onPressed: () {
                  setState(() {
                    star1 = true;
                    star2 = true;
                    star3 = false;
                    star4 = false;
                    star5 = false;
                  });
                },
                icon: const Icon(Icons.star),
                color: star2
                    ? Color.fromRGBO(229, 204, 56, 1)
                    : Color.fromRGBO(127, 124, 124, 1),
              )),
              Center(
                  child: IconButton(
                onPressed: () {
                  setState(() {
                    star1 = true;
                    star2 = true;
                    star3 = true;
                    star4 = false;
                    star5 = false;
                  });
                },
                icon: const Icon(Icons.star),
                color: star3
                    ? Color.fromRGBO(229, 204, 56, 1)
                    : Color.fromRGBO(127, 124, 124, 1),
              )),
              Center(
                  child: IconButton(
                onPressed: () {
                  setState(() {
                    star1 = true;
                    star2 = true;
                    star3 = true;
                    star4 = true;
                    star5 = false;
                  });
                },
                icon: const Icon(Icons.star),
                color: star4
                    ? Color.fromRGBO(229, 204, 56, 1)
                    : Color.fromRGBO(127, 124, 124, 1),
              )),
              Center(
                  child: IconButton(
                onPressed: () {
                  setState(() {
                    star1 = true;
                    star2 = true;
                    star3 = true;
                    star4 = true;
                    star5 = true;
                  });
                },
                icon: const Icon(Icons.star),
                color: star5
                    ? Color.fromRGBO(229, 204, 56, 1)
                    : Color.fromRGBO(127, 124, 124, 1),
              )),
            ])
          ]),
    );
  }
}
