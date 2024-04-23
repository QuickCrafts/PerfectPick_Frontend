import 'package:flutter/material.dart';
import 'package:perfectpick_wa/auxiliar_functions.dart';
import 'package:perfectpick_wa/data/data_providers/client_declarator.dart';
import 'package:perfectpick_wa/presentation/colors.dart';
import 'package:perfectpick_wa/presentation/widgets/media/mediaList.dart';
import 'package:perfectpick_wa/presentation/widgets/navigation/recomms/recomms_navbar.dart';
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";

class RecommendsLandingPage extends StatefulWidget {
  final AuthRepository authRepository;

  const RecommendsLandingPage({super.key, required this.authRepository});

  @override
  RecommendsLandingPageState createState() => RecommendsLandingPageState();
}

class RecommendsLandingPageState extends State<RecommendsLandingPage> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> keys = {
    "home": GlobalKey(),
    "howItWorks": GlobalKey(),
  };

  AuthRepository get authRepository => widget.authRepository;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 830) {
          return DesktopRecommendsLandingPage(authRepository: authRepository);
        } else {
          return MobileRecommendsLandingPage(authRepository: authRepository);
        }
      },
    );
  }
}

class DesktopRecommendsLandingPage extends StatelessWidget {
  AuthRepository authRepository;
  DesktopRecommendsLandingPage({Key? key, required this.authRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF260629),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.transparent,
          flexibleSpace: RecommendsNavBar(),
        ),
        SliverToBoxAdapter(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 200, right: 200),
                  child: Column(
                    children: [
                      MediaList( authRepository: authRepository),
                    ],
                  ),
                ),
              ),
              // Positioned(
              //   top: 0,
              //   left: 0,
              //   bottom: 0,
              //   child: SingleChildScrollView(
              //     physics: NeverScrollableScrollPhysics(),
              //     child: Container(
              //       width: 200,
              //       child: Column(
              //         children: [
              //           SizedBox(
              //             height: 80,
              //           ),
              //           InkWell(
              //             onTap: () {
              //               try {
              //                 launchAuxiliarURL(
              //                     "https://www.primevideo.com/dp/amzn1.dv.gti.056012bb-4d05-4e2f-8d8c-90cb2a938433?autoplay=0&ref_=atv_cf_strg_wb");
              //               } catch (e) {
              //                 print(e);
              //               }
              //             },
              //             child: ClipRRect(
              //               borderRadius: BorderRadius.circular(12),
              //               child: Image.asset(
              //                 'lib/presentation/images/ESSM_ad.jpg',
              //                 width: 200,
              //                 height: 500,
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Positioned(
              //   top: 0,
              //   right: 0,
              //   bottom: 0,
              //   child: SingleChildScrollView(
              //     physics: NeverScrollableScrollPhysics(),
              //     child: Container(
              //       width: 200,
              //       child: Column(
              //         children: [
              //           SizedBox(
              //             height: 80,
              //           ),
              //           InkWell(
              //             onTap: () {
              //               try {
              //                 launchAuxiliarURL(
              //                     "https://tv.apple.com/us/movie/shutter-island/umc.cmc.1n432wlu275a0640043zypfsj");
              //               } catch (e) {
              //                 print(e);
              //               }
              //             },
              //             child: ClipRRect(
              //               borderRadius: BorderRadius.circular(12),
              //               child: Image.asset(
              //                 "lib/presentation/images/Shutter_ad.jpg",
              //                 width: 200,
              //                 height: 500,
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 20,
              //           ),
              //           // WISHLIST
              //           SizedBox(
              //             height: 20,
              //           ),
              //           ElevatedButton(
              //             onPressed: () async {},
              //             style: ElevatedButton.styleFrom(
              //               minimumSize: Size(140, 16),
              //               backgroundColor: activeColor,
              //               padding: EdgeInsets.symmetric(vertical: 16),
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(12),
              //               ),
              //             ),
              //             child: Text('Recommend me',
              //                 style: TextStyle(
              //                     color: textInsideButtonColor, fontSize: 15)),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ]),
    );
  }
}

class MobileRecommendsLandingPage extends StatelessWidget {

  AuthRepository authRepository;
  MobileRecommendsLandingPage({Key? key, required this.authRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xFF260629),
        body: CustomScrollView(slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: RecommendsNavBar(),
          ),
          SliverToBoxAdapter(
              child: SingleChildScrollView(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                // Column(
                //   children: [
                //     SizedBox(
                //       height: 90,
                //     ),
                //     InkWell(
                //       onTap: () {
                //         try {
                //           launchAuxiliarURL(
                //               "https://www.primevideo.com/dp/amzn1.dv.gti.056012bb-4d05-4e2f-8d8c-90cb2a938433?autoplay=0&ref_=atv_cf_strg_wb");
                //         } catch (e) {
                //           print(e);
                //         }
                //       },
                //       child: Image.asset(
                //         "lib/presentation/images/ESSM_ad.jpg",
                //         width: 200,
                //         height: 500,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //     SizedBox(
                //       height: 90,
                //     ),
                //   ],
                // ),
                Column(
                  children: [
                    // RECOMMENDATIONS GRID
                    MediaList(authRepository: authRepository),
                  ],
                ),
                // Column(children: [
                //   InkWell(
                //     onTap: () {
                //       try {
                //         launchAuxiliarURL(
                //             "https://tv.apple.com/us/movie/shutter-island/umc.cmc.1n432wlu275a0640043zypfsj");
                //       } catch (e) {
                //         print(e);
                //       }
                //     },
                //     child: Image.asset(
                //       "lib/presentation/images/Shutter_ad.jpg",
                //       width: 170,
                //       height: 90,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                //   SizedBox(
                //     height: 20,
                //   ),
                //   // WISHLIST
                //   SizedBox(
                //     height: 20,
                //   ),
                // ])
              ])))
        ]));
  }
}
