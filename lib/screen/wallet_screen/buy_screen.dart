import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class BuyScreen extends StatefulWidget {
  const BuyScreen({Key? key}) : super(key: key);

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  InAppWebViewController? _webViewController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Column(
        children: [
          SizedBox(height: 40),
          Container(
            width: Get.width,
            height: Get.height,
            child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse('https://global.transak.com/?apiKey=6d08ae84-3999-4364-a597-71e2d4e1a35a'),
                  headers: {},
                ),

                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    mediaPlaybackRequiresUserGesture: false,
                    //debuggingEnabled: true,
                  ),
                ),
                onWebViewCreated: (InAppWebViewController controller) {
                  _webViewController = controller;
                },
                androidOnPermissionRequest: (InAppWebViewController controller, String origin, List<String> resources) async {
                  return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
                }
            ),
          ),
        ],
      )
    );


  }
}
