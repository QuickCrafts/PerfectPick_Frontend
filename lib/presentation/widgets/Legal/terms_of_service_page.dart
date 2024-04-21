import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms of Service"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Last updated: 4/7/2024\n\n'
          'Welcome to PerfectPick, an application and website (hereinafter, "the Service") that provides personalized recommendations for movies, books, and songs based on user preferences. By registering and using PerfectPick, you agree to comply with the following terms of service:\n\n'
          'Registration and Account\n\n'
          'To access certain features of our platform, it is necessary to register and create an account. By registering, you agree to provide truthful and complete information and to keep that information up to date.\n\n'
          'You are responsible for maintaining the confidentiality of your password and for all activities that occur under your account. You must notify us immediately of any unauthorized use of your account.\n\n'
          'Use of Services\n\n'
          'PerfectPick allows you to select movies, books, and songs of your interest to receive personalized recommendations.\n\n'
          'You agree to use PerfectPick only for personal and non-commercial purposes.\n\n'
          'Intellectual Property\n\n'
          'All content on PerfectPick, including text, graphics, logos, and software, is the property of PerfectPick or is used under license and is protected by intellectual property laws.\n\n'
          'You are granted a limited, non-exclusive, and revocable license to access and use PerfectPick in accordance with these Terms of Service.\n\n'
          'Privacy and Personal Data\n\n'
          'The privacy of our users is of utmost importance. Please refer to our Privacy Policy to understand how we collect, use, and protect your personal information.\n\n'
          'By using PerfectPick, you consent to the processing of your data in accordance with our Privacy Policy, including the use of tracking technologies and the personalization of advertisements based on your interests.\n\n'
          'Modifications to the Terms\n\n'
          'We reserve the right to modify these Terms of Service at any time. Any changes will be effective immediately after they are posted on our platform. Your continued use of PerfectPick constitutes your acceptance of such changes.\n\n'
          'Limitation of Liability\n\n'
          'PerfectPick is provided "as is" and "as available". We do not guarantee that our platform will be error-free or uninterrupted. To the maximum extent permitted by law, we will not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use or inability to use PerfectPick.\n\n'
          'Applicable Law\n\n'
          'These Terms of Service shall be governed and construed in accordance with the laws of Colombia. Any dispute related to these terms shall be subject to the exclusive jurisdiction of the courts of Colombia.\n\n'
          'Contact\n\n'
          'If you have questions about these Terms of Service, please contact us at info@perfectpick.something.\n',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
