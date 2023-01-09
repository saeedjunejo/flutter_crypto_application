import 'dart:async';

import 'package:air_pay/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../utils/components.dart';
import '../../api_model/data_get.dart';





class ConfirmDeposit extends StatefulWidget {
  //const ConfirmDeposit({Key? key}) : super(key: key);


  ConfirmDeposit({
    required this.fromDeposit,
    required this.toDeposit,
    required this.amountDeposit,
    required this.addressDeposit,
    required this.refundAddrDeposit
  });
  String fromDeposit;
  String toDeposit;
  String amountDeposit;
  String addressDeposit;
  String refundAddrDeposit;



  @override
  State<ConfirmDeposit> createState() => _ConfirmDepositState();
}


class _ConfirmDepositState extends State<ConfirmDeposit> {

  @override
  void initState() {
    startTimer();
    Future.delayed(const Duration(seconds: 30),()=>Navigator.pop(context));
    final fetchDepModel = Provider.of<DataClass>(context, listen: false);
    fetchDepModel.getDepositData(widget.fromDeposit,widget.toDeposit,widget.amountDeposit,widget.addressDeposit,widget.refundAddrDeposit);
    super.initState();
  }


  bool displayRefund= false;
  bool moreDetails=false;

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


  @override
  Widget build(BuildContext context) {
    final fetchDepModel = Provider.of<DataClass>(context);
    return Scaffold(
        backgroundColor: customBlack,
        body: SingleChildScrollView(
          child:  Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),

                Center(child: Text("Confirm Deposit Details",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))),
                SizedBox(height: 40),

                Container(
                  width:  Get.width,
                  height: Get.height*0.25,
                  decoration: BoxDecoration(
                    color: Color(0xFF131313),
                    borderRadius: BorderRadius.circular(10),
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
                            Text(fetchDepModel.depositApiModel?.fromNetwork.toString().toUpperCase() ?? "",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_right,color: Colors.white,size: 35),
                            SizedBox(width: 15),
                            Text(fetchDepModel.depositApiModel?.toNetwork.toString().toUpperCase() ?? "",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))

                          ],
                        ),
                        SizedBox(height: 15),
                        Text("Address",style: TextStyle(color: Colors.white38,fontSize: 13,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(fetchDepModel.depositApiModel?.payinAddress.toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                            SizedBox(width: 30),
                            InkWell(
                                onTap: (){
                                  Clipboard.setData(ClipboardData(text: fetchDepModel.depositApiModel?.payinAddress.toString() ?? ""));
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("ID:",style: TextStyle(color: Colors.white38,fontSize: 13,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                                  SizedBox(width: 15),
                                  Text(fetchDepModel.depositApiModel?.id.toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),

                                ],
                              ),

                              Icon(Icons.copy_outlined,color: Colors.white54)

                            ]),
                        SizedBox(height: 20),







                      ],
                    ),
                  ),




                ),
                SizedBox(height: 20),
                Text("You will get results",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                SizedBox(height: 20),
                Container(
                  width:  Get.width,
                  height: Get.height*0.20,
                  decoration: BoxDecoration(
                      color: Color(0xFF131313),
                    borderRadius: BorderRadius.circular(10)
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
                            Text(fetchDepModel.depositApiModel?.toNetwork.toString().toUpperCase() ?? "",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_right,color: Colors.white,size: 35),
                            SizedBox(width: 15),
                            Text(fetchDepModel.depositApiModel?.toAmount.toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))

                          ],
                        ),
                        SizedBox(height: 15),
                        Text("Wallet Address",style: TextStyle(color: Colors.white38,fontSize: 13,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(fetchDepModel.depositApiModel?.payoutAddress.toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                            SizedBox(width: 30),
                            InkWell(
                                onTap: (){
                                  Clipboard.setData(ClipboardData(text: fetchDepModel.depositApiModel?.payoutAddress.toString() ?? ""));
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






  Widget getMorDetails(){
    final fetchDepModel = Provider.of<DataClass>(context);
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          width:  Get.width,
          height: Get.height*0.42,
          decoration: BoxDecoration(
            color: Color(0xFF131313),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("Payout Extra Id",style: TextStyle(color: Colors.white38,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(fetchDepModel.depositApiModel?.payoutExtraId.toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                    InkWell(
                        onTap: (){
                          Clipboard.setData(ClipboardData(text: fetchDepModel.depositApiModel?.refundAddress.toString() ?? ""));
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

                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("From Currency",style: TextStyle(color: Colors.white38,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),
                    Text(fetchDepModel.depositApiModel?.fromCurrency.toUpperCase().toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                  ],
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("To Currency",style: TextStyle(color: Colors.white38,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                    Text(fetchDepModel.depositApiModel?.toCurrency.toUpperCase().toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),

                  ],
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Flow",style: TextStyle(color: Colors.white38,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                    Text(fetchDepModel.depositApiModel?.flow.toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                  ],
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Type",style: TextStyle(color: Colors.white38,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                    Text(fetchDepModel.depositApiModel?.type.toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),

                  ],
                ),


              ],
            ),
          ),

        ),

      ],
    );



  }




  Widget getResult(){
    final fetchDepModel = Provider.of<DataClass>(context);
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          width:  Get.width,
          height: Get.height*0.22,
          decoration: BoxDecoration(
            color: Color(0xFF131313),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text("Refund Address",style: TextStyle(color: Colors.white38,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(fetchDepModel.depositApiModel?.refundAddress.toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                    InkWell(
                        onTap: (){
                          Clipboard.setData(ClipboardData(text: fetchDepModel.depositApiModel?.refundAddress.toString() ?? ""));
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

                  ],
                ),
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Refund Extra ID:",style: TextStyle(color: Colors.white38,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                      Text(fetchDepModel.depositApiModel?.refundExtraId.toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),

                      InkWell(
                          onTap: (){
                            Clipboard.setData(ClipboardData(text: fetchDepModel.depositApiModel?.refundExtraId.toString() ?? ""));
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
        SizedBox(height: 20)
      ],
    );



  }


}
