// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../utils/color.dart';
// import 'display_screen.dart';
//
//
// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }
//
// class _NotificationScreenState extends State<NotificationScreen> {
//   bool isChecked = false;
//   bool isChecked1 = false;
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
//                 Text("Notifications",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
//
//               ],
//             ),
//             SizedBox(height: 50),
//             theme("Notifications", "Enabled"),
//             SizedBox(height: 15),
//             Row(
//               children: [
//                 Container(
//                   width: 30,
//                   child:  Checkbox(
//                     value: isChecked,
//                     side: BorderSide(color: Colors.grey),
//                     onChanged: (bool? value) {
//                       setState(() {
//                         isChecked = value!;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Text("Withdrawals", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12)),
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
//                     onChanged: (bool? value) {
//                       setState(() {
//                         isChecked1 = value!;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Text("Deposits", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12)),
//               ],
//             ),
//
//               ],
//             ),
//       ),
//     );
//   }
// }
