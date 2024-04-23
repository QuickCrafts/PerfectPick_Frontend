import 'package:flutter/material.dart';
import "package:perfectpick_wa/presentation/colors.dart";
// Add your other necessary imports here.

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 60),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ inactiveColor, Color.fromRGBO(38, 6, 41,1)],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 217,
                height: 30,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 217,
                        height: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('./lib/presentation/images/PerfectPickName.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Privacy Policy ',
                style: TextStyle(
                  color: textInsideFieldColor,
                  fontSize: 24,
                  fontFamily: 'Noto Sans SC',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Container(
                width: 300,
                height: 60,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: -3,
                      child: SizedBox(
                        width: 300,
                        height: 60,
                        child: Text(
                          'Last updated: 4/22/2024',
                          style: TextStyle(
                            color: Color(0xFFE5CC38),
                            fontSize: 16,
                            fontFamily: 'Noto Sans SC',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 78,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 17,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: -3,
                            child: SizedBox(
                              width: 300,
                              child: Text(
                                'Information We Collect',
                                style: TextStyle(
                                  color: Color(0xFFE625A7),
                                  fontSize: 16,
                                  fontFamily: 'Noto Sans SC',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 1164,
                      height: 51,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 2,
                            child: SizedBox(
                              width: 1164,
                              child: Text(
                                'Registration Information: When you register for PerfectPick, we collect your name, email address, and password. Preference Information: We collect information about the movies, books, and songs you select to receive personalized recommendations.Device Information: We may collect information about the device you use to access the Service, including the device type, operating system, and IP address.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Noto Sans SC',
                                  fontWeight: FontWeight.w300,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 78,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 17,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: -3,
                            child: SizedBox(
                              width: 300,
                              child: Text(
                                'Subtitle Item',
                                style: TextStyle(
                                  color: Color(0xFFE625A7),
                                  fontSize: 16,
                                  fontFamily: 'Noto Sans SC',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 1164,
                      height: 51,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 2,
                            child: SizedBox(
                              width: 1164,
                              child: Text(
                                'Lorem impsu darm dolor lorem.Lorem impsu darm dolor lorem. Lorem impsu darm dolor lorem. Lorem impsu darm dolor lorem. Lorem impsu darm dolor lorem.  Lorem impsu darm dolor lorem.Lorem impsu darm dolor lorem.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Noto Sans SC',
                                  fontWeight: FontWeight.w300,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 78,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 17,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: -3,
                            child: SizedBox(
                              width: 300,
                              child: Text(
                                'Subtitle Item',
                                style: TextStyle(
                                  color: Color(0xFFE625A7),
                                  fontSize: 16,
                                  fontFamily: 'Noto Sans SC',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 1164,
                      height: 51,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 2,
                            child: SizedBox(
                              width: 1164,
                              child: Text(
                                'Lorem impsu darm dolor lorem.Lorem impsu darm dolor lorem. Lorem impsu darm dolor lorem. Lorem impsu darm dolor lorem. Lorem impsu darm dolor lorem.  Lorem impsu darm dolor lorem.Lorem impsu darm dolor lorem.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Noto Sans SC',
                                  fontWeight: FontWeight.w300,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 78,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 17,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: -3,
                            child: SizedBox(
                              width: 300,
                              child: Text(
                                'Subtitle Item',
                                style: TextStyle(
                                  color: Color(0xFFE625A7),
                                  fontSize: 16,
                                  fontFamily: 'Noto Sans SC',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 1164,
                      height: 51,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 2,
                            child: SizedBox(
                              width: 1164,
                              child: Text(
                                'Lorem impsu darm dolor lorem.Lorem impsu darm dolor lorem. Lorem impsu darm dolor lorem. Lorem impsu darm dolor lorem. Lorem impsu darm dolor lorem.  Lorem impsu darm dolor lorem.Lorem impsu darm dolor lorem.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Noto Sans SC',
                                  fontWeight: FontWeight.w300,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 78,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 17,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: -3,
                            child: SizedBox(
                              width: 300,
                              child: Text(
                                'Subtitle Item',
                                style: TextStyle(
                                  color: Color(0xFFE625A7),
                                  fontSize: 16,
                                  fontFamily: 'Noto Sans SC',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 1164,
                      height: 51,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 2,
                            child: SizedBox(
                              width: 1164,
                              child: Text(
                                'Lorem impsu darm dolor lorem.Lorem impsu darm dolor lorem. Lorem impsu darm dolor lorem. Lorem impsu darm dolor lorem. Lorem impsu darm dolor lorem.  Lorem impsu darm dolor lorem.Lorem impsu darm dolor lorem.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Noto Sans SC',
                                  fontWeight: FontWeight.w300,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 78,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 17,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: -3,
                            child: SizedBox(
                              width: 300,
                              child: Text(
                                'Subtitle Item',
                                style: TextStyle(
                                  color: Color(0xFFE625A7),
                                  fontSize: 16,
                                  fontFamily: 'Noto Sans SC',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 1164,
                      height: 51,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 2,
                            child: SizedBox(
                              width: 1164,
                              child: Text(
                                'Lorem impsu darm dolor lorem.Lorem impsu darm dolor lorem. Lorem impsu darm dolor lorem. Lorem impsu darm dolor lorem. Lorem impsu darm dolor lorem.  Lorem impsu darm dolor lorem.Lorem impsu darm dolor lorem.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Noto Sans SC',
                                  fontWeight: FontWeight.w300,
                                  height: 0,
                                ),
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
    );
  }
}