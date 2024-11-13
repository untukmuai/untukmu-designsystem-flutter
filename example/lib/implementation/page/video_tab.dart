import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoTab extends StatefulWidget {
  final String interest;
  final Color backgroundColor;

  const VideoTab(
      {Key? key, required this.interest, required this.backgroundColor})
      : super(key: key);

  @override
  _VideoTabState createState() => _VideoTabState();
}

class _VideoTabState extends State<VideoTab> {
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();

    String interest = widget.interest;
    String url =
        'https://www.youtube.com/results?search_query=${Uri.encodeComponent(interest)}';

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            // Menyisipkan JavaScript untuk menyembunyikan elemen
            _webViewController.runJavaScript('''
              // Menyembunyikan search bar
              var searchBar = document.querySelector('ytm-mobile-topbar-renderers');
              if (searchBar) {
                searchBar.style.display = 'none';
              }

              // Menyembunyikan bottom bar
              var bottomBar = document.querySelector('ytm-pivot-bar-renderer');
              if (bottomBar) {
                bottomBar.style.display = 'none';
              }

              // Alternatif untuk menyembunyikan elemen berdasarkan ID atau kelas
              var elementsToHide = [
                '#masthead-container', // Header utama
                '#guide-button', // Tombol menu samping
                '#footer-container' // Footer
              ];
              elementsToHide.forEach(function(selector) {
                var el = document.querySelector(selector);
                if (el) {
                  el.style.display = 'none';
                }
              });
            ''');
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            // if (request.url.startsWith('https://www.youtube.com/')) {
            //   return NavigationDecision.prevent;
            // }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Center(
          child: CircularProgressIndicator(color: widget.backgroundColor),
        ),
        WebViewWidget(controller: _webViewController),
      ],
    );
  }
}
