import 'package:asmaulhusna/asmaulhusna.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class AsmaReadScreen extends StatefulWidget {
  final int nameNumber;
  const AsmaReadScreen({super.key,required this.nameNumber});

  @override
  State<AsmaReadScreen> createState() => _AsmaReadScreenState();
}

class _AsmaReadScreenState extends State<AsmaReadScreen> {
  FlutterTts flutterTts = FlutterTts();
  bool isSpeaking = false;

  @override
  void initState() {
    super.initState();
    _setTtsSettings();
  }

  Future<void> _setTtsSettings() async {
    await flutterTts.setLanguage("ar-SA"); // Set language to Arabic
    await flutterTts.setPitch(1.0);  // Normal pitch
    await flutterTts.setSpeechRate(0.5); // Normal speed
  }

  Future<void> _speak() async {
    var result = await flutterTts.speak(getArabicName(widget.nameNumber));
    if (result == 1) {
      setState(() {
        isSpeaking = true;
      });
    }
  }

  Future<void> _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) {
      setState(() {
        isSpeaking = false;
      });
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(appBar: AppBar(backgroundColor: Color(0xfff7eee5),surfaceTintColor: Color(0xfff7eee5),title: Text("Asma-ul-Husna",style: GoogleFonts.poppins(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),),body: Container(width: width,height: height,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/asma_read.png",),fit: BoxFit.fill)),child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
      SizedBox(height: height*0.18,),
      Text(getArabicName(widget.nameNumber),style: GoogleFonts.amiriQuran(fontSize: 60,color: Colors.black,fontWeight: FontWeight.w600),),
      SizedBox(height: 30,),
      Text(getEnglishName(widget.nameNumber),style: GoogleFonts.inter(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w500),),
      SizedBox(height: 10,),
      Text(getDescritption(widget.nameNumber),style: GoogleFonts.inter(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400),),
      SizedBox(height: 30,),
      GestureDetector(
        onTap: isSpeaking ? _stop : _speak
      ,child: SizedBox(height: 100,child: Image.asset("assets/images/play.png"),))


    ],),),);
  }
}
