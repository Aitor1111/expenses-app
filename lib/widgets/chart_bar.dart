import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double pctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.pctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text('${spendingAmount.toStringAsFixed(0)}'),
          ),
        ),
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              heightFactor: pctOfTotal,
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ]),
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
