//
// import 'dart:async';
//
// import 'package:chart_sparkline/chart_sparkline.dart';
// import 'package:flutter/material.dart';
// class graph extends StatefulWidget {
//   const graph({Key? key}) : super(key: key);
//
//   @override
//   State<graph> createState() => _graphState();
// }
//
// class _graphState extends State<graph> {
//
//
//   var data = [23.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
//   @override
//   void initState(){
//     setState(() {;
//       //data.reversed;
//      // data.addAll([-100,200,-60,-50]);
//
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: 700.0,
//           height: 100.0,
//           decoration: BoxDecoration(
//             color: Colors.black
//           ),
//           child: Sparkline(
//             data: data,
//             fillMode: FillMode.below,
//             pointsMode: PointsMode.all,
//             pointSize: 5.0,
//             pointColor: Colors.amber,
//             fillGradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [Colors.red, Colors.white38],
//             ),
//           ),
//         ),
//       ));
//   }
// }
//
//
//
//
//
//
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// // import 'package:air_pay/screen/api_model/data_get.dart';
// // import 'package:flutter_spinkit/flutter_spinkit.dart';
// // import 'package:provider/provider.dart';
// // import 'package:flutter/material.dart';
// //
// //
// // class ProviderDemoScreen extends StatefulWidget {
// //   const ProviderDemoScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   _ProviderDemoScreenState createState() => _ProviderDemoScreenState();
// // }
// //
// // class _ProviderDemoScreenState extends State<ProviderDemoScreen> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     final postModel = Provider.of<DataClass>(context, listen: false);
// //     postModel.getPostData();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final postModel = Provider.of<DataClass>(context);
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Provider Demo"),
// //       ),
// //       body: Container(
// //         padding: EdgeInsets.all(20),
// //         child: postModel.loading?Center(
// //           child: Container(
// //             child: SpinKitThreeBounce(
// //               itemBuilder: (BuildContext context, int index) {
// //                 return DecoratedBox(
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(15),
// //                     color: index.isEven ? Colors.red : Colors.green,
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //         ):
// //         Center(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Container(
// //                 margin: EdgeInsets.only(top: 40, bottom: 20),
// //                 child: Text(postModel.post?.priceCrypto.toDouble().toString() ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
// //                 ),
// //               ),
// //               Container(
// //                 margin: EdgeInsets.only(top: 40, bottom: 20),
// //                 child: Text(postModel.post?.athCrypto.toDouble().toString() ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
// //               ),
// //
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //
// //
// //
// //
// //
// //
// //
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// //
// //
// // class UserList extends StatelessWidget{
// //
// //   final String apiUrl = "https://randomuser.me/api/?results=10";
// //
// //   Future<List<dynamic>> fetchUsers() async {
// //
// //     var result = await http.get(Uri.parse(apiUrl));
// //     return json.decode(result.body)['results'];
// //
// //   }
// //
// //   String _name(dynamic user){
// //     return user['name']['title'] + " " + user['name']['first'] + " " +  user['name']['last'];
// //
// //   }
// //
// //   String _location(dynamic user){
// //     return user['location']['country'];
// //   }
// //
// //   String _age(Map<dynamic, dynamic> user){
// //     return "Age: " + user['dob']['age'].toString();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('User List'),
// //       ),
// //       body: Container(
// //         child: FutureBuilder<List<dynamic>>(
// //           future: fetchUsers(),
// //           builder: (BuildContext context, AsyncSnapshot snapshot) {
// //             if(snapshot.hasData){
// //               print(_age(snapshot.data[0]));
// //               return ListView.builder(
// //                   padding: EdgeInsets.all(8),
// //                   itemCount: snapshot.data.length,
// //                   itemBuilder: (BuildContext context, int index){
// //                     return
// //                       Card(
// //                         child: Column(
// //                           children: <Widget>[
// //                             ListTile(
// //                               leading: CircleAvatar(
// //                                   radius: 30,
// //                                   backgroundImage: NetworkImage(snapshot.data[index]['picture']['large'])),
// //                               title: Text(_name(snapshot.data[index])),
// //                               subtitle: Text(_location(snapshot.data[index])),
// //                               trailing: Text(_age(snapshot.data[index])),
// //                             )
// //                           ],
// //                         ),
// //                       );
// //                   });
// //             }else {
// //               return Center(child: CircularProgressIndicator());
// //             }
// //           },
// //
// //
// //         ),
// //       ),
// //     );
// //   }
// //
// // }
//
//
//
//
//
// // import 'dart:async';
// //
// // import 'package:flutter/material.dart';
// //
// //
// //
// //
// // class IconStepperDemo extends StatefulWidget {
// //   @override
// //   _IconStepperDemo createState() => _IconStepperDemo();
// // }
// //
// // class _IconStepperDemo extends State<IconStepperDemo> {
// //   late Timer _timer;
// //   int _start = 30;
// //
// //   void startTimer() {
// //     const oneSec = const Duration(seconds: 1);
// //     _timer = new Timer.periodic(
// //       oneSec,
// //           (Timer timer) {
// //         if (_start == 0) {
// //           setState(() {
// //             timer.cancel();
// //           });
// //         } else {
// //           setState(() {
// //             _start--;
// //           });
// //         }
// //       },
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     _timer.cancel();
// //     super.dispose();
// //   }
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Timer test")),
// //       body: Column(
// //         children: <Widget>[
// //           RaisedButton(
// //             onPressed: () {
// //               startTimer();
// //             },
// //             child: Text("start"),
// //           ),
// //           Text("$_start")
// //         ],
// //       ),
// //     );
// //   }
//
//   /// Returns the next button.
//   // Widget nextButton() {
//   //   return ElevatedButton(
//   //     onPressed: () {
//   //       // Increment activeStep, when the next button is tapped. However, check for upper bound.
//   //       if (activeStep < upperBound) {
//   //         setState(() {
//   //           activeStep++;
//   //         });
//   //       }
//   //     },
//   //     child: Text('Next'),
//   //   );
//   // }
//   //
//   // /// Returns the previous button.
//   // Widget previousButton() {
//   //   return ElevatedButton(
//   //     onPressed: () {
//   //       // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
//   //       if (activeStep > 0) {
//   //         setState(() {
//   //           activeStep--;
//   //         });
//   //       }
//   //     },
//   //     child: Text('Prev'),
//   //   );
//   // }
//   //
//   // /// Returns the header wrapping the header text.
//   // Widget header() {
//   //   return Container(
//   //     decoration: BoxDecoration(
//   //       color: Colors.orange,
//   //       borderRadius: BorderRadius.circular(5),
//   //     ),
//   //     child: Row(
//   //       children: [
//   //         Padding(
//   //           padding: const EdgeInsets.all(8.0),
//   //           child: Text(
//   //             headerText(),
//   //             style: TextStyle(
//   //               color: Colors.black,
//   //               fontSize: 20,
//   //             ),
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   // Returns the header text based on the activeStep.
//   // String headerText() {
//   //   switch (activeStep) {
//   //     case 1:
//   //       return 'Preface';
//   //
//   //     case 2:
//   //       return 'Table of Contents';
//   //
//   //     case 3:
//   //       return 'About the Author';
//   //
//   //     case 4:
//   //       return 'Publisher Information';
//   //
//   //     case 5:
//   //       return 'Reviews';
//   //
//   //     case 6:
//   //       return 'Chapters #1';
//   //
//   //     default:
//   //       return 'Introduction';
//   //
//   //   }
//   // }
// //}
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // class stepper extends StatefulWidget {
// //   const stepper({Key? key}) : super(key: key);
// //
// //   @override
// //   State<stepper> createState() => _stepperState();
// // }
// //
// // class _stepperState extends State<stepper> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body:  Column(
// //         children: [
// //           Container(
// //             height: 200,
// //             width: Get.width,
// //             child: Stepper(
// //               type: StepperType.horizontal,
// //               steps: [
// //                 Step(title: Text("saeed"), content: Container()),
// //                 Step(title: Text("ahmed"), content: Container()),
// //                 Step(title: Text("junejo"), content: Container())
// //               ],
// //
// //             ),
// //           ),
// //         ],
// //       )
// //     );
// //   }
// // }
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
// // import 'package:flutter/material.dart';
// // import 'package:marquee_widget/marquee_widget.dart';
// //
// //
// //
// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Marquee Home Page'),
// //       ),
// //       body: GridView.count(
// //         crossAxisCount: 2,
// //         childAspectRatio: 0.7,
// //         children: <Widget>[
// //           GridTile(
// //             child: Card(
// //               child: Column(
// //                 children: <Widget>[
// //                   Expanded(
// //                       child: Image.network(
// //                         'https://i.pinimg.com/564x/9d/a6/36/9da636b9e60ea40b18921b0053b7d486.jpg',
// //                         fit: BoxFit.fitHeight,
// //                         filterQuality: FilterQuality.high,
// //                       )),
// //                   Marquee(
// //                     child: Text(
// //                       'Flutter is a free and open source Google mobile UI . ',
// //                       style: TextStyle(fontSize: 16),
// //                     ),
// //                     autoRepeat: false,
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           GridTile(
// //             child: Card(
// //               child: Column(
// //                 children: <Widget>[
// //                   Expanded(
// //                       child: Image.network(
// //                         'https://cdn-images-1.medium.com/max/1000/1*upTyVPOfBb0c4o1r57C9_w.png',
// //                         fit: BoxFit.fitHeight,
// //                         width: 50,
// //                         height: 10,
// //                         filterQuality: FilterQuality.high,
// //                       )),
// //                   Marquee(
// //                       child: Text(
// //                         'Flutter is a free and open source Google mobile UI. ',
// //                         style: TextStyle(fontSize: 16),
// //                       )),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           GridTile(
// //             child: Card(
// //               child: Column(
// //                 children: <Widget>[
// //                   Expanded(
// //                       child: Marquee(
// //                           child: Container(
// //                               width: 1000,
// //                               child: Image.network(
// //                                 'https://i.pinimg.com/564x/9d/a6/36/9da636b9e60ea40b18921b0053b7d486.jpg',
// //                                 fit: BoxFit.fitWidth,
// //                                 filterQuality: FilterQuality.high,
// //                               )))),
// //                   Marquee(
// //                       child: Text(
// //                         'Flutter is a free and open source Google mobile UI... ',
// //                         style: TextStyle(fontSize: 16),
// //                       )),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           GridTile(
// //             child: Card(
// //               child: Column(
// //                 children: <Widget>[
// //                   Marquee(
// //                       textDirection: TextDirection.rtl,
// //                       directionMarguee: DirectionMarguee.oneDirection,
// //                       child: Container(
// //                         width: 1000,
// //                         child: Column(
// //                           children: <Widget>[
// //                             Container(
// //                                 width: 1000,
// //                                 height: 260,
// //                                 child: Image.network(
// //                                   'https://cdn-images-1.medium.com/max/1000/1*upTyVPOfBb0c4o1r57C9_w.png',
// //                                   fit: BoxFit.fitWidth,
// //                                   filterQuality: FilterQuality.high,
// //                                 )),
// //                             Text(
// //                               'Flutter is a free and open source Google mobile UI ',
// //                               style: TextStyle(fontSize: 16),
// //                             ),
// //                           ],
// //                         ),
// //                       )),
// //                 ],
// //               ),
// //             ),
// //           ),
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //         ],
// //       ),
// //     );
// //   }
// // }
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
//
//
//
//
// // import 'package:air_pay/screen/api_model/data_get.dart';
// // import 'package:air_pay/utils/color.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // class Estimate extends StatefulWidget {
// //   const Estimate({Key? key}) : super(key: key);
// //
// //   @override
// //   State<Estimate> createState() => _EstimateState();
// // }
// //
// // class _EstimateState extends State<Estimate> {
// //
// //
// //   @override
// //   void initState() {
// //     final postModel = Provider.of<DataClass>(context, listen: false);
// //     postModel.getAirData();
// //     super.initState();
// //   }
// //
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     final postModelAir = Provider.of<DataClass>(context);
// //     return Scaffold(
// //       backgroundColor: customBlack,
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //
// //           Center(child: Text(postModelAir.exchApiModel?.estdAmount.toDouble().toString() ?? "",style: TextStyle(color: Colors.white,fontSize: 15))),
// //
// //
// //
// //         ],
// //       ),
// //
// //
// //
// //     );
// //
// //   }
// // }
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
// // import 'dart:convert';
// //
// // import 'package:flutter/gestures.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:simple_candlestick_chart/simple_candlestick_chart.dart';
// //
// //
// // class CustomScrollBehavior extends MaterialScrollBehavior {
// //   const CustomScrollBehavior();
// //
// //   @override
// //   Set<PointerDeviceKind> get dragDevices => {
// //     PointerDeviceKind.touch,
// //     PointerDeviceKind.mouse,
// //   };
// // }
// //
// // class App extends StatefulWidget {
// //   const App({Key? key}) : super(key: key);
// //
// //   @override
// //   State<App> createState() => _AppState();
// // }
// //
// // class _AppState extends State<App> {
// //   var data = <CandlestickData>[];
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     rootBundle.loadString('assets/data.json').then((json) {
// //       CandlestickData map(item) => CandlestickData(
// //         DateTime.fromMillisecondsSinceEpoch(item['time'] * 1000),
// //         item['open'].toDouble(),
// //         item['high'].toDouble(),
// //         item['low'].toDouble(),
// //         item['close'].toDouble(),
// //         item['vol'].toDouble(),
// //       );
// //       final items = jsonDecode(json) as List<dynamic>;
// //       setState(() {
// //         data = items.map<CandlestickData>(map).toList().reversed.toList();
// //       });
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       body: Column(children: [
// //         SizedBox(
// //           height: 300,
// //           child: SimpleCandlestickChart(
// //             data: data,
// //             increaseColor: Colors.teal,
// //             decreaseColor: Colors.pinkAccent,
// //             physics: const BouncingScrollPhysics(),
// //           ),
// //         ),
// //       ]),
// //     );
// //   }
// // }


import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome to Proto Coder Point, Please do subscribe Now'),
      ),
    );
  }
}