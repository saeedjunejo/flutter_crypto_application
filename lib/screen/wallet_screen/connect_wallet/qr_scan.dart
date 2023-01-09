// import 'package:air_pay/utils/color.dart';
// import 'package:flutter/material.dart';
// import 'package:scan/scan.dart';
//
// class QRScanView extends StatefulWidget {
//   const QRScanView({Key? key}) : super(key: key);
//
//   @override
//   _QRScanViewState createState() => _QRScanViewState();
// }
//
// class _QRScanViewState extends State<QRScanView> {
//   final ScanController controller = ScanController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: customBlack,
//       body: Center(
//         child: ScanView(
//           controller: controller,
//           scanAreaScale: 1,
//           scanLineColor: Colors.green.shade400,
//           onCapture: (data) {
//             Navigator.pop(context, data);
//           },
//         ),
//       ),
//     );
//   }
// }
