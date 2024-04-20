import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Last updated: 4/7/2024\n\n'
          'At PerfectPick, we are committed to protecting your privacy. This Privacy Policy describes how we collect, use, and share your personal information when you use our Service.\n\n'
          'Information We Collect\n\n'
          'Registration Information: When you register for PerfectPick, we collect your name, email address, and password.\n\n'
          'Preference Information: We collect information about the movies, books, and songs you select to receive personalized recommendations.\n\n'
          'Device Information: We may collect information about the device you use to access the Service, including the device type, operating system, and IP address.\n\n'
          'Use of Information\n\n'
          'We use your information to provide you with personalized recommendations based on your preferences.\n\n'
          'We may use your information to send you communications related to the Service, including updates and notifications.\n\n'
          'In the future, we may use your information to show you personalized advertisements based on your preferences.\n\n'
          'Sharing Information\n\n'
          'We do not sell, rent, or share your personal information with third parties, except in the circumstances described in this Privacy Policy.\n\n'
          'We may share your information with third-party service providers who assist us in operating the Service, subject to confidentiality obligations.\n\n'
          'We may disclose your information if we believe in good faith that such disclosure is necessary to comply with the law, protect our rights, or ensure the safety of our users.\n\n'
          'Data Security\n\n'
          'We implement appropriate technical and organizational security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction.\n\n'
          'Despite our efforts, no security measure is perfect or impenetrable, and we cannot guarantee the absolute security of your information.\n\n'
          'Your Rights\n\n'
          'You can access, correct, update, or delete your personal information by contacting us through the channels provided in the Service.\n\n'
          'You can opt out of receiving promotional communications from PerfectPick by following the unsubscribe instructions provided in such communications.\n\n'
          'Changes to This Privacy Policy\n\n'
          'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on the Service.\n\n'
          'You are advised to review this Privacy Policy periodically for any changes.\n\n'
          'If you have any questions about this Privacy Policy, please contact us through the channels provided in the Service.\n',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
