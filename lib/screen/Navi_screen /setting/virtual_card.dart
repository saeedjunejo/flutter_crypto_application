import 'package:air_pay/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VirtualCard extends StatefulWidget {
  const VirtualCard({Key? key}) : super(key: key);

  @override
  State<VirtualCard> createState() => _VirtualCardState();
}

class _VirtualCardState extends State<VirtualCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBlack,
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 50),
            InkWell(
              onTap: (){
                Navigator.pop(context);

              },
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    color: Color(0xFF191919),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Icon(Icons.arrow_back,color: Colors.white),
              ),
            ),

            Spacer(),
            Center(
              child: Container(
                width: Get.width*0.6,
                height: Get.height*0.40,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage("assets/icons/managecard.png"),
                    fit: BoxFit.fill
                  )
                ),


              ),
            ),
            SizedBox(height: 50),
            Center(child: Text("Coming Soon....",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))),
            Spacer(),
            SizedBox(height: 80),








          ]),
      )


    );
  }
}
