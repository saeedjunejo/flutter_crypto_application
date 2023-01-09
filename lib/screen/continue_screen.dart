import 'package:air_pay/utils/color.dart';
import 'package:air_pay/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'get_start.dart';

class ContinueScreen extends StatefulWidget {
  const ContinueScreen({Key? key}) : super(key: key);

  @override
  State<ContinueScreen> createState() => _ContinueScreenState();
}

class _ContinueScreenState extends State<ContinueScreen> {
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: customBlack,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(child: SvgPicture.asset("assets/icons/logo1.svg")),
          SizedBox(height: 50),
          Text("Welcome to,",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
          SizedBox(height: 2),
          Text("AirPay",style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
           SizedBox(height: 40),
          Text("Buy or Sell Cryptocurrencies, our easy use\n platform allows you to purchase\n Cryptocurrencies easily",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,height: 1.5,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white30
                ),
              )
            ],
          ),
          SizedBox(height: 60),
          CustomButton(
            height: size.height * 0.08,
            width: size.width*0.65,
            text: 'Continue',
            fontSize: size.height * 0.025,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => GetStartScreen()));
              },
          ),




        ],
      ),
    );
  }
}
