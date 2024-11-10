import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';

class PDFViewerScreen extends StatefulWidget {
  final String pdfLink;
  const PDFViewerScreen({Key? key, required this.pdfLink}) : super(key: key);

  @override
  _PDFViewerScreenState createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  final PdfViewerController _controller = PdfViewerController();
  bool _isLoading = true;
  String _loadingMessage = 'Loading your PDF, please wait...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        backgroundColor: appOrangeColor,
        elevation: 3,
        title: Text(
          'PDF Viewer',
          style: GoogleFonts.lato(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
              semanticLabel: 'Refresh',
            ),
            onPressed: () {
              setState(() {
                _isLoading = true;
                _loadingMessage = 'Refreshing the PDF, please hold on...';
              });
              _controller.jumpToPage(1); // Jump to the first page to simulate a refresh
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SfPdfViewer.network(
            widget.pdfLink,
            key: _pdfViewerKey,
            scrollDirection: PdfScrollDirection.vertical,
            controller: _controller,

            canShowPageLoadingIndicator: false,
            onDocumentLoaded: (details) {
              setState(() {
                _isLoading = false;
              });
            },
            onDocumentLoadFailed: (details) {
              setState(() {
                _isLoading = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Failed to load PDF: ${details.error}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 3),
                ),
              );
            },
          ),
          if (_isLoading)
            _buildLoadingOverlay(),
        ],
      ),
      floatingActionButton: _buildZoomControls(),
    );
  }

  Widget _buildLoadingOverlay() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            color: appOrangeColor,
            strokeWidth: 3,
          ),
          const SizedBox(height: 20),
          Text(
            _loadingMessage,
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'This may take a few seconds, thanks for your patience!',
            style: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.blueGrey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildZoomControls() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: 'zoom1',
          backgroundColor: appOrangeColor,
          onPressed: () {
            setState(() {
              _controller.zoomLevel += 0.25;
            });
          },
          child: const Icon(Icons.zoom_in, color: Colors.white),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          heroTag: 'zoom2',
          backgroundColor: appOrangeColor,
          onPressed: () {
            setState(() {
              if (_controller.zoomLevel > 1.0) _controller.zoomLevel -= 0.25;
            });
          },
          child: const Icon(Icons.zoom_out, color: Colors.white),
        ),
      ],
    );
  }
}
