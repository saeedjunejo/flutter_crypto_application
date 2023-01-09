import 'dart:convert';
import 'package:air_pay/screen/wallet_screen/deposit_crypto/confirm_deposit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../utils/components.dart';
import '../../api_model/data_get.dart';
import 'package:http/http.dart'as http;

class DepositScreen extends StatefulWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  final fromCrDep =TextEditingController();
  final toCrDep =TextEditingController();
  final amSendCrDep =TextEditingController();
  final addressCrDep =TextEditingController();
  final reddrCrDep=TextEditingController();


  String? _mySelecDeposit;
  List dataDeposit = [];

  String? _mySelectGetDeposit;
  List dataGetDeposit = [];

  Future<dynamic> getSendData() async {

    try {
      final response = await http.get(Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"),);

      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        setState(() {
          dataDeposit=item;
        });
      }
    } catch (e) {
      print(e);
    }
    return "Sucess";
  }

  Future<dynamic> getData() async {

    try {
      final response = await http.get(Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"),);

      if (response.statusCode == 200) {
        final itemGet = json.decode(response.body);
        setState(() {
          dataGetDeposit =itemGet;
        });}
    } catch (e) {
      print(e);
    }
    return "Sucess";

  }

  bool display= false;

  @override
  void initState() {
    this.getSendData();
    this.getData();
    super.initState();
  }
  var youGetDeposit='1.93011';

  @override
  Widget build(BuildContext context) {
    final postModelAir = Provider.of<DataClass>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: customBlack,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 40),
              InkWell(
                onTap: (){
                  //Get.to(()=>WalletScreen());
                  Navigator.pop(context);
                  Navigator.pop(context);

                },
                child: Container(
                  width: 35,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Color(0xFF191919),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Icon(Icons.arrow_back,color: Colors.white),
                ),
              ),


              SizedBox(height: 25),
              Center(child: Text("Air Pay Deposit Crypto ",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))),


              SizedBox(height: 50),
              Container(
                width:  Get.width,
                height: Get.height*0.10,
                color: Color(0xFF0c0c0c),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Container(
                        width: Get.width*0.55,
                        height: Get.height*0.10,
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
                              Text("You send",style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w400)),
                              TextField(
                                controller: amSendCrDep,
                                onChanged: (e){
                                  final postModel = Provider.of<DataClass>(context, listen: false);
                                  postModel.getAirData(e,_mySelecDeposit.toString(),_mySelectGetDeposit.toString());
                                  //print("saeed${postModelAir.exchApiModel?.estdAmount.toDouble().toString() ?? ""}");
                                  setState(() {
                                    youGetDeposit = postModelAir.exchApiModel?.estdAmount.toDouble().toString() ?? "";

                                  });
                                },
                                style: TextStyle(
                                    fontFamily: 'Quicksand',fontWeight: FontWeight.w600,
                                    color: Colors.white
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:"0.1",
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

                      // CustomExchange(
                      //   width: Get.width*0.55,
                      //   height: Get.height*0.10,
                      //   title: "You send",
                      //   hintText: '0.1',
                      //   controller: amSendCrDep,
                      // ),
                      dataDeposit.isNotEmpty? DropdownButtonHideUnderline(child: DropdownButton(
                          dropdownColor: Colors.black,
                          items: dataDeposit.map((item) {
                            return new DropdownMenuItem(
                              value: item['symbol'].toString(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle
                                    ),
                                    height: 30,
                                    width: 30,
                                    child: Image.network(item['image']),
                                  ),
                                  SizedBox(width: 10),
                                  Text(item['symbol'].toString().toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                ],
                              ),

                            );
                          }).toList(),
                          hint: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle
                                ),
                                height: 30,
                                width: 30,
                                child: Image.network(dataDeposit[0]['image']),
                              ),
                              SizedBox(width: 10),
                              Text(dataDeposit[0]['symbol'].toString().toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          onChanged: (String? newVal) {
                            setState(() {
                              _mySelecDeposit = newVal;
                             // print(_mySelection);
                            });
                          },
                          value: _mySelecDeposit,
                        ),):Padding(padding: const EdgeInsets.only(right: 30), child: Center(child: SizedBox(width:25,height:25,child: CircularProgressIndicator(color: Colors.blue))))




                    ],
                  ),
                ),

              ),


              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("  No extra fee",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                  SizedBox(height: 5),
                  Text("  Estimated rate of ${_mySelecDeposit?.toUpperCase().toString()} -- ${_mySelectGetDeposit?.toUpperCase().toString()}",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                ],
              ),


              SizedBox(height: 20),
              Container(
                width:  Get.width,
                height: Get.height*0.10,
                color: Color(0xFF0c0c0c),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      youGetDeposit.isNotEmpty?
                      CustomGet(
                        width: Get.width*0.55,
                        height: Get.height*0.10,
                        title: "You get",
                        hintText: youGetDeposit,
                      ):Padding(padding:EdgeInsets.only(left: 30), child: Center(child: SizedBox(width:25,height:25,child: CircularProgressIndicator(color: Colors.blue)))),
                      dataGetDeposit.isNotEmpty?DropdownButtonHideUnderline(
                        child: DropdownButton(
                          dropdownColor: Colors.black,
                          items: dataGetDeposit.map((item) {
                            return new DropdownMenuItem(
                              value: item['symbol'].toString(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle
                                    ),
                                    height: 30,
                                    width: 30,
                                    child: Image.network(item['image']),
                                  ),
                                  SizedBox(width: 10),
                                  Text(item['symbol'].toString().toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                ],
                              ),

                            );
                          }).toList(),
                          hint: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle
                                ),
                                height: 30,
                                width: 30,
                                child: Image.network(dataGetDeposit[1]['image']),
                              ),
                              SizedBox(width: 10),
                              Text(dataGetDeposit[1]['symbol'].toString().toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          onChanged: (String? newVal) {
                            setState(() {
                              _mySelectGetDeposit = newVal;
                            });
                          },
                          value: _mySelectGetDeposit,
                        ),
                      ) : Padding(padding: const EdgeInsets.only(right: 30), child: Center(child: SizedBox(width:25,height:25,child: CircularProgressIndicator(color: Colors.blue))),)

                    ],
                  ),
                ),

              ),


              SizedBox(height: 25),
              CustomExchange(
                width: Get.width,
                height: Get.height*0.10,
                title: "Recipients Wallet",
                hintText: 'Enter Payout address',
                controller: addressCrDep,
              ),

              SizedBox(height: 25),
              InkWell(
                onTap: (){
                  setState(() {
                    display=!display;});
                },
                child: Text("  Advance Setting",style: TextStyle(color: Colors.white38,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
              ),
              display ? refundDeposit():




              SizedBox(height: 30),
              CustomButton(
                height: Get.height * 0.08,
                width: Get.width,
                text: 'Deposit Crypto',
                fontSize: Get.height * 0.025,
                onPressed: () async {
                  if (amSendCrDep.text.isEmpty||addressCrDep.text.isEmpty){
                    Fluttertoast.showToast(
                        msg: "Enter all details",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.SNACKBAR,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Color(0xFF1E272E),
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }else{
                    //apiFetch();
                    Get.to(()=>ConfirmDeposit(amountDeposit: amSendCrDep.text, addressDeposit: addressCrDep.text, refundAddrDeposit: reddrCrDep.text, toDeposit: _mySelectGetDeposit.toString(), fromDeposit: _mySelecDeposit.toString(),));
                  }

                },
              ),

              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/check.png",width: 13,height: 13),
                  SizedBox(width: 10),
                  Text("Fast, secure, anonymous",style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))
                ],
              ),


              SizedBox(height: 40),
              Center(child: SvgPicture.asset("assets/icons/logo.svg",width: 30,height: 30)),


              SizedBox(height: 40),
              Center(child: Text("TERMS OF USE PRIVACY POLICY ",style: TextStyle(color: Colors.white,fontSize: 8,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))),

              SizedBox(height: 10),



            ],
          ),
        ),
      ),
    );
  }



















  Widget refundDeposit(){

    return Column(
      children: [
        SizedBox(height: 20),

        CustomExchange(
          width: Get.width,
          height: Get.height*0.10,
          title: "Refund Wallet",
          hintText: 'Enter refund address',
          controller: reddrCrDep,
        ),

        SizedBox(height: 30),

      ],
    );
  }
}
