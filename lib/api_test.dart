// // import 'package:flutter/material.dart';
// // import 'package:public_address_wallet/public_address_wallet.dart';
// //
// //
// //
// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({Key? key, required this.title}) : super(key: key);
// //
// //   final String title;
// //
// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   String publicAddress = "8c5fc401f2b8b9c2327fc64af379e751c37cb722ff797c5635922dc15670a4a6";
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             if (publicAddress.isNotEmpty) ...{
// //               const Text("Public address in wallet:"),
// //               Text(
// //                 publicAddress,
// //                 style: const TextStyle(fontWeight: FontWeight.bold),
// //               )
// //             },
// //             TextButton(
// //                 onPressed: () => startConnect(Wallet.metamask),
// //                 child: const Text('Start Connect Metamask')),
// //             TextButton(
// //                 onPressed: () => startConnect(Wallet.trustWallet),
// //                 child: const Text('Start Connect Trust Wallet')),
// //             TextButton(
// //                 onPressed: () => startConnect(Wallet.rainbowMe),
// //                 child: const Text('Start Connect Rainbow'))
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   startConnect(Wallet wallet) async {
// //     final connector = WalletConnector(
// //         AppInfo(name: "Mobile App", url: "https://example.mobile.com"));
// //     setState(() {
// //       publicAddress = '8c5fc401f2b8b9c2327fc64af379e751c37cb722ff797c5635922dc15670a4a6';
// //     });
// //     var address =
// //     await connector.publicAddress(wallet: wallet).catchError((onError) {
// //       print(onError);
// //       throw onError;
// //     });
// //     print(address);
// //     // in case you want open wallet by your self
// //     // connector.initSession((uri) {
// //     //   print(uri);
// //     // });
// //     setState(() {
// //       publicAddress = address;
// //     });
// //   }
// // }
// //
// //
// //
// // // import 'dart:convert';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/services.dart';
// // // import 'package:simple_candlestick_chart/simple_candlestick_chart.dart';
// // //
// // //
// // //
// // // class App extends StatefulWidget {
// // //   const App({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<App> createState() => _AppState();
// // // }
// // //
// // // class _AppState extends State<App> {
// // //   var data = <CandlestickData>[];
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     rootBundle.loadString('assets/data.json').then((json) {
// // //       CandlestickData map(item) => CandlestickData(
// // //         DateTime.fromMillisecondsSinceEpoch(item['time'] * 1000),
// // //         item['open'].toDouble(),
// // //         item['high'].toDouble(),
// // //         item['low'].toDouble(),
// // //         item['close'].toDouble(),
// // //         item['vol'].toDouble(),
// // //       );
// // //       final items = jsonDecode(json) as List<dynamic>;
// // //       setState(() {
// // //         data = items.map<CandlestickData>(map).toList().reversed.toList();
// // //       });
// // //     });
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.black,
// // //       body: Column(
// // //           children: [
// // //
// // //             SizedBox(height: 100),
// // //             SizedBox(
// // //               height: 300,
// // //               child: SimpleCandlestickChart(
// // //                 data: data,
// // //                 increaseColor: Colors.teal,
// // //                 decreaseColor: Colors.pinkAccent,
// // //                 physics: const BouncingScrollPhysics(),
// // //               ),
// // //             ),
// // //
// // //           ]),
// // //     );
// // //   }
// // // }
//
//
//
// import 'package:flutter/material.dart';
//
// class Todo {
//   final String title;
//   final String description;
//
//   const Todo(this.title, this.description);
// }
//
// void main() {
//   runApp(
//     MaterialApp(
//       title: 'Passing Data',
//       home: TodosScreen(
//         todos: List.generate(
//           20,
//               (i) => Todo(
//             'Todo $i',
//             'A description of what needs to be done for Todo $i',
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
// class TodosScreen extends StatelessWidget {
//   const TodosScreen({Key? key, required this.todos});
//
//   final List<Todo> todos;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Todos'),
//       ),
//       body: ListView.builder(
//         itemCount: todos.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(todos[index].title),
//             // When a user taps the ListTile, navigate to the DetailScreen.
//             // Notice that you're not only creating a DetailScreen, you're
//             // also passing the current todo through to it.
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const DetailScreen(),
//                   // Pass the arguments as part of the RouteSettings. The
//                   // DetailScreen reads the arguments from these settings.
//                   settings: RouteSettings(
//                     arguments: todos[index],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class DetailScreen extends StatelessWidget {
//   const DetailScreen({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     final todo = ModalRoute.of(context)!.settings.arguments as Todo;
//
//     // Use the Todo to create the UI.
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(todo.title),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Text(todo.description),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
//
// import 'package:ramp_flutter/ramp_flutter.dart';
//
// // void main() {
// //   runApp(const RampFlutterApp());
// // }
//
// class RampFlutterApp extends StatefulWidget {
//   const RampFlutterApp({Key? key}) : super(key: key);
//
//   @override
//   State<RampFlutterApp> createState() => _RampFlutterAppState();
// }
//
// class _RampFlutterAppState extends State<RampFlutterApp> {
//   final Configuration _configuration = Configuration();
//   final List<String> _environments = [
//     "https://ri-widget-dev.firebaseapp.com",
//     "https://ri-widget-staging.firebaseapp.com",
//     "https://buy.ramp.network",
//   ];
//
//   int _selectedEnvironment = 0;
//
//   @override
//   void initState() {
//     _configuration.fiatValue = "3";
//     _configuration.fiatCurrency = "EUR";
//     _configuration.defaultAsset = "ETH";
//     _configuration.userAddress = "0x4b7f8e04b82ad7f9e4b4cc9e1f81c5938e1b719f";
//     _configuration.hostAppName = "Ramp Flutter";
//     _configuration.deepLinkScheme = 'rampflutter';
//
//     super.initState();
//   }
//
//   void _selectEnvironment(int id) {
//     setState(() => _selectedEnvironment = id);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _configuration.url = _environments[_selectedEnvironment];
//
//     return PlatformApp(
//       home: PlatformScaffold(
//         appBar: PlatformAppBar(title: const Text('Ramp Flutter')),
//         body: Builder(
//           builder: (context) => ListView(children: _formFields(context)),
//         ),
//         iosContentPadding: false,
//         iosContentBottomPadding: false,
//       ),
//     );
//   }
//
//   List<Widget> _formFields(BuildContext context) {
//     return [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           PlatformButton(
//             onPressed: () => _selectEnvironment(0),
//             child: const Text("dev"),
//           ),
//           PlatformButton(
//             onPressed: () => _selectEnvironment(1),
//             child: const Text("staging"),
//           ),
//           PlatformButton(
//             onPressed: () => _selectEnvironment(2),
//             child: const Text("production"),
//           ),
//         ],
//       ),
//       PlatformText(
//         _environments[_selectedEnvironment],
//         style: const TextStyle(color: Color.fromRGBO(46, 190, 117, 1)),
//       ),
//       _textField(
//         "User email address",
//             (text) => _configuration.userEmailAddress = text,
//         _configuration.userEmailAddress,
//       ),
//       _textField(
//         "Fiat value",
//             (text) => _configuration.fiatValue = text,
//         _configuration.fiatValue,
//       ),
//       _textField(
//         "Fiat currency",
//             (text) => _configuration.fiatCurrency = text,
//         _configuration.fiatCurrency,
//       ),
//       _textField(
//         "Default asset",
//             (text) => _configuration.defaultAsset = text,
//         _configuration.defaultAsset,
//       ),
//       _textField(
//         "User address",
//             (text) => _configuration.userAddress = text,
//         _configuration.userAddress,
//       ),
//       _textField(
//         "Host app name",
//             (text) => _configuration.hostAppName = text,
//         _configuration.hostAppName,
//       ),
//       PlatformButton(
//         onPressed: () {
//           RampFlutter.showRamp(
//             _configuration,
//                 (purchase, token, apiUrl) =>
//                 _showSnackBar(context, "Purchase created"),
//                 () => _showSnackBar(context, "Ramp widget closed"),
//                 () => _showSnackBar(context, "Ramp widget failed"),
//           );
//         },
//         child: const Text("Show Ramp"),
//       ),
//     ];
//   }
//
//   PlatformTextField _textField(String placeholder,
//       void Function(String) onChanged, String? defaultValue) {
//     return PlatformTextField(
//       hintText: placeholder,
//       onChanged: onChanged,
//       controller: TextEditingController(text: defaultValue),
//     );
//   }
//
//   void _showSnackBar(BuildContext context, String text) {
//     showPlatformDialog(
//       context: context,
//       builder: (_) => PlatformAlertDialog(
//         title: const Text('Alert'),
//         content: Text(text),
//         actions: <Widget>[
//           PlatformDialogAction(
//             child: PlatformText('Cancel'),
//             onPressed: () => Navigator.pop(context),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Firebase extends StatefulWidget {
  const Firebase({Key? key}) : super(key: key);

  @override
  State<Firebase> createState() => _FirebaseState();
}

class _FirebaseState extends State<Firebase> {

  // FirebaseUser user;
  // Future<void> getUserData() async{
  //
  //   FirebaseUser userData= await FirebaseAuth.instance.currentUser();
  //   setState(() {
  //     user=userData;
  //     print(userData.uid);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){},
              child: Text("Click me",style: TextStyle(color: Colors.red)),
            )

    ],));
  }
}
