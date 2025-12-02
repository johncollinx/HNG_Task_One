import 'package:flutter/material.dart';
import 'package:portfolio_app/pages/home_page.dart';

void main() => runApp(const MyApp());

// 1. Convert MyApp to StatefulWidget to manage the theme state
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 2. Define the state variable for the theme mode
  bool _isDark = false; 

  // 3. Define the method to update the theme state
  void _toggleTheme(bool val) {
    setState(() {
      _isDark = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pradeep Kumar',
      debugShowCheckedModeBanner: false,
      
      // 4. Set the theme data based on the state variable
      theme: _isDark ? ThemeData.dark(useMaterial3: true) : ThemeData.light(useMaterial3: true),
      
      // 5. Pass the state and the setter function to the HomePage
      home: HomePage(
        isDark: _isDark, 
        toggleTheme: _toggleTheme, 
      ),
    );
  }
}
