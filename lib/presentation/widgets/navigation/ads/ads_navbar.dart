import 'package:flutter/material.dart';
import "package:perfectpick_wa/presentation/colors.dart";
import 'package:perfectpick_wa/presentation/widgets/login/login_modal.dart';
import 'package:perfectpick_wa/presentation/widgets/navigation/how_it_works.dart';
import 'package:perfectpick_wa/presentation/widgets/signUp/signup_modal.dart';
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";

class AdNavBar extends StatelessWidget {
  final Function(String) onSectionSelected;

  const AdNavBar({Key? key, required this.onSectionSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 830) {
          return DesktopAdNavBar(onSectionSelected: (string) {
            onSectionSelected(string);
          });
        } else {
          return MobileAdNavBar(onSectionSelected: (string) {
            onSectionSelected(string);
          });
        }
      },
    );
  }
}

class DesktopAdNavBar extends StatelessWidget {
  final Function(String) onSectionSelected;

  const DesktopAdNavBar({Key? key, 
  required this.onSectionSelected,})
      : super(key: key);

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
            onTap: ()  {
              onSectionSelected("home");
            },
            child: Image.asset(
              "lib/presentation/images/PerfectPickName.png",
              width: 201,
              height: 24,
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              onSectionSelected("home");
            },
            child: Text(
              'Home',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(width: 5),
          TextButton(
            onPressed: () {
              onSectionSelected("howItWorks");
            },
            child: Text(
              'How it works',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
            },
            child: Text(
              'I am Admin',
              style: TextStyle(color: Colors.yellow, fontSize: 18),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class MobileAdNavBar extends StatelessWidget {
  final Function(String) onSectionSelected;

  const MobileAdNavBar({Key? key, required this.onSectionSelected,})
      : super(key: key);
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
                IconButton(
                  iconSize: 35,
                  icon: Icon(Icons.menu, color: activeColor),
                  onPressed: () {
                    showMenu(
                      color: Color.fromRGBO(38, 6, 41, 1),
                      context: context,
                      position: RelativeRect.fromLTRB(0, kToolbarHeight, 0, 0),
                      items: [
                        PopupMenuItem(
                          onTap: () {
                            onSectionSelected("home");
                          },
                          value: 1,
                          child: 
                          Text(
                            'Home', 
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            ),
                        ),
                        PopupMenuItem(
                          onTap: () {
                            onSectionSelected("howItWorks");
                          },
                          value: 2,
                          child: 
                          Text(
                            'How it works',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(width: 5),
              Text("|", style: TextStyle(color: Colors.white, fontSize: 20)),
              SizedBox(width: 5),
              TextButton(
                onPressed: () {
                },
                child: Text(
                  'I am Admin',
                  style: TextStyle(color: Colors.yellow, fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
