import 'dart:async';

import 'package:air_pay/utils/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../utils/components.dart';
import '../../../api_model/data_get.dart';





class ConfirmScreen extends StatefulWidget {
  ConfirmScreen({
    required this.from,
    required this.to,
    required this.amount,
    required this.address,
    required this.refundAdress
  });
  String from;
  String to;
  String amount;
  String address;
  String refundAdress;

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}


class _ConfirmScreenState extends State<ConfirmScreen> {

  @override
  void initState() {
    startTimer();
    final postModel = Provider.of<DataClass>(context, listen: false);

    // setState(() {
    //   transaction();
    // });
    Future.delayed(const Duration(seconds: 30),()=>Navigator.pop(context));
    postModel.getExchangeData(widget.from,widget.to,widget.amount, widget.address,widget.refundAdress);
    super.initState();
  }


  bool displayRefund= false;

  late Timer _timer;
  int _start = 30;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

var collection =FirebaseFirestore.instance.collection("UserData");

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);
    return Scaffold(
      backgroundColor: customBlack,
      body: SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),

              Center(child: Text("Confirm Exchange Details",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))),

              SizedBox(height: 40),
              Container(
                width:  Get.width,
                height: Get.height*0.25,
                decoration: BoxDecoration(
                    color: Color(0xFF131313),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft:  Radius.circular(20)
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(postModel.exchangePost?.fromCurrencyData.toString().toUpperCase() ?? "",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                          SizedBox(width: 15),
                          Icon(Icons.arrow_right,color: Colors.white,size: 35),
                          SizedBox(width: 15),
                          Text(postModel.exchangePost?.toCurrencyData.toString().toUpperCase() ?? "",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))

                        ],
                      ),
                      SizedBox(height: 15),
                      Text("Address",style: TextStyle(color: Colors.white38,fontSize: 13,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(postModel.exchangePost?.payInAdd.toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                          SizedBox(width: 30),
                          InkWell(
                            onTap: (){
                              Clipboard.setData(ClipboardData(text: postModel.exchangePost?.payInAdd.toString() ?? ""));
                              Fluttertoast.showToast(
                                  msg: "Copied",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.SNACKBAR,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Color(0xFF1E272E),
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            },




                            child: Icon(Icons.copy_outlined,color: Colors.white54)
                          )
                        ],
                      ),
                      
                      Spacer(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Exchange ID:",style: TextStyle(color: Colors.white38,fontSize: 13,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                            Row(
                              children: [
                                Text(postModel.exchangePost?.idExchange.toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                                SizedBox(width: 30),
                                InkWell(
                                    onTap: (){
                                      Clipboard.setData(ClipboardData(text: postModel.exchangePost?.idExchange.toString() ?? ""));
                                      Fluttertoast.showToast(
                                          msg: "Copied",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.SNACKBAR,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Color(0xFF1E272E),
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                    },




                                    child: Icon(Icons.copy_outlined,color: Colors.white54)
                                )
                              ],
                            ),

                          ]),
                      SizedBox(height: 20),







                    ],
                  ),
                ),




              ),

              SizedBox(height: 20),

              InkWell(
                onTap: (){
                  setState(() {






                    collection.doc("5egNnK1Lu0UVtlcRoY7N")
                        .update({"Transaction Id": postModel.exchangePost?.idExchange.toString() ?? ""})
                        .then((value) => print("update"))
                        .catchError((error)=>print("update failed: $error"));

                    print("Saeed Id: ${postModel.exchangePost?.idExchange.toString().toUpperCase() ?? ""}");

                  });
                },
                child:

              Text("You will get results",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
        ),
              SizedBox(height: 20),
              Container(
                width:  Get.width,
                height: Get.height*0.20,
                decoration: BoxDecoration(
                  color: Color(0xFF131313)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(postModel.exchangePost?.toCurrencyData.toString().toUpperCase() ?? "",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                          SizedBox(width: 15),
                          Icon(Icons.arrow_right,color: Colors.white,size: 35),
                          SizedBox(width: 15),
                          Text(postModel.exchangePost?.getAmount.toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))

                        ],
                      ),
                      SizedBox(height: 15),
                      Text("Wallet Address",style: TextStyle(color: Colors.white38,fontSize: 13,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(postModel.exchangePost?.payOutAdd.toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                          SizedBox(width: 30),
                          InkWell(
                              onTap: (){
                                Clipboard.setData(ClipboardData(text: postModel.exchangePost?.payOutAdd.toString() ?? ""));
                                Fluttertoast.showToast(
                                    msg: "Copied",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.SNACKBAR,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Color(0xFF1E272E),
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              },




                              child: Icon(Icons.copy_outlined,color: Colors.white54)
                          )

                        ],
                      ),
                      SizedBox(height: 10),







                    ],
                  ),
                ),




              ),

              
              SizedBox(height: 20),
              InkWell(
                onTap: (){
                  setState(() {displayRefund=!displayRefund;});
                },
                child: Text("Refund Details",style: TextStyle(color: Colors.white30,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
              ),

              displayRefund? getResult():
              SizedBox(height: 40),
              StepBar("Waiting Deposit","Exchanging","Sending to you"),

              SizedBox(height: 40),
              Center(child: Text("Timer:   $_start",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))),

              SizedBox(height: 20),
              Center(child: Text("Check All Details and copied",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))),

              SizedBox(height: 40),
              CustomButton(
                height: Get.height * 0.08,
                width: Get.width,
                text: 'Waiting deposit',
                fontSize: Get.height * 0.025,
                onPressed: (){},
              ),

              SizedBox(height: 40),









            ],
          ),
        ),
      )



    );
  }
  Widget getResult(){
    final postModel = Provider.of<DataClass>(context);
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          width:  Get.width,
          height: Get.height*0.18,
          decoration: BoxDecoration(
              color: Color(0xFF131313),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft:  Radius.circular(20)
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text("Refund Address",style: TextStyle(color: Colors.white38,fontSize: 15)),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(postModel.exchangePost?.refundAdd.toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                    InkWell(
                        onTap: (){
                          Clipboard.setData(ClipboardData(text: postModel.exchangePost?.refundAdd.toString() ?? ""));
                          Fluttertoast.showToast(
                              msg: "Copied",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.SNACKBAR,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color(0xFF1E272E),
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        },




                        child: Icon(Icons.copy_outlined,color: Colors.white54)
                    ),
                    SizedBox(width: 30),
                  ],
                ),
                Spacer(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Refund Extra ID:",style: TextStyle(color: Colors.white38,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                      Text(postModel.exchangePost?.refundExtId.toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                    SizedBox(width: 20),
                      InkWell(
                          onTap: (){
                            Clipboard.setData(ClipboardData(text: postModel.exchangePost?.refundExtId.toString() ?? ""));
                            Fluttertoast.showToast(
                                msg: "Copied",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.SNACKBAR,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Color(0xFF1E272E),
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          },

                          child: Icon(Icons.copy_outlined,color: Colors.white54)
                      ),
                    ]),
                SizedBox(height: 20),







              ],
            ),
          ),




        ),
        SizedBox(height: 40)
      ],
    );



  }

  Future transaction(){
    final postModel = Provider.of<DataClass>(context);
    return
      FirebaseFirestore.instance.collection("UserData").add({
        "Transaction Id": postModel.exchangePost?.idExchange.toString().toUpperCase() ?? ""
      });
  //  print("Saeed Id: ${postModel.exchangePost?.idExchange.toString().toUpperCase() ?? ""}");


  }

}
