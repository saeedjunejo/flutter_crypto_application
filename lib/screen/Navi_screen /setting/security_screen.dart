// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../utils/color.dart';
// import 'display_screen.dart';
//
// class SecurityScreen extends StatefulWidget {
//   const SecurityScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SecurityScreen> createState() => _SecurityScreenState();
// }
//
// class _SecurityScreenState extends State<SecurityScreen> {
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
//                 Text("Security",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
//
//               ],
//             ),
//             SizedBox(height: 50),
//             theme("Biometric authentication", "Never"),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
