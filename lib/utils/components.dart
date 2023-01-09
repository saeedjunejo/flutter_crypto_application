import 'dart:io';

import 'package:air_pay/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final double fontSize;
  final VoidCallback onPressed;

  const CustomButton(
      {Key? key,
        required this.height,
        required this.width,
        required this.text,
        required this.onPressed,
        required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [customNavBlue, customBlue],
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontFamily: 'Quicksand',fontWeight: FontWeight.w600

          ),
        ),
      ),
    );
  }
}

class CustomButRegister extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final double fontSize;
  final bool hasBorder;
  final VoidCallback onPressed;

  const CustomButRegister(
      {Key? key,
        required this.height,
        required this.width,
        required this.text,
        required this.onPressed,
        this.hasBorder = false,
        required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.transparent,
          border: Border.all(width: 2,color: Colors.white),
          borderRadius: BorderRadius.circular(25)

        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class CustomEditedFiled extends StatelessWidget {
  final TextEditingController controller;
  final double width ;
  final double height;
  final String hintText;

  const CustomEditedFiled(
      {Key? key,
        required this.width,
        required this.height,
        required this.hintText,
        required this.controller,
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child:
          Container(
            height: height,
            width: width,
            padding: const EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextField(
              controller: controller,
              style: TextStyle(
                  fontFamily: 'Quicksand',fontWeight: FontWeight.w600,
                  color: customBlack
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  fontSize: Get.height * 0.020,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomPassField extends StatelessWidget {
  final SignUpController signupController;
  final TextEditingController controller;
  final String hintText;


  const CustomPassField({
    Key? key,

    required this.hintText,
    required this.controller,
    required this.signupController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Center(
          child: Container(
            width: Get.width*0.85,
            height: Get.height*0.08,
            padding: const EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [

                Expanded(
                  child: Obx(
                        () => TextField(
                      controller: controller,
                      obscureText:
                      signupController.isPasswordHide.value ? true : false,
                      style: TextStyle(
                        color: Colors.black,
                          fontFamily: 'Quicksand',fontWeight: FontWeight.w400
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Quicksand',fontWeight: FontWeight.w400,
                          fontSize: Get.height * 0.020,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    signupController.togglePassword();
                  },
                  child: Obx(
                        () => Icon(
                      signupController.isPasswordHide.value
                          ? Icons.visibility_off_rounded
                          : Icons.remove_red_eye_rounded,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  RxBool isPasswordHide = true.obs;
  RxBool rememeberMe = false.obs;

  void togglePassword() {
    isPasswordHide.value = !isPasswordHide.value;
  }
}

class CustomEditedSearch extends StatelessWidget {
  final TextEditingController controller;
  final double width ;
  final double height;
  final String hintText;

  const CustomEditedSearch(
      {Key? key,
        required this.width,
        required this.height,
        required this.hintText,
        required this.controller,
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width:  width,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Color(0xFF31394E),
        borderRadius: BorderRadius.circular(5),

      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5,right: 15),
        child: Row(
          children: [
            Icon(Icons.search,color: Color(0xFFA7A4A4),size: 30),
            SizedBox(width: 10),
            Expanded(
              child: Center(
                child: TextField(
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: Color(0xFFA7A4A4),
                      fontWeight: FontWeight.w500,
                      fontSize: Get.height * 0.026,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class CustomButtonProfile extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final double fontSize;
  final VoidCallback onPressed;

  const CustomButtonProfile(
      {Key? key,
        required this.height,
        required this.width,
        required this.text,
        required this.onPressed,
        required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFF0DFF98),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;



  const CustomTextField(
      {Key? key,
        required this.title,
        required this.hintText,
        required this.controller,
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: Get.height * 0.025,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child:
          Container(
            height: Get.height * 0.065,
            width: Get.width,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Color(0xFF31394E),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: Get.height * 0.017,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TextShowHide extends StatelessWidget {
  final SignUpController signupController;
  final TextEditingController controller;
  final String hintText;


  const TextShowHide({
    Key? key,

    required this.hintText,
    required this.controller,
    required this.signupController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Center(
          child: Container(
            width: Get.width*0.3,
            height: Get.height*0.08,

            child: Row(
              children: [

                Expanded(
                  child: Obx(
                        () => TextField(
                          controller: controller,
                          readOnly: true,
                          obscureText:
                          signupController.isPasswordHide.value ? true : false,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: hintText,
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: Get.height * 0.020,
                            ),
                          ),
                        ),

                  ),

                ),
                GestureDetector(
                  onTap: () {
                    signupController.togglePassword();
                  },
                  child: Obx(
                        () => Icon(
                      signupController.isPasswordHide.value
                          ? Icons.visibility_off_rounded
                          : Icons.remove_red_eye_rounded,
                      color: Colors.white30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomEditedUser extends StatelessWidget {
  final TextEditingController controller;
  final double width ;
  final double height;
  final String hintText;
  final VoidCallback onPressed;

  const CustomEditedUser(
      {Key? key,
        required this.width,
        required this.height,
        required this.hintText,
        required this.controller,
        required this.onPressed
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child:
          Container(
            height: height,
            width: width,
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(0xFF171E30),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: TextStyle(
                        fontFamily: 'Quicksand',fontWeight: FontWeight.w400,
                        color: Colors.white
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: Colors.white30,
                        fontFamily: 'Quicksand',fontWeight: FontWeight.w400,
                        fontSize: Get.height * 0.020,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onPressed,
                  child: Icon(Icons.edit,color: Color(0xFF0DFF98)),
                ),


                SizedBox(width: 15),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomEditedWallet extends StatelessWidget {
  final TextEditingController controller;
  final double width ;
  final double height;
  final String hintText;

  const CustomEditedWallet(
      {Key? key,
        required this.width,
        required this.height,
        required this.hintText,
        required this.controller,
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child:
          Container(
            height: height,
            width: width,
            padding: const EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white10,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: controller,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: customBlack
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: Get.height * 0.020,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomEditedSend extends StatelessWidget {
  final TextEditingController controller;
  final double width ;
  final double height;
  final String hintText;


  const CustomEditedSend(
      {Key? key,
        required this.width,
        required this.height,
        required this.hintText,
        required this.controller,

      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child:
          Container(
            height: height,
            width: width,
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15)
              ),
            ),
            child: TextField(
              controller: controller,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: customBlack
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: Get.height * 0.020,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomEditedScan extends StatelessWidget {
  final TextEditingController controller;
  final double width ;
  final double height;
  final String hintText;


  const CustomEditedScan(
      {Key? key,
        required this.width,
        required this.height,
        required this.hintText,
        required this.controller,

      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child:
          Container(
            height: height,
            width: width,
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: Get.height * 0.020,
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/scan.svg",
                      height: 25,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomExchange extends StatelessWidget {
  final TextEditingController controller;
  final double width ;
  final double height;
  final String hintText;
  final String title;

  const CustomExchange(
      {Key? key,
        required this.width,
        required this.height,
        required this.hintText,
        required this.controller,
        required this.title
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child:
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(0xFF262626),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(title,style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                  TextField(
                    controller: controller,
                    style: TextStyle(
                        fontFamily: 'Quicksand',fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText:hintText,
                      hintStyle: TextStyle(
                        color: Colors.white54,
                        fontFamily: 'Quicksand',fontWeight: FontWeight.w600,
                        fontSize: Get.height * 0.020,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomGet extends StatelessWidget {
  final double width ;
  final double height;
  final String hintText;
  final String title;

  const CustomGet(
      {Key? key,
        required this.width,
        required this.height,
        required this.hintText,
        required this.title
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child:
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(0xFF262626),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(title,style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                  SizedBox(height: 17),
                  Text(hintText,style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomConnectWa extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final double fontSize;
  final VoidCallback onPressed;

  const CustomConnectWa(
      {Key? key,
        required this.height,
        required this.width,
        required this.text,
        required this.onPressed,
        required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [customNavBlue, customBlue],
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icons/connectwallet.png",width: 25,height: 25),
            SizedBox(width: 10),
            Text(text, style: TextStyle(color: Colors.white, fontSize: 13, fontFamily: 'Quicksand',fontWeight: FontWeight.w600),),
          ],
        ),
      ),
    );
  }
}

class CustomConnectMetamask extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final double fontSize;
  final VoidCallback onPressed;

  const CustomConnectMetamask(
      {Key? key,
        required this.height,
        required this.width,
        required this.text,
        required this.onPressed,
        required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icons/metamask.png",width: 25,height: 25),
            SizedBox(width: 10),
            Text(text, style: TextStyle(color: Colors.black, fontSize: 13, fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

class CustomEdited extends StatelessWidget {
  final TextEditingController controller;
  final double width ;
  final double height;
  final String hintText;

  const CustomEdited(
      {Key? key,
        required this.width,
        required this.height,
        required this.hintText,
        required this.controller,
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child:
          Container(
            height: height,
            width: width,
            padding: const EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
                color: Color(0xFF0c0c0c),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: controller,
              style: TextStyle(
                  fontFamily: 'Quicksand',fontWeight: FontWeight.w600,
                  color: Colors.white
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.white38,
                  fontWeight: FontWeight.w400,
                  fontSize: Get.height * 0.020,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget StepBar(String title1,String title2,String title3,){


  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Column(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
                color: Color(0xFF13146B)
            ),
            child: Center(child: Text("1",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))),
          ),
          SizedBox(height: 8),
          Text(title1,style: TextStyle(fontSize: 12,color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))
        ],
      ),
      Container(width: 50, height: 2, color: Colors.white38),
      Column(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF131313),
            ),
            child: Center(child: Text("2",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))),
          ),
          SizedBox(height: 8),
          Text(title2,style: TextStyle(fontSize: 12,color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))
        ],
      ),
      Container(width: 50, height: 2, color: Colors.white38),
      Column(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF131313),
            ),
            child: Center(child: Text("3",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))),
          ),
          SizedBox(height: 8),
          Text(title3,style: TextStyle(fontSize: 12,color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))
        ],
      ),


    ],
  );
}

class ExitAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF373F45),
      insetPadding: EdgeInsets.all(10),
      actionsPadding: EdgeInsets.only(left: 20,right: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),

      actions: [ Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              width: Get.width*0.35,
              height: Get.height*0.18,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage("assets/icons/exitlogout.png"),
                      fit: BoxFit.fill
                  )
              ),


            ),
            SizedBox(height: 40),
            Text("Exit App!",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20), textAlign: TextAlign.center),
            SizedBox(height: 10),
            Text("Are you sure you want to exit this app?",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w400,fontSize: 15), textAlign: TextAlign.center),
            SizedBox(height: 20),
            CustomButton(
              height: Get.height * 0.075,
              width: Get.width*0.65,
              text: 'Yes',
              fontSize: Get.height * 0.025,
              onPressed: () {
                exit(0);
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            SizedBox(height: 20),
            CustomButRegister(
              height: Get.height * 0.07,
              width: Get.width*0.65,
              text: 'No',
              fontSize: Get.height * 0.020,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 10),


          ],
        )

      ],

    );



      CupertinoAlertDialog(


      // title: Text(
      //   "Exit App!",
      // ),
      // content: Text(
      //   'Are you sure you want to exit this app?',
      // ),
      actions: <Widget>[


        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              width: Get.width*0.35,
              height: Get.height*0.18,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage("assets/icons/exitlogout.png"),
                      fit: BoxFit.fill
                  )
              ),


            ),
            SizedBox(height: 40),
            Text("Please confirm",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w600,fontSize: 20), textAlign: TextAlign.center),
            SizedBox(height: 10),
            Text("Are you sure  want to logout the app?",style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.w400,fontSize: 15), textAlign: TextAlign.center),
            SizedBox(height: 20),
            CustomButton(
              height: Get.height * 0.075,
              width: Get.width*0.65,
              text: 'Logout',
              fontSize: Get.height * 0.025,
              onPressed: () {
                exit(0);
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            SizedBox(height: 20),
            CustomButRegister(
              height: Get.height * 0.07,
              width: Get.width*0.65,
              text: 'Cancel',
              fontSize: Get.height * 0.020,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 10),


          ],
        )



        // CupertinoDialogAction(
        //     textStyle: TextStyle(color: Colors.grey[600]),
        //     isDefaultAction: true,
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     child: Text(
        //       'No',
        //     )),
        // CupertinoDialogAction(
        //   textStyle: TextStyle(color: Colors.blue[700]),
        //   isDefaultAction: true,
        //   onPressed: () async {
        //     exit(0);
        //   },
        //   child: Text('Yes'),
        // ),


      ],
    );
  }
}