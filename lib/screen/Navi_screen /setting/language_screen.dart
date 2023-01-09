// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../utils/color.dart';
// import 'display_screen.dart';
// class LanguageScreen extends StatefulWidget {
//   const LanguageScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LanguageScreen> createState() => _LanguageScreenState();
// }
//
// class _LanguageScreenState extends State<LanguageScreen> {
//
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
//                 Text("Language",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
//
//               ],
//             ),
//             SizedBox(height: 50),
//             theme("Language", "English"),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
