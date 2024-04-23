import 'package:flutter/material.dart';
import 'package:perfectpick_wa/presentation/widgets/navigation/ads/ads_navbar.dart';
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";


class AdsLandingPage extends StatefulWidget {
  final AuthRepository authRepository;

  const AdsLandingPage({super.key, required this.authRepository});

  @override
  AdsLandingPageState createState() => AdsLandingPageState();
}

class AdsLandingPageState extends State<AdsLandingPage> {
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

  void _scrollToSection(String section) {
    final GlobalKey? key = keys[section];
    if (key == null) return;
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF260629),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: AdNavBar(
                onSectionSelected: _scrollToSection),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Home
                  // How it works
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}