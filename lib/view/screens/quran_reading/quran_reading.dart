import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;

class QuranReading extends StatefulWidget {
  final int surahNumber;
  const QuranReading({super.key, required this.surahNumber});

  @override
  State<QuranReading> createState() => _QuranReadingState();
}

class _QuranReadingState extends State<QuranReading> {
  bool isLoading = false;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          _buildBackgroundGradient(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: quran.getVerseCount(widget.surahNumber),
                itemBuilder: (context, index) {
                  return _buildVerseCard(index, width);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.white,
      elevation: 0,
      title: Text(
        quran.getSurahName(widget.surahNumber),
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
    );
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

  Widget _buildVerseCard(int index, double width) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 600),
      child: Column(
        children: [
          Container(
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
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
                      Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildLoadingIcon(),
                          IconButton(
                            icon: Icon(Icons.play_arrow_outlined, color: Color(0xffFAC63D)),
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              await player.play(UrlSource(quran.getAudioURLByVerse(widget.surahNumber, index + 1)));
                              setState(() {
                                isLoading = false;
                              });
                            },
                          ),
                          Icon(Icons.share_outlined, color: Color(0xffFAC63D)),
                          SizedBox(width: 5),
                          Icon(Icons.save_alt_outlined, color: Color(0xffFAC63D)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: width,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    quran.getVerse(widget.surahNumber, index + 1, verseEndSymbol: true),
                    textAlign: TextAlign.end,
                    style: GoogleFonts.amiri(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: width,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    quran.getVerseTranslation(widget.surahNumber, translation: quran.Translation.enSaheeh, index + 1, verseEndSymbol: true),
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey.shade600),
                  ),
                ),

                SizedBox(height: 10,)
              ],
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

  Widget _buildLoadingIcon() {
    return isLoading
        ? SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        color: Color(0xffFAC63D),
        strokeWidth: 2,
      ),
    )
        : SizedBox.shrink();
  }
}
