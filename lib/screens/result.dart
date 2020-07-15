import 'package:bmi/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/Bottom_Button.dart';
import '../components/Reusable_Card.dart';

class Result extends StatelessWidget {
  Result({@required this.bmi, @required this.result, @required this.remark});

  final String bmi;
  final String result;
  final String remark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Body-Mass-Index'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Your Result',
                    style: kResultHeadStyle,
                  ),
                  Text(
                    result.toUpperCase(),
                    style: kResultText,
                  ),
                  Text(
                    bmi,
                    style: kResultNumberStyle,
                  ),
                  Text(
                    'Normal BMI Range: 18.5 - 25 kg/m2',
                    textAlign: TextAlign.center,
                    style: kTextLabelStyle,
                  ),
                  Text(
                    remark,
                    textAlign: TextAlign.center,
                    style: kResultTextStyle,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: BottomButton(data: 'CALCULATE AGAIN')),
        ],
      ),
    );
  }
}
