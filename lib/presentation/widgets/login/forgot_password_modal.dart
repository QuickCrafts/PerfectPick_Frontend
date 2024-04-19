import "package:flutter/material.dart";
import "package:perfectpick_wa/presentation/colors.dart";
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";
import "package:perfectpick_wa/auxiliar_functions.dart";

class ForgotPasswordDialog extends StatefulWidget {

 const ForgotPasswordDialog()  : super();

  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPasswordDialog> {

  final loginEmailDataController = TextEditingController();
  final loginPasswordDataController = TextEditingController();

  @override
  void dispose() {
    loginEmailDataController.dispose();
    loginPasswordDataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: modalBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: 340,
        height: 340,
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
                      Text('Forgot Password',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: modalTitleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          )),
                      SizedBox(height: 8),
                      TextField(
                        controller: loginEmailDataController,
                        cursorColor: activeColor,
                        cursorHeight: 20,
                        style: TextStyle(color: textInsideFieldColor),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 4),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: labelColor),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: activeColor),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: inactiveColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Checkbox.width * 1.5,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 90,
                          height: 36,
                          child: ElevatedButton(
                            onPressed: () async {
                              // Handle login action
                              String email = loginEmailDataController.text;
                              String password =
                                  loginPasswordDataController.text;
                              
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: activeColor,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text('Send email',
                                style: TextStyle(color: textInsideButtonColor)),
                          ),
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
    );
  }
}
