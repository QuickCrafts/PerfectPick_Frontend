import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perfectpick_wa/data/models/media/media_models.dart';
import 'package:perfectpick_wa/data/repositories/auth/media_repository.dart';
import "package:perfectpick_wa/presentation/colors.dart";
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class MediaList extends StatelessWidget {
  final MediaRepository mediaRepository;

  const MediaList({required this.mediaRepository});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 830) {
          return DesktopMediaList(mediaRepository: mediaRepository);
        } else {
          return MobileMediaList(mediaRepository: mediaRepository);
        }
      },
    );
  }
}

const faqsList = [
  ' What is PerfectPick?',
  ' PerfectPick is an application that provides personalized recommendations for movies, books, and songs based on your favorites. By selecting your preferred entertainment, our algorithm suggests new titles tailored to your taste.',
  ' How do I get started with PerfectPick?',
  ' To begin using PerfectPick, you first need to create an account. Once registered, you can start selecting your favorite movies, books, and songs. Our algorithm will then generate recommendations based on your choices.',
  ' Is it free to use PerfectPick?',
  ' Yes, PerfectPick is completely free to use. You can create an account, select your favorites, and receive recommendations at no cost.',
  ' How does the recommendation algorithm work?',
  ' Our recommendation algorithm analyzes your favorite movies, books, and songs to identify patterns and similarities. It then uses this information to suggest new titles that align with your preferences. The more favorites you provide, the more accurate the recommendations become.',
  ' Can I update my favorite selections?',
  ' Absolutely! You can add, remove, or modify your favorite movies, books, and songs at any time. Simply navigate to your profile settings and make the desired changes. Our algorithm will adjust the recommendations accordingly.',
  ' Are my favorite selections and recommendations private?',
  ' Yes, your favorite selections and the recommendations provided by PerfectPick are private and visible only to you. We respect your privacy and do not share your personal information or preferences with any third parties.',
  ' How diverse are the recommendations?',
  ' PerfectPick strives to provide a wide range of recommendations based on your favorites. Our algorithm considers various genres, themes, and styles to suggest a diverse selection of movies, books, and songs that you may enjoy.',
  ' Can I share my recommendations with friends?',
  ' While there is currently no built-in sharing feature, you can easily share your recommendations with friends by copying and pasting the titles or links. We are continuously working on improving PerfectPick and may introduce a sharing feature in future updates.',
  ' Is PerfectPick available on multiple devices?',
  ' Yes, PerfectPick is accessible through a web browser on any device with an internet connection. Whether you\'re using a computer, smartphone, or tablet, you can access your account and recommendations seamlessly.',
  ' How can I provide feedback or report an issue?',
  ' We value your feedback and are committed to improving PerfectPick. If you have any suggestions, questions, or encounter any issues, please contact our support team at info@perfectpick.something. We appreciate your input and will do our best to assist you promptly.'
];

class MyState extends ChangeNotifier {
  var isExpanded = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  void toggleExpansion(pos) {
    isExpanded[pos] = !isExpanded[pos];
    notifyListeners();
  }
}

class MobileMediaList extends StatelessWidget {
  final MediaRepository mediaRepository;

  const MobileMediaList({Key? key, required this.mediaRepository})
      : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      height: 752,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(),
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'chevron-left',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(230, 37, 167, 1),
                                          fontFamily: 'Font Awesome 6 Free',
                                          fontSize: 24,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Movies',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(230, 37, 167, 1),
                                          fontFamily: 'Noto Sans SC',
                                          fontSize: 24,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(38, 6, 41, 1),
                                        border: Border.all(
                                          color:
                                              Color.fromRGBO(230, 37, 167, 1),
                                          width: 1,
                                        ),
                                      ),
                                    ),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DesktopMediaList extends StatelessWidget {
  final MediaRepository mediaRepository;

  const DesktopMediaList({Key? key, required this.mediaRepository})
      : super(key: key);

  Widget build(BuildContext context) {
    // final listBooks = mediaRepository.getBooks();
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color:
            Color.fromRGBO(38, 6, 41, 0.5), // Updated color to match the image
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 38),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Tell us what you like ...',
                    style: TextStyle(
                        color: secondaryMain,
                        fontFamily: 'Noto Sans SC',
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Like or dislike at least three elements of each list. If you want, you can save them to your wishlist.",
                    style: TextStyle(
                        color: textInsideFieldColor,
                        fontFamily: 'Noto Sans SC',
                        fontSize: 20),
                    textAlign: TextAlign.left,
                  )
                ],
              )),
          SizedBox(height: 30),
          SizedBox(
            height: 500,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 300,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(38, 6, 41, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            // image: AssetImage(mediaList[index].image),
                            image: NetworkImage("https://via.placeholder.com/150"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              // mediaList[index].title,
                              "Title",
                              style: TextStyle(
                                  color: textInsideFieldColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              // mediaList[index].author,
                              "Author",
                              style: TextStyle(
                                  color: textInsideFieldColor, fontSize: 15),
                            ),
                            SizedBox(height: 5),
                            Text(
                              // mediaList[index].genre,
                              "Genre",
                              style: TextStyle(
                                  color: textInsideFieldColor, fontSize: 15),
                            ),
                            SizedBox(height: 5),
                            Text(
                              // mediaList[index].year,
                              "Year",
                              style: TextStyle(
                                  color: textInsideFieldColor, fontSize: 15),
                            ),
                            SizedBox(height: 5),
                            Text(
                              // mediaList[index].rating,
                              "Rating",
                              style: TextStyle(
                                  color: textInsideFieldColor, fontSize: 15),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          
          ),
          GestureDetector(
            onTap: () {
              Provider.of<MyState>(context, listen: false).toggleExpansion(0);
            },
            child: Consumer<MyState>(builder: (context, state, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 38),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: inactiveColor,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          faqsList[0],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  if (state.isExpanded[0])
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 38),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          faqsList[1],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                ],
              );
            }),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Provider.of<MyState>(context, listen: false).toggleExpansion(1);
            },
            child: Consumer<MyState>(builder: (context, state, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 38),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: inactiveColor,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          faqsList[2],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  if (state.isExpanded[1])
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 38),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          faqsList[3],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                ],
              );
            }),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Provider.of<MyState>(context, listen: false).toggleExpansion(2);
            },
            child: Consumer<MyState>(builder: (context, state, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 38),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: inactiveColor,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          faqsList[4],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  if (state.isExpanded[2])
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 38),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          faqsList[5],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                ],
              );
            }),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Provider.of<MyState>(context, listen: false).toggleExpansion(3);
            },
            child: Consumer<MyState>(builder: (context, state, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 38),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: inactiveColor,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          faqsList[6],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  if (state.isExpanded[3])
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 38),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          faqsList[7],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                ],
              );
            }),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Provider.of<MyState>(context, listen: false).toggleExpansion(4);
            },
            child: Consumer<MyState>(builder: (context, state, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 38),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: inactiveColor,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          faqsList[8],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  if (state.isExpanded[4])
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 38),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          faqsList[9],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                ],
              );
            }),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Provider.of<MyState>(context, listen: false).toggleExpansion(5);
            },
            child: Consumer<MyState>(builder: (context, state, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 38),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: inactiveColor,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          faqsList[10],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  if (state.isExpanded[5])
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 38),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          faqsList[11],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                ],
              );
            }),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Provider.of<MyState>(context, listen: false).toggleExpansion(6);
            },
            child: Consumer<MyState>(builder: (context, state, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 38),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: inactiveColor,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          faqsList[12],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  if (state.isExpanded[6])
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 38),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          faqsList[13],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                ],
              );
            }),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Provider.of<MyState>(context, listen: false).toggleExpansion(7);
            },
            child: Consumer<MyState>(builder: (context, state, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 38),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: inactiveColor,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          faqsList[14],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  if (state.isExpanded[7])
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 38),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          faqsList[15],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                ],
              );
            }),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Provider.of<MyState>(context, listen: false).toggleExpansion(8);
            },
            child: Consumer<MyState>(builder: (context, state, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 38),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: inactiveColor,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          faqsList[16],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  if (state.isExpanded[8])
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 38),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          faqsList[17],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                ],
              );
            }),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Provider.of<MyState>(context, listen: false).toggleExpansion(9);
            },
            child: Consumer<MyState>(builder: (context, state, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 38),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: inactiveColor,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          faqsList[18],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  if (state.isExpanded[9])
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 38),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          faqsList[19],
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20),
                        ),
                      ),
                    ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
