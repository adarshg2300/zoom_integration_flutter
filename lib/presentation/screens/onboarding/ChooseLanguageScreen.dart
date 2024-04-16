import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_sdk_flutter/presentation/bloc/language_change_bloc.dart';
import '../../../main.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/component/comman_widget.dart';


class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  _LanguageSelectionScreenState createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  // Define a list of languages with their corresponding images
  List<Map<String, dynamic>> languages = [
    {'name': 'English', 'imagePath': ImageAssets.english,'subName':'Default Language'},
    {'name': 'हिंदी', 'imagePath': ImageAssets.hindi,'subName':'Hindi'},
    {'name': 'ગુજરાતી', 'imagePath': ImageAssets.urdu,'subName':'Gujrati'},
    {'name': 'मराठी', 'imagePath': ImageAssets.urdu,'subName':'Marathi'},
    {'name': 'తెలుగు', 'imagePath': ImageAssets.urdu,'subName':'Kannada'},
    {'name': 'বাংলা', 'imagePath': ImageAssets.urdu,'subName':'Bengali'},
  ];

  // Variable to store the selected language
  late String selectedLanguage;
  final bloc = getIt<LanguageChangeBloc>();
  @override
  void initState() {
    super.initState();
    // Set the default selected language to English
    selectedLanguage = 'English';
  }

  // Method to handle button press and show toast
  void _goTutorial() {
    bloc.navigateToTutorial();
  }

  @override
  Widget build(BuildContext context) {
    bloc.navigateToTutorial1.listen((navigate) {
      if (navigate) {
        Navigator.pushReplacementNamed(context, '/tutorial');
      }
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand, // Ensure background image fills the entire screen
          children: [
            // Background image
            CommonWidgets.buildBackgroundImage(
              ImageAssets.splashBg,
              // Center the column vertically
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, // Align text to the top
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    // First text: Choose your language
                    CommonWidgets.buildText(
                      'Choose your language',
                      24, // Adjust font size responsively
                      FontWeight.bold,
                      Colors.white,
                    ),
                    const SizedBox(height: 2),
                    // Second text: Language for content
                    CommonWidgets.buildText(
                      'Language for content',
                      14, // Adjust font size responsively
                      FontWeight.normal,
                      Colors.white,
                    ),
                    // Language grid list
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(), // Disable scrolling
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Two items per row
                          crossAxisSpacing: 30, // Spacing between items horizontally
                          mainAxisSpacing: 20, // Spacing between rows vertically
                        ),
                        itemCount: languages.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedLanguage = languages[index]['name'];
                              });
                            },
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                AspectRatio(
                                  aspectRatio: 1.0, // Square aspect ratio
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: selectedLanguage == languages[index]['name']
                                          ? Colors.yellow.withOpacity(.9) // Adjust opacity as needed
                                          : Colors.transparent,
                                      border: Border.all(
                                        color: selectedLanguage == languages[index]['name']
                                            ? Colors.transparent
                                            : Colors.grey, // Set border color to grey if not selected
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        // Middle SVG image
                                        CommonWidgets.buildSvgImage(
                                         ImageAssets.hindi,
                                          50, // Adjust image width as needed
                                          50, // Adjust image height as needed
                                        ),
                                        const SizedBox(height: 5),
                                        // First text: Language name
                                        CommonWidgets.buildText(
                                          languages[index]['name'],
                                          16, // Adjust font size as needed
                                          FontWeight.normal,
                                          Colors.white,
                                        ),
                                        // Second text: Additional text
                                        CommonWidgets.buildText(
                                          languages[index]['subName'],
                                          10, // Adjust font size as needed
                                          FontWeight.normal,
                                          Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Third text: Select indicator (if selected)
                                if (selectedLanguage == languages[index]['name'])
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: SizedBox(
                                      height: 12,
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Button to show toast with selected language
            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: CommonWidgets.buildElevatedButton(
                  onPressed:_goTutorial,
                  buttonText: 'Next',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
