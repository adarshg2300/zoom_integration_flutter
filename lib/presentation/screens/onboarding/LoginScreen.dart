import 'package:flutter/material.dart';
import 'package:zoom_sdk_flutter/res/assets/image_assets.dart';
import 'package:zoom_sdk_flutter/res/component/comman_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileController = TextEditingController();
  String countryCode = '+91'; // Default country code
  bool isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    // Listen to changes in the text field to enable/disable the button
    mobileController.addListener(() {
      setState(() {
        isButtonDisabled = mobileController.text.length < 10;
      });
    });
  }

  // Method to open country code selection dialog
  Future<void> _selectCountryCode() async {
    final selectedCountryCode = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Country Code'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  title: Text('+91'),
                  onTap: () {
                    Navigator.pop(context, '+91');
                  },
                ),
                ListTile(
                  title: Text('+1'),
                  onTap: () {
                    Navigator.pop(context, '+1');
                  },
                ),
                // Add more ListTile for other country codes
              ],
            ),
          ),
        );
      },
    );

    if (selectedCountryCode != null) {
      setState(() {
        countryCode = selectedCountryCode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            CommonWidgets.buildBackgroundImage(
              ImageAssets.tutorialFirst,
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 100),
                    // Let's get started text widget
                    Center(
                      child: Text(
                        "Let's get started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Please enter your mobile number to continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Please enter your mobile number edit field
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey), // White border
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        height: 55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: _selectCountryCode, // Open country code selection dialog
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  countryCode,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              height: double.infinity,
                              margin: EdgeInsets.only(top: 18,bottom: 18 ,right: 10),
                              color: Colors.grey, // Gray vertical line
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: mobileController,
                                keyboardType: TextInputType.phone,
                                maxLength: 10, // Maximum length of 10 digits
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  hintText: 'Enter your mobile number',
                                  hintStyle: TextStyle(color: Colors.grey), // Hint text color
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(vertical: 1), // Vertical content padding
                                  counterText: '', // Remove text input counter
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Button to proceed
                    Container(
                      margin: EdgeInsets.only(left: 38,right: 38,top: 5),
                      child: ElevatedButton(
                        onPressed: isButtonDisabled ? null : () {
                          Fluttertoast.showToast(msg: "Phone button clicked\nCountry Code: $countryCode\nPhone: ${mobileController.text}");
                          // Proceed with login logic
                          // You can navigate to the next screen or perform any other action here
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(isButtonDisabled ? Colors.grey : Colors.yellow), // Grey color if button is disabled
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'Send OTP',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Text below the button with gray lines and "Sign in with" text and Google logo
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 1,
                                width: 20, // Width of the small line
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'or',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Container(
                                height: 1,
                                width: 20, // Width of the small line
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          // "Sign in with" text
                          Text(
                            'Sign in with',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 15),
                          // Google logo
                          InkWell(
                            onTap: () {
                              Fluttertoast.showToast(msg: "Google logo clicked");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  ImageAssets.google, // Replace 'google_logo.png' with your actual image asset
                                  width: 35,
                                  height: 35,
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
            ),
          ],
        ),
      ),
    );
  }
}
