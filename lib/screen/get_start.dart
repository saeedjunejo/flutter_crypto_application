import 'package:air_pay/screen/userAuth_screen/user_auth_screen.dart';
import 'package:air_pay/utils/color.dart';
import 'package:air_pay/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({Key? key}) : super(key: key);

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: customBlack,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(child: SvgPicture.asset("assets/icons/logo2.svg",width: 210,height: 210)),
          SizedBox(height: 30),
          Text("Control your crypto wallet\n in a new way",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
          SizedBox(height: 15),
          Text("AirPay allows user to send or trade Flat&\n Crypto plus pay for goods and services\n using our AirPay Virtual Debit Card.",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,height: 1.5,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white30
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                ),
              ),
            ],
          ),
          SizedBox(height: 60),
          CustomButton(
            height: size.height * 0.08,
            width: size.width*0.65,
            text: 'Get Started',
            fontSize: size.height * 0.025,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserAuthScreen()));},
          ),



        ],
      ),
    );
  }
}
