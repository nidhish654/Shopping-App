import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/screens/home_screen.dart';
import 'package:project2/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: HomeScreen(),
      theme: MaterialTheme(GoogleFonts.poppinsTextTheme()).dark(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
