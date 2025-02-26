import 'package:asmaulhusna/asmaulhusna.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treasure_of_books/view/screens/asma_read_screen/asma_read_screen.dart';
import 'package:treasure_of_books/view/screens/quran_reading/quran_reading.dart';

class AsmaUlHusna extends StatefulWidget {
  const AsmaUlHusna({super.key});

  @override
  State<AsmaUlHusna> createState() => _AsmaUlHusnaState();
}

class _AsmaUlHusnaState extends State<AsmaUlHusna> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scrollController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scrollAnimation;

  @override
  void initState() {
    super.initState();

    // Fade Animation
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
    _fadeController.forward();

    // Scroll Bounce Animation
    _scrollController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _scrollAnimation = Tween<double>(begin: 0.9, end: 1).animate(
      CurvedAnimation(parent: _scrollController, curve: Curves.elasticOut),
    );
    _scrollController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
  Widget _buildBackgroundGradient() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffFEE7B0), Color(0xffFAC63D)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        elevation: 0,
        title: Text(
          'Quran - e - Pak',
          style: GoogleFonts.lato(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffFAC63D), Colors.orange.shade600],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          _buildBackgroundGradient(),
          _buildSurahList(),
        ],
      ),
    );
  }
  Widget _buildSurahList() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        itemCount: 99,
        itemBuilder: (context, index) {
          return _buildVerseCard(index);
        },
      ),
    );
  }

  Widget _buildVerseCard(int index,) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 600),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => AsmaReadScreen(nameNumber: index + 1),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 15,
                    offset: Offset(5, 10),
                  ),
                ],
                border: Border.all(color: Colors.orange.shade200, width: 2),
              ),
              child:ListTile(
                contentPadding: const EdgeInsets.all(18.0),
                leading: CircleAvatar(
                  backgroundColor: Color(0xffFAC63D),
                  radius: 25,
                  child: Text(
                    (index + 1).toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                title: Text(
                    getEnglishName(index + 1),
                    style: GoogleFonts.amiri(fontSize: 22, fontWeight: FontWeight.bold)
                ),
                subtitle: Text(
                 getDescritption(index + 1),
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey.shade600),
                ),
                trailing: Text(
                    getArabicName(index + 1),
                    style: GoogleFonts.amiri(fontSize: 22, fontWeight: FontWeight.bold)
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey.shade300,
            height: 2,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }




}
