import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/wallet.dart';
import '../res/palette.dart';
import '../screens/receive_page.dart';
import 'package:tezster_dart/tezster_dart.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Wallet _wallet;
  String _amountString;
  final String server = 'https://rpcalpha.tzbeta.net';
  final double currentValue = 2.52;

  getBalance(String walletAddress) async {
    String balance = await TezsterDart.getBalance(
      walletAddress,
      server, // testnet address
    );

    setState(() {
      _amountString = (double.parse(balance) / 1000000).toStringAsFixed(2);
    });
  }

  @override
  void initState() {
    super.initState();

    final walletBox = Hive.box<Wallet>('wallet');
    _wallet = walletBox.get(0);

    _amountString = (double.parse(_wallet.amount) / 1000000).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(height: 50),
          Row(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wallet Balance',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _amountString,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 50.0,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Container(
                    height: 50.0,
                    child: Image.asset(
                      'assets/tezoslogo.png',
                      scale: 50,
                    ),
                  )
                ],
              ),
              SizedBox(height: 24.0),
              Text(
                'Wallet address',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  letterSpacing: 1,
                ),
              ),
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
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RaisedButton(
                onPressed: () {},
                color: Color(0xff4336f1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReceivePage(str: _wallet.pkh),
                    ),
                  );
                },
                color: Color(0xff4336f1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'Receive',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 28.0),
          RaisedButton(
            onPressed: () {},
            color: Color(0xff4336f1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
              ),
              child: Text(
                'Add Funds',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 48.0),
          Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 30.0,
                      child: Image.asset('assets/tezoslogo.png'),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _amountString + ' XTZ',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            (double.parse(_amountString) * currentValue)
                                    .toStringAsFixed(2) +
                                ' USD',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w300,
                              fontSize: 14.0,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '\$ $currentValue',
                          style: TextStyle(
                            color: Color(0xff4336f1),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
