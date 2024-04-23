import "dart:ui";
import "package:flutter/material.dart";
import "package:perfectpick_wa/presentation/colors.dart";
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";
import "package:perfectpick_wa/auxiliar_functions.dart";
import "package:perfectpick_wa/presentation/widgets/Legal/Privacy_policy_page.dart";
import "package:perfectpick_wa/presentation/widgets/Legal/terms_of_service_page.dart";

class DemoDialog extends StatefulWidget {
  final AuthRepository authRepository;

  const DemoDialog({Key? key, required this.authRepository}) : super(key: key);

  @override
  DemoDialogState createState() => DemoDialogState();
}

class DemoDialogState extends State<DemoDialog> {
  bool _isPasswordHiden = true;
  double _passwordSpacing = 10;
  final loginCompanyNameDataController = TextEditingController();
  final loginEmailDataController = TextEditingController();

  @override
  void dispose() {
    loginCompanyNameDataController.dispose();
    loginEmailDataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Container(
            width: 340,
            height: 465,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 340,
              height: 465,
              decoration: BoxDecoration(
                color: modalBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(
                      height:
                      12), // Added padding to the top of the dialog (16 pixels
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Image.asset(
                      "lib/presentation/images/PerfectPickName.png",
                      width: 262,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 12),
                            Text('Require a Demo',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: modalTitleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                )),
                            SizedBox(height: 20),
                            TextField(
                              controller: loginEmailDataController,
                              cursorColor: activeColor,
                              cursorHeight: 20,
                              style: TextStyle(color: textInsideFieldColor),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 4),
                                labelText: 'Company Name*',
                                labelStyle: TextStyle(color: labelColor),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: activeColor),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: inactiveColor),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: loginCompanyNameDataController,
                              cursorColor: activeColor,
                              cursorHeight: 20,
                              style: TextStyle(
                                  color: textInsideFieldColor,
                                  letterSpacing: _passwordSpacing),
                              obscureText: _isPasswordHiden,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 4),
                                labelText: 'Contact Email*',
                                labelStyle: TextStyle(color: labelColor),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: activeColor),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: inactiveColor),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordHiden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: activeColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordHiden = !_isPasswordHiden;
                                      _passwordSpacing =
                                      _isPasswordHiden ? 10 : 0;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                children: [
                                  Text(
                                    'By selecting Sign up below, I agree to ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: alternativeTextColor,
                                        fontSize: 15),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => TermsOfServicePage()),
                                      );
                                    },
                                    child:
                                    Text(
                                      'Terms of Service ',
                                      style: TextStyle(
                                          color: activeColor,
                                          decoration: TextDecoration.underline,
                                          decorationColor: activeColor),
                                    ),
                                  ),
                                  Text(
                                    'and ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: alternativeTextColor,
                                        fontSize: 15),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                                      );
                                    },
                                    child:
                                    Text(
                                      'Privacy Policy',
                                      style: TextStyle(
                                          color: activeColor,
                                          decoration: TextDecoration.underline,
                                          decorationColor: activeColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Checkbox.width * 1.5,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 78,
                                height: 36,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // Handle login action
                                    String email =
                                        loginEmailDataController.text;
                                    String companyName =
                                        loginCompanyNameDataController.text;
                                    try {
                                      //String token = await widget.authRepository
                                      //    .emailLogin(email, password);
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text('Success'),
                                      //      content: Text('Token: $token'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop();
                                                },
                                                child: Text('Close'),
                                              ),
                                            ],
                                          ));
                                    } catch (e) {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text('Error'),
                                            content: Text('Error: $e'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop();
                                                },
                                                child: Text('Close'),
                                              ),
                                            ],
                                          ));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: activeColor,
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text('Send',
                                      style: TextStyle(
                                          color: textInsideButtonColor)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Checkbox.width * 3,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                children: [
                                  Text(
                                    'We will contact with you soon!',
                                    style:
                                    TextStyle(color: alternativeTextColor),
                                    overflow: TextOverflow.fade,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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