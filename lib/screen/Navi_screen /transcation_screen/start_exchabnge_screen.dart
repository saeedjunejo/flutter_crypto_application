import 'package:air_pay/screen/Navi_screen%20/transcation_screen/check_status.dart';
import 'package:air_pay/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../../utils/components.dart';


class StartExchangeScreen extends StatefulWidget {
  const StartExchangeScreen({Key? key}) : super(key: key);

  @override
  State<StartExchangeScreen> createState() => _StartExchangeScreenState();
}

class _StartExchangeScreenState extends State<StartExchangeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: customBlack,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: Get.width,
                height: Get.height * 0.31,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [customNavBlue, customBlue]
                    ),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25)
                    )
                ),
                child: Column(
                  children: [

                    Spacer(),
                    Center(child: Text("All Transactions", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Quicksand', fontWeight: FontWeight.w600))),
                    SizedBox(height: 30),
                    GlassmorphicContainer(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.1,
                      borderRadius: 20,
                      blur: 7,
                      alignment: Alignment.center,
                      border: 0,
                      linearGradient: LinearGradient(
                        colors: [
                          Colors.white.withAlpha(45),
                          Colors.white.withAlpha(55)
                        ],

                      ),
                      borderGradient: LinearGradient(
                        colors: [
                          Colors.white.withAlpha(100),
                          Colors.white.withAlpha(55),
                        ],

                      ),

                      child: CustomConnectWa(
                        height: Get.height * 0.06,
                        width: Get.width * 0.7,
                        text: 'Check Transaction Status',
                        fontSize: Get.height * 0.020,
                        onPressed: () {
                          Get.to(() => CheckTransStatus());
                        },
                      ),

                    ),
                    SizedBox(height: 30),

                  ],
                ),

              ),
              SizedBox(height: 20),

              SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Transactions History",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w400)),

                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("  6:30 AM", textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w400)),
                            Text("Sun Jun 12   ", textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        SizedBox(height: 10),
                        GlassmorphicContainer(
                          width: MediaQuery.of(context).size.width * 1.1,
                          height: MediaQuery.of(context).size.height * 0.11,
                          borderRadius: 15,
                          blur: 7,
                          alignment: Alignment.center,
                          border: 0,
                          linearGradient: LinearGradient(
                            colors: [Colors.white.withAlpha(45), Colors.white
                                .withAlpha(55)
                            ],

                          ),
                          borderGradient: LinearGradient(
                            colors: [Colors.white.withAlpha(100), Colors.white
                                .withAlpha(55),
                            ],

                          ),

                          child: Padding(
                            padding: const EdgeInsets.only(left: 20,
                                right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Transaction Request", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w600)),
                                    Image.asset("assets/icons/check.png",width: 20,height: 20,)
                                  ],
                                ),
                                SizedBox(height: 13),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text("Request Id:", style: TextStyle(
                                        color: Colors.white38,
                                        fontSize: 12,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w400)),
                                    Text("12ed34mjey3478rthdf",
                                        style: TextStyle(color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Quicksand',
                                            fontWeight: FontWeight.w600)),
                                    Icon(
                                      Icons.copy_sharp, color: Colors.white,
                                      size: 15,)
                                  ],
                                )

                              ],
                            ),
                          ),

                        ),


                        SizedBox(height: 15),
                        GlassmorphicContainer(
                          width: MediaQuery.of(context).size.width * 1.1,
                          height: MediaQuery.of(context).size.height * 0.11,
                          borderRadius: 15,
                          blur: 7,
                          alignment: Alignment.center,
                          border: 0,
                          linearGradient: LinearGradient(
                            colors: [Colors.white.withAlpha(45), Colors.white
                                .withAlpha(55)
                            ],

                          ),
                          borderGradient: LinearGradient(
                            colors: [Colors.white.withAlpha(100), Colors.white
                                .withAlpha(55),
                            ],

                          ),

                          child: Padding(
                            padding: const EdgeInsets.only(left: 20,
                                right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Transaction Request", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w600)),
                                    Image.asset("assets/icons/check.png",width: 20,height: 20,)
                                  ],
                                ),
                                SizedBox(height: 13),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text("Request Id:", style: TextStyle(
                                        color: Colors.white38,
                                        fontSize: 12,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w400)),
                                    Text("12ed34mjey3478rthdf",
                                        style: TextStyle(color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Quicksand',
                                            fontWeight: FontWeight.w600)),
                                    Icon(
                                      Icons.copy_sharp, color: Colors.white,
                                      size: 15,)
                                  ],
                                )

                              ],
                            ),
                          ),

                        ),

                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("  6:30 AM", textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w400)),
                            Text("Sun Jun 12   ", textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        SizedBox(height: 10),
                        GlassmorphicContainer(
                          width: MediaQuery.of(context).size.width * 1.1,
                          height: MediaQuery.of(context).size.height * 0.11,
                          borderRadius: 15,
                          blur: 7,
                          alignment: Alignment.center,
                          border: 0,
                          linearGradient: LinearGradient(
                            colors: [Colors.white.withAlpha(45), Colors.white
                                .withAlpha(55)
                            ],

                          ),
                          borderGradient: LinearGradient(
                            colors: [Colors.white.withAlpha(100), Colors.white
                                .withAlpha(55),
                            ],

                          ),

                          child: Padding(
                            padding: const EdgeInsets.only(left: 20,
                                right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Transaction Request", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w600)),
                                    Image.asset("assets/icons/check.png",width: 20,height: 20,)
                                  ],
                                ),
                                SizedBox(height: 13),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text("Request Id:", style: TextStyle(
                                        color: Colors.white38,
                                        fontSize: 12,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w400)),
                                    Text("12ed34mjey3478rthdf",
                                        style: TextStyle(color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Quicksand',
                                            fontWeight: FontWeight.w600)),
                                    Icon(
                                      Icons.copy_sharp, color: Colors.white,
                                      size: 15,)
                                  ],
                                )

                              ],
                            ),
                          ),

                        ),

                        SizedBox(height: 15),
                        GlassmorphicContainer(
                          width: MediaQuery.of(context).size.width * 1.1,
                          height: MediaQuery.of(context).size.height * 0.11,
                          borderRadius: 15,
                          blur: 7,
                          alignment: Alignment.center,
                          border: 0,
                          linearGradient: LinearGradient(
                            colors: [Colors.white.withAlpha(45), Colors.white
                                .withAlpha(55)
                            ],

                          ),
                          borderGradient: LinearGradient(
                            colors: [Colors.white.withAlpha(100), Colors.white
                                .withAlpha(55),
                            ],

                          ),

                          child: Padding(
                            padding: const EdgeInsets.only(left: 20,
                                right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Transaction Request", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w600)),
                                    Image.asset("assets/icons/check.png",width: 20,height: 20,)
                                  ],
                                ),
                                SizedBox(height: 13),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text("Request Id:", style: TextStyle(
                                        color: Colors.white38,
                                        fontSize: 12,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w400)),
                                    Text("12ed34mjey3478rthdf",
                                        style: TextStyle(color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Quicksand',
                                            fontWeight: FontWeight.w600)),
                                    Icon(
                                      Icons.copy_sharp, color: Colors.white,
                                      size: 15,)
                                  ],
                                )

                              ],
                            ),
                          ),

                        ),


                      ],
                    ),
                  )
              ),

              SizedBox(height: 20),


            ],
          ),
        )


    );
  }







}