import 'dart:async';
import 'package:convermax/data/core/resource/resource.dart';
import 'package:convermax/presentation/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    // 3 soniyadan keyin asosiy sahifaga o'tadi
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Lottie.asset(LottieAssets.splash, width: 400)));
  }
}
