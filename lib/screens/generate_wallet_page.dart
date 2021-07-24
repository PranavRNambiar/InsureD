import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/wallet.dart';
import '../res/palette.dart';
import '../screens/wallet_info_page.dart';

class GenerateWalletPage extends StatefulWidget {
  @override
  _GenerateWalletPageState createState() => _GenerateWalletPageState();
}

class _GenerateWalletPageState extends State<GenerateWalletPage> {
  InAppWebViewController webView;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 140),
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 4.0),
                      Expanded(
                          child: Text(
                        "We are generating some test tezos to setup your account",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          letterSpacing: 1,
                        ),
                      )),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "After verifiying the captcha click on the download button setup your insurance account on the tezos blockchain",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: InAppWebView(
                initialUrl: 'https://faucet.tzalpha.net/',
                initialHeaders: {},
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    // debuggingEnabled: true,
                    useOnDownloadStart: true,
                  ),
                ),
                onWebViewCreated: (InAppWebViewController controller) {
                  webView = controller;
                },
                onLoadStart: (InAppWebViewController controller, String url) {},
                onLoadStop: (InAppWebViewController controller, String url) {},
                onDownloadStart: (controller, url) async {
                  var rawJson = Uri.decodeFull(url.split(',')[1]);
                  Wallet newWallet = Wallet.fromJson(jsonDecode(rawJson));

                  print(newWallet.amount);

                  // Store in Hive
                  Hive.box<Wallet>('wallet').add(newWallet);

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('isAvailable', true);

                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => WalletInfoPage(
                        wallet: newWallet,
                      ),
                    ),
                    ModalRoute.withName('/'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
