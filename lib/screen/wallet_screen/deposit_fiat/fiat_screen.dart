// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import '../../../utils/color.dart';
// import '../../../utils/components.dart';
// import '../../api_model/data_get.dart';
// import 'package:http/http.dart' as http;
// import '../../api_model/http.dart';
//
//
// class FiatScreen extends StatefulWidget {
//   const FiatScreen({Key? key}) : super(key: key);
//
//   @override
//   State<FiatScreen> createState() => _FiatScreenState();
// }
//
// class _FiatScreenState extends State<FiatScreen> {
//   final fromCrFiat =TextEditingController();
//   final toCrFiat =TextEditingController();
//   final amSendCrFiat =TextEditingController();
//   final addressCrFiat =TextEditingController();
//   final refAdCrFiat=TextEditingController();
//
//
//   String? _mySelection;
//   List data = [];
//
//   String? _mySelectionGet;
//   List dataGet = [];
//
//   Future<dynamic> getSendData() async {
//
//     try {
//       final response = await http.get(Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"),);
//
//       if (response.statusCode == 200) {
//         final item = json.decode(response.body);
//         setState(() {
//           data=item;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//     return "Sucess";
//   }
//
//   Future<dynamic> getData() async {
//
//     try {
//       final response = await http.get(Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"),);
//
//       if (response.statusCode == 200) {
//         final itemGet = json.decode(response.body);
//         setState(() {
//           dataGet =itemGet;
//         });}
//     } catch (e) {
//       print(e);
//     }
//     return "Sucess";
//
//   }
//
//   bool display= false;
//
//   @override
//   void initState() {
//     this.getSendData();
//     this.getData();
//     final postModel = Provider.of<DataClass>(context, listen: false);
//     //postModel.getAirData();
//     super.initState();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final postModelAir = Provider.of<DataClass>(context);
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: customBlack,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 15,right: 15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               SizedBox(height: 40),
//               InkWell(
//                 onTap: (){
//                   Navigator.pop(context);
//
//                 },
//                 child: Container(
//                   width: 35,
//                   height: 30,
//                   decoration: BoxDecoration(
//                       color: Color(0xFF191919),
//                       borderRadius: BorderRadius.circular(5)
//                   ),
//                   child: Icon(Icons.arrow_back,color: Colors.white),
//                 ),
//               ),
//
//               SizedBox(height: 25),
//               Center(child: Text("Air Pay Deposit Fiat",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Quicksand',fontWeight: FontWeight.w600))),
//
//               SizedBox(height: 50),
//               Container(
//                 width:  Get.width,
//                 height: Get.height*0.10,
//                 color: Color(0xFF0c0c0c),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 0,right: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//
//                       CustomExchange(
//                         width: Get.width*0.55,
//                         height: Get.height*0.10,
//                         title: "You send",
//                         hintText: '0.1',
//                         controller: amSendCrFiat,
//                       ),
//                       data.isNotEmpty? DropdownButtonHideUnderline(
//                         child: DropdownButton(
//                           dropdownColor: Colors.black,
//                           items: data.map((item) {
//                             return new DropdownMenuItem(
//                               value: item['symbol'].toString(),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Container(
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle
//                                     ),
//                                     height: 30,
//                                     width: 30,
//                                     child: Image.network(item['image']),
//                                   ),
//                                   SizedBox(width: 10),
//                                   Text(item['symbol'].toString().toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
//                                 ],
//                               ),
//
//                             );
//                           }).toList(),
//                           onChanged: (String? newVal) {
//                             setState(() {
//                               _mySelection = newVal;
//                               print(_mySelection);
//                             });
//                           },
//                           value: _mySelection,
//                         ),
//                       ):Padding(padding: const EdgeInsets.only(right: 30), child: Center(child: SizedBox(width:25,height:25,child: CircularProgressIndicator(color: Colors.blue))))
//
//
//
//
//                     ],
//                   ),
//                 ),
//
//               ),
//
//               SizedBox(height: 20),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("  No extra fee",style: TextStyle(color: Colors.white,fontSize: 15)),
//                   SizedBox(height: 5),
//                   Text("  Estimated rate ",style: TextStyle(color: Colors.white,fontSize: 15)),
//                 ],
//               ),
//
//
//               SizedBox(height: 20),
//               Container(
//                 width:  Get.width,
//                 height: Get.height*0.10,
//                 color: Color(0xFF0c0c0c),
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//
//                       CustomGet(
//                         width: Get.width*0.55,
//                         height: Get.height*0.10,
//                         title: "You get",
//                         hintText: postModelAir.exchApiModel?.estdAmount.toDouble().toString() ?? "",
//                       ),
//                       dataGet.isNotEmpty?DropdownButtonHideUnderline(
//                         child: DropdownButton(
//                           dropdownColor: Colors.black,
//                           items: dataGet.map((item) {
//                             return new DropdownMenuItem(
//                               value: item['symbol'].toString(),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Container(
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle
//                                     ),
//                                     height: 30,
//                                     width: 30,
//                                     child: Image.network(item['image']),
//                                   ),
//                                   SizedBox(width: 10),
//                                   Text(item['symbol'].toString().toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
//                                 ],
//                               ),
//
//                             );
//                           }).toList(),
//                           onChanged: (String? newVal) {
//                             setState(() {
//                               _mySelectionGet = newVal;
//                             });
//                           },
//                           value: _mySelectionGet,
//                         ),
//                       ) : Padding(padding: const EdgeInsets.only(right: 30), child: Center(child: SizedBox(width:25,height:25,child: CircularProgressIndicator(color: Colors.blue))),)
//
//                     ],
//                   ),
//                 ),
//
//               ),
//
//
//               SizedBox(height: 30),
//               CustomExchange(
//                 width: Get.width,
//                 height: Get.height*0.10,
//                 title: "Recipients Wallet",
//                 hintText: 'Enter Payout address',
//                 controller: addressCrFiat,
//               ),
//
//
//               SizedBox(height: 25),
//               InkWell(
//                 onTap: (){
//                   setState(() {
//                     display=!display;});
//                 },
//                 child: Text("  Advance Setting",style: TextStyle(color: Colors.white38,fontSize: 15,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
//               ),
//               display ? refundFiat():
//
//
//
//
//               SizedBox(height: 30),
//               CustomButton(
//                 height: Get.height * 0.08,
//                 width: Get.width,
//                 text: 'Deposit Fiat',
//                 fontSize: Get.height * 0.025,
//                 onPressed: () async {
//                   if (amSendCrFiat.text.isEmpty||addressCrFiat.text.isEmpty){
//                     Fluttertoast.showToast(
//                         msg: "Enter all details",
//                         toastLength: Toast.LENGTH_SHORT,
//                         gravity: ToastGravity.SNACKBAR,
//                         timeInSecForIosWeb: 1,
//                         backgroundColor: Color(0xFF1E272E),
//                         textColor: Colors.white,
//                         fontSize: 16.0
//                     );
//                   }else{
//                    // fetchData();
//                   }
//
//                 },
//               ),
//
//               SizedBox(height: 40),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset("assets/icons/check.png",width: 13,height: 13),
//                   SizedBox(width: 10),
//                   Text("Fast, secure, anonymous",style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))
//                 ],
//               ),
//
//
//               SizedBox(height: 40),
//               Center(child: SvgPicture.asset("assets/icons/logo.svg",width: 30,height: 30)),
//
//               SizedBox(height: 40),
//               Center(child: Text("TERMS OF USE PRIVACY POLICY ",style: TextStyle(color: Colors.white,fontSize: 8,fontFamily: 'Quicksand',fontWeight: FontWeight.w400))),
//
//               SizedBox(height: 10),
//
//
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//   Widget refundFiat(){
//
//     return Column(
//       children: [
//         SizedBox(height: 25),
//
//         CustomExchange(
//           width: Get.width,
//           height: Get.height*0.10,
//           title: "Refund Wallet",
//           hintText: 'Enter refund address',
//           controller: refAdCrFiat,
//         ),
//
//         SizedBox(height: 30),
//
//       ],
//     );
//   }
// }
