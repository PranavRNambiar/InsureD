import 'package:flutter/material.dart';
import 'package:insured/Models/operations/revelation_penalty.dart';

class RevelationView extends StatelessWidget {
  const RevelationView({Key key, this.operation}) : super(key: key);
  final RevelationPenaltyOperation operation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  color: Colors.grey[300],
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      operation.getType.toUpperCase(),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Text('Baker Address : ${operation.baker.address}'),
              Text('Lost Reward: ${operation.lostReward}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text(operation.timestamp)],
              )
            ],
          ),
        ),
      ),
    );
  }
}
