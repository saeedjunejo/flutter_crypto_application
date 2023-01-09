import 'dart:convert';
import 'package:air_pay/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../utils/components.dart';
import 'package:http/http.dart' as http;
import '../../../api_model/data_get.dart';
import '../exchange api/exchange_confirm.dart';




class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({Key? key}) : super(key: key);


  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  final fromCrypto =TextEditingController();
  final toCrypto =TextEditingController();
  final amountSend =TextEditingController();
  final address =TextEditingController();
  final getAmount =TextEditingController();
  final refundaddress=TextEditingController();


  String? _mySelection; //="BTC";
  List data = [];

  String? _mySelectionGet;
  List dataGet = [];



  Future<dynamic> getSendData() async {

    try {
      final response = await http.get(Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"),);

      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        setState(() {
          data=item;
          _mySelection=data[0];
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
          dataGet =itemGet;
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
    //final postModel = Provider.of<DataClass>(context, listen: false);
    //postModel.getAirData();
    super.initState();
  }

  var  youget="1.9257093";

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
              children: [

                SizedBox(height: 30),
                Center(child: Image.asset("assets/icons/exchangeweb.png",width: 120,height: 120)),

                SizedBox(height: 20),
                Center(child: Text("Air Pay Exchange Crypto ",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))),

                SizedBox(height: 40),
                Container(
                  width:  Get.width,
                  height: Get.height*0.10,
                  color: Color(0xFF0c0c0c),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0,right: 10),
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
                                  controller: amountSend,
                                  onChanged: (e){
                                    final postModel = Provider.of<DataClass>(context, listen: false);
                                    postModel.getAirData(e,_mySelection.toString(),_mySelectionGet.toString());
                                  //  print("saeed${postModelAir.exchApiModel?.estdAmount.toDouble().toString() ?? ""}");
                                    setState(() {
                                      youget = postModelAir.exchApiModel?.estdAmount.toDouble().toString() ?? "";

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
                        //   controller: amountSend,
                        // ),
                        //
                        // Container(
                        //   width: Get.width*0.55,
                        //      height: Get.height*0.10,
                        //   child: TextField(
                        //
                        //     onChanged: (e){
                        //       final postModel = Provider.of<DataClass>(context, listen: false);
                        //       postModel.getAirData(e,_mySelection.toString(),_mySelectionGet.toString());
                        //       print("saeed${postModelAir.exchApiModel?.estdAmount.toDouble().toString() ?? ""}");
                        //       setState(() {
                        //         youget = postModelAir.exchApiModel?.estdAmount.toDouble().toString() ?? "";
                        //
                        //       });
                        //     },
                        //   ),
                        // ),


                        data.isNotEmpty? DropdownButtonHideUnderline(
                          child: DropdownButton(
                            dropdownColor: Colors.black,
                            items: data.map((item) {
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
                                  child: Image.network(data[0]['image']),
                                ),
                                SizedBox(width: 10),
                                Text(data[0]['symbol'].toString().toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                              ],
                            ),
                            onChanged: (String? newVal) {

                              setState(() {
                                _mySelection = newVal;
                                //print(_mySelection);
                              });
                            },
                            value: _mySelection,
                          ),
                        ):Padding(padding: const EdgeInsets.only(right: 30), child: Center(child: SizedBox(width:25,height:25,child: CircularProgressIndicator(color: Colors.blue))))




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
                    Text("  Estimated rate of ${_mySelection?.toUpperCase().toString()} -- ${_mySelectionGet?.toUpperCase().toString()}",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
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

                        youget.isNotEmpty? CustomGet(
                          width: Get.width*0.55,
                          height: Get.height*0.10,
                          title: "You get",
                          hintText: youget,
                        ):Padding(padding: EdgeInsets.only(left: 30), child: Center(child: SizedBox(width:25,height:25,child: CircularProgressIndicator(color: Colors.blue)))),
                        dataGet.isNotEmpty?DropdownButtonHideUnderline(
                          child: DropdownButton(
                            dropdownColor: Colors.black,
                            items: dataGet.map((item) {
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
                                  child: Image.network(dataGet[1]['image']),
                                ),
                                SizedBox(width: 10),
                                Text(dataGet[1]['symbol'].toString().toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                              ],
                            ),

                            onChanged: (String? newVal) {
                              setState(() {

                                _mySelectionGet = newVal;

                              });
                            },
                            value: _mySelectionGet,
                          ),
                        ) : Padding(padding: const EdgeInsets.only(right: 30), child: Center(child: SizedBox(width:25,height:25,child: CircularProgressIndicator(color: Colors.blue))),)

                      ],
                    ),
                  ),

                ),
                SizedBox(height: 30),


                CustomExchange(
                  width: Get.width,
                  height: Get.height*0.10,
                  title: "Recipients Wallet",
                  hintText: 'Enter Payout address',
                  controller: address,
                ),
                SizedBox(height: 20),

                InkWell(
                  onTap: (){
                    setState(() {
                      display=!display;});



                  },
                  child: Text("  Advance Setting",style: TextStyle(color: Colors.white38,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
                ),
                display ? refund():




                SizedBox(height: 30),
                CustomButton(
                  height: Get.height * 0.08,
                  width: Get.width,
                  text: 'Exchange Now',
                  fontSize: Get.height * 0.025,
                  onPressed: () async {

                    if (amountSend.text.isEmpty||address.text.isEmpty){

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
                      // fetchData(
                      // //  amountSend.text.toString(),address.text.toString(),
                      // );


                      // FirebaseFirestore.instance.collection("UserData").add({
                      //   "Transaction Id": postModelAir.exchangePost?.idExchange.toString().toUpperCase() ?? ""
                      // });

                      Get.to(() => ConfirmScreen(from: _mySelection.toString(), to: _mySelectionGet.toString(),amount: amountSend.text, address: address.text, refundAdress: refundaddress.text));
                    }

                  },

                ),



                SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/check.png",width: 20,height: 20),
                    SizedBox(width: 10),
                    Text("Fast, secure, anonymous",style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))
                  ],
                ),
                SizedBox(height: 50),


                Center(child: SvgPicture.asset("assets/icons/logo.svg",width: 30,height: 30)),
                SizedBox(height: 50),

                Center(child: Text("TERMS OF USE PRIVACY POLICY ",style: TextStyle(color: Colors.white,fontSize: 8,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))),
                SizedBox(height: 30),
                Center(child: Text("Developed by Renexcode ",style: TextStyle(color: Colors.white,fontSize: 6,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))),
                SizedBox(height: 30),



              ],
            ),
          ),
        ),
    );
  }



















  Widget refund(){

    return Column(
      children: [
        SizedBox(height: 20),

        CustomExchange(
          width: Get.width,
          height: Get.height*0.10,
          title: "Refund Wallet",
          hintText: 'Enter refund address',
          controller: refundaddress,
        ),

        SizedBox(height: 30),

      ],
    );
  }



}

