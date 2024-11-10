import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treasure_of_books/constants/constants.dart';
import 'package:treasure_of_books/view/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:treasure_of_books/view/screens/on_boarding_1/on_boarding_1.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _imageAnimation;

  navigate() async {
    SharedPreferences sharedPreferences=await  SharedPreferences.getInstance();
    bool? isLogin=sharedPreferences.getBool("isLogin");

    Future.delayed(Duration(seconds: 3), () {
      if(isLogin==false||isLogin==null){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => OnBoardingOne()),
        );
      }else{
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => BottomNavigationScreenSeller()),
        );
      }

    });
  }


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _imageAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller!, curve: Curves.easeInOut),
    );

    _controller!.forward();

    // Navigate to the next screen after the animation completes

    navigate();



  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFAC63D),
      body: Stack(
        children: [
          // Background Image
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash_main.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  appOrangeColor.withOpacity(0.9),
                  Color(0xffFAC63D).withOpacity(0.7),
                ],
              ),
            ),
          ),
          // Animated Logo/Image
          Center(
            child: FadeTransition(
              opacity: _imageAnimation!,
              child: Container(
                height: MediaQuery.of(context).size.width*0.8,
                width: MediaQuery.of(context).size.width*0.8,
                child: Image.asset(
                  'assets/images/splash_new.gif',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          // Animated Text
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Welcome to\nthe Treasure of Books',
                      textAlign: TextAlign.center,
                      textStyle: GoogleFonts.greatVibes(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      speed: Duration(milliseconds: 100),
                    ),
                  ],
                  totalRepeatCount: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
