import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:treasure_of_books/view/screens/asma_ul_husna_home_screen/asma_ul_husna_home_screen.dart';
import 'package:treasure_of_books/view/screens/on_boarding_1/on_boarding_1.dart';

class AsmaUlHusnaSplashScreen extends StatefulWidget {
  @override
  _AsmaUlHusnaSplashScreenState createState() => _AsmaUlHusnaSplashScreenState();
}

class _AsmaUlHusnaSplashScreenState extends State<AsmaUlHusnaSplashScreen> with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();


    // Navigate to the next screen after the animation completes

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => AsmaUlHusnaHomeScreen()));
    });

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAC63D),
      body: SizedBox(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,child: Image.asset("assets/images/asma_splash.png",fit: BoxFit.fill,))
    );
  }
}

