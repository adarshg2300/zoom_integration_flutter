import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_sdk_flutter/res/assets/image_assets.dart';
import 'package:zoom_sdk_flutter/res/component/comman_widget.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  int _currentPageIndex = 0;

  final List<String> _backgroundImages = [
    ImageAssets.tutorialFirst,
    ImageAssets.tutorialThree,
    ImageAssets.tutorialSecond,
  ];

  @override
  Widget build(BuildContext context) {
    // List of texts for the first text widget corresponding to each page
    final List<String> _firstTexts = [
      '    Watch Unlimited \n       Shows & Live\n          Podcasts',
      '       Watch Shows in \n    Different Categories ',
      '          We’ve Speak \n to Search functionality ',
    ];

    // List of texts for the second text widget corresponding to each page
    final List<String> _secondTexts = [
      'Watch money9 Shows, Podcasts, Articles \n              in 7 different languages.',
      'Watch money9 Shows, Podcasts, Articles \n              in 7 different languages.',
      'Watch money9 Shows, Podcasts, Articles \n              in 7 different languages.',
    ];

    return Scaffold(
      body: Stack(
        children: [
          CommonWidgets.buildBackgroundImage(
            _backgroundImages[_currentPageIndex],
            Builder(
              builder: (context) => PageView(
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                children: [],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CommonWidgets.buildTextCenter(
                    _firstTexts[_currentPageIndex],
                    32.0,
                    FontWeight.normal,
                    Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,bottom: 30),
                  child: CommonWidgets.buildTextCenter(
                    _secondTexts[_currentPageIndex],
                    14.0,
                    FontWeight.normal,
                    Colors.white,
                  ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
                  padding: EdgeInsets.all(16.0),
                  child: CommonWidgets.buildElevatedButton(
                    onPressed: _currentPageIndex < 2 ? _next : _getStarted,
                    buttonText: _currentPageIndex < 2 ? 'Next' : 'Get Started',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _next() {
    if (_currentPageIndex < 2) {
      setState(() {
        _currentPageIndex++;
      });
    }
  }

  void _getStarted() {
    // Handle the action for when "Get Started" button is pressed
  }
}
