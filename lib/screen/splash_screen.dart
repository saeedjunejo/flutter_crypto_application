import 'package:air_pay/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'continue_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ContinueScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBlack,
      body: Container(
        height: Get.height,
        width: Get.width,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/icons/logo.svg'),
      ),
    );
  }
}
