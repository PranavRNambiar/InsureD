import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insured/homepage.dart';

import '../model/wallet.dart';
import '../res/palette.dart';
import '../screens/dashboard_page.dart';
import '../widgets/wallet_info_page/seed_widget.dart';

class WalletInfoPage extends StatefulWidget {
  final Wallet wallet;

  const WalletInfoPage({@required this.wallet});

  @override
  _WalletInfoPageState createState() => _WalletInfoPageState();
}

class _WalletInfoPageState extends State<WalletInfoPage> {
  Wallet _wallet;

  @override
  void initState() {
    super.initState();

    _wallet = widget.wallet;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 32.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontFamily: 'Montserrat',
                      letterSpacing: 1,
                    ),
                    children: [
                      TextSpan(
                        text: 'insureD',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 32.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(),
                    Text(
                      'Your wallet address :',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      _wallet.pkh,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      ' Generated seed phrase :',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    SeedWidget(seed: _wallet.mnemonic),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      bottom: 8.0,
                    ),
                    child: Text(
                      'Copy or write the address and mnemonic down and store it in some place safe',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      bottom: 32.0,
                    ),
                    child: Text(
                      '(can be imported to other devices later)',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                ),
                child: Container(
                  width: double.maxFinite,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                        ModalRoute.withName('/'),
                      );
                    },
                    color: Color(0xff4336f1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        bottom: 16.0,
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
