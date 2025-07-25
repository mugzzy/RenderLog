import 'package:flutter/material.dart';
import 'package:renderlog/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  // await Supabase.initialize(
  //   url: 'https://kswonnioainsrsyljqus.supabase.co',
  //   anonKey:
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imtzd29ubmlvYWluc3JzeWxqcXVzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDUwNjU4ODMsImV4cCI6MjA2MDY0MTg4M30.C6mBQe6tjPE3yCdpUBplCItFy3-w9tcbiql3DvydOTw',
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFFB74D)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
