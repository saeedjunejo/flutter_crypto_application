// import 'package:air_pay/utils/color.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class DisplayScreen extends StatefulWidget {
//   const DisplayScreen({Key? key}) : super(key: key);
//
//   @override
//   State<DisplayScreen> createState() => _DisplayScreenState();
// }
//
// class _DisplayScreenState extends State<DisplayScreen> {
//   bool isChecked = false;
//   bool isChecked1 = false;
//   bool isChecked2= false;
//   bool isChecked3 = false;
//   bool isChecked4 = false;
//   bool isChecked5 = false;
//   bool isChecked6 = false;
//   bool isChecked7 = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: customBlack,
//       body: Padding(
//         padding: const EdgeInsets.only(left: 15,right: 15),
//         child: Column(
//           children: [
//             SizedBox(height: 30),
//             Row(
//               children: [
//                 InkWell(
//                   onTap: () => Get.back(),
//                   child: Icon(Icons.arrow_back_ios,color: Colors.white),
//                 ),
//                 SizedBox(width: 20),
//                 Text("Display",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
//
//               ],
//             ),
//             SizedBox(height: 50),
//             theme("Theme", "Dark Mode"),
//             SizedBox(height: 15),
//             Row(
//               children: [
//                 Container(
//                   width: 30,
//                   child:  Checkbox(
//                     value: isChecked,
//                     side: BorderSide(color: Colors.grey),
//                     onChanged: (bool? value) { // This is where we update the state when the checkbox is tapped
//                       setState(() {
//                         isChecked = value!;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Text("Show price change since midnight UTC instead\n of 24h changes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12)),
//               ],
//             ),
//             SizedBox(height: 5),
//             Row(
//               children: [
//                 Container(
//                   width: 30,
//                   child:  Checkbox(
//                     value: isChecked1,
//                     side: BorderSide(color: Colors.grey),
//                     onChanged: (bool? value) { // This is where we update the state when the checkbox is tapped
//                       setState(() {
//                         isChecked1 = value!;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Text("Require confirmation before placing orders", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12)),
//               ],
//             ),
//             SizedBox(height: 5),
//             Row(
//               children: [
//                 Container(
//                   width: 30,
//                   child:  Checkbox(
//                     value: isChecked2,
//                     side: BorderSide(color: Colors.grey),
//                     onChanged: (bool? value) { // This is where we update the state when the checkbox is tapped
//                       setState(() {
//                         isChecked2 = value!;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Text("Show orders from all markets", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12)),
//               ],
//             ),
//             SizedBox(height: 5),
//             Row(
//               children: [
//                 Container(
//                   width: 30,
//                   child:  Checkbox(
//                     value: isChecked3,
//                     side: BorderSide(color: Colors.grey),
//                     onChanged: (bool? value) { // This is where we update the state when the checkbox is tapped
//                       setState(() {
//                         isChecked3 = value!;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Text("Show positions from all markets", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12)),
//               ],
//             ),
//             SizedBox(height: 5),
//             Row(
//               children: [
//                 Container(
//                   width: 30,
//                   child:  Checkbox(
//                     value: isChecked4,
//                     side: BorderSide(color: Colors.grey),
//                     onChanged: (bool? value) { // This is where we update the state when the checkbox is tapped
//                       setState(() {
//                         isChecked4 = value!;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Text("Hide Share PnL popup upon closing position", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12)),
//               ],
//             ),
//             SizedBox(height: 5),
//             Row(
//               children: [
//                 Container(
//                   width: 30,
//                   child:  Checkbox(
//                     value: isChecked5,
//                     side: BorderSide(color: Colors.grey),
//                     onChanged: (bool? value) { // This is where we update the state when the checkbox is tapped
//                       setState(() {
//                         isChecked5 = value!;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Text("Hide position market close button", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12)),
//               ],
//             ),
//             SizedBox(height: 5),
//             Row(
//               children: [
//                 Container(
//                   width: 30,
//                   child:  Checkbox(
//                     value: isChecked6,
//                     side: BorderSide(color: Colors.grey),
//                     onChanged: (bool? value) { // This is where we update the state when the checkbox is tapped
//                       setState(() {
//                         isChecked6 = value!;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Text("Use local time zone for charts", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12)),
//               ],
//             ),
//             SizedBox(height: 5),
//             Row(
//               children: [
//                 Container(
//                   width: 30,
//                   child:  Checkbox(
//                     value: isChecked7,
//                     side: BorderSide(color: Colors.grey),
//                     onChanged: (bool? value) { // This is where we update the state when the checkbox is tapped
//                       setState(() {
//                         isChecked7 = value!;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Text("Advanced charts", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12)),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// Widget theme(String title,String theme){
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
//       SizedBox(height: 8),
//       Container(
//         width: Get.width,
//         height: 60,
//         decoration: BoxDecoration(
//           color: Color(0xFF31394E),
//           borderRadius: BorderRadius.circular(10)
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Text(theme,style: TextStyle(color: Colors.white,fontSize: 15)),
//         ),
//
//       )
//     ],
//   );
// }