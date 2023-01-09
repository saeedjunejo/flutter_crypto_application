import 'package:air_pay/screen/userAuth_screen/register_screen.dart';
import 'package:air_pay/utils/color.dart';
import 'package:air_pay/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'login_screen.dart';
class UserAuthScreen extends StatefulWidget {
  const UserAuthScreen({Key? key}) : super(key: key);

  @override
  State<UserAuthScreen> createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBlack,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(child: SvgPicture.asset("assets/icons/logo.svg")),
          SizedBox(height: 110),
          CustomButRegister(
            height: Get.height * 0.08,
            width: Get.width*0.65,
            text: 'Register',
            fontSize: Get.height * 0.025,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));

              },
          ),
          SizedBox(height: 30),
          CustomButton(
            height: Get.height * 0.08,
            width: Get.width*0.65,
            text: 'Login',
            fontSize: Get.height * 0.025,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));

              },
          ),
        ],
      ),
    );
  }
}
