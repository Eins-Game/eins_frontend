import 'package:desktop_window/desktop_window.dart';
import 'package:eins_frontend/pages/eins_home_page/eins_home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_io/io.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    html.document.documentElement.requestFullscreen();
  } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // asynchronous hack for setting window to fullscreen
    Future.delayed(Duration.zero).then((finish) async {
      // Enforce Window to be not resizable on Windows
      if (Platform.isWindows) {
        PlatformWindow window = await getWindowInfo();
        await DesktopWindow.setMaxWindowSize(Size(window.screen.frame.width, window.screen.frame.height));
        await DesktopWindow.setMinWindowSize(Size(window.screen.frame.width, window.screen.frame.height));
        SystemChrome.setEnabledSystemUIOverlays([]);
        await DesktopWindow.setFullScreen(true);
      } else {
        await DesktopWindow.setFullScreen(true);
      }
    });
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eins Game',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xfff47c48),
        primarySwatch: Colors.deepOrange,
        textTheme: GoogleFonts.lexendDecaTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: EinsHomePage(),
    );
  }
}
