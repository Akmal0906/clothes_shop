import 'dart:async';
import 'dart:ui';
import 'package:clothes_shop/presentation/view/combain_screen.dart';
import 'package:clothes_shop/utils/contants/All_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    nextScreen();

  }

  void nextScreen() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const CombainScreen()), (
          route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: const AssetImage(
              'assets/images/clothes.jpg',
            ),
            fit: BoxFit.cover,
            height: size.height,
            width: size.width,
          ),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                color: Colors.transparent,
              )),
          Positioned(
            top: (size.height / 2) - 135,
            left: (size.width / 2) - 100,
            height: 180,
            width: 200,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 1,
                        color: Colors.grey.shade500,
                        offset: const Offset(4, 4))
                  ],
                  image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/clothes.jpg',
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: (size.height/2)+90,
              left: (size.width/5),
              child: Text(
            AllText.welcome,
            style: customStyle.copyWith(
                color: Colors.white, fontSize: 18, letterSpacing: 1),
          ))
        ],
      ),
    );
  }
}
