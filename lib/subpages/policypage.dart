import 'package:flutter/material.dart';

class PolicyPage extends StatefulWidget {
  @override
  _PolicyPageState createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  List<String> policies = ['policy1', 'policy2', 'policy3'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: TabBar(
              labelColor: Colors.black,
              tabs: [
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Explore policies')),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Purchased Policies'))
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green[100]),
                  );
                },
              ),
              Expanded(
                  child: Column(children: [
                Container(
                  height: 200,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent),
                )
              ]))
            ],
          ),
        ));
  }
}
