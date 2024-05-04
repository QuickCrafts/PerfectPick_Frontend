import 'package:flutter/material.dart';
import "package:perfectpick_wa/presentation/colors.dart";

class RecommendsNavBar extends StatelessWidget {

  const RecommendsNavBar({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 830) {
          return DesktopRecommendsNavBar();
        } else {
          return MobileRecommendsNavBar();
        }
      },
    );
  }
}

class DesktopRecommendsNavBar extends StatelessWidget {

  const DesktopRecommendsNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color:
            Color.fromRGBO(38, 6, 41, 0.5), // Updated color to match the image
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          InkWell(
            onTap: () {
            },
            child: Image.asset(
              "lib/presentation/images/PerfectPickName.png",
              width: 201,
              height: 24,
            ),
          ),
          Spacer(),
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.account_circle, color: activeColor),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class MobileRecommendsNavBar extends StatelessWidget {

  const MobileRecommendsNavBar({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 800,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color.fromRGBO(38, 6, 41, 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  "lib/presentation/images/PerfectPickStar.png",
                  width: 35,
                  height: 35,
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                iconSize: 35,
                icon: Icon(Icons.account_circle, color: activeColor),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
