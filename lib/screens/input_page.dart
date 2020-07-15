import 'package:bmi/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/Gender_Card.dart';
import '../components/Reusable_Card.dart';
import '../components/Bottom_Button.dart';
import '../constants.dart';
import '../components/Round_Buttons.dart';
import 'package:bmi/bmi_calculator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selected;
  int height = 154;
  int age = 17;
  int weight = 49;

  void alert() {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          color: Colors.white,
        ),
      ),
      titleStyle: TextStyle(color: Colors.red, fontSize: 25.0),
    );
    Alert(
      context: context,
      style: alertStyle,
      title: "Alert",
      desc: "Please select a Gender.",
      buttons: [
        DialogButton(
          child: Text(
            'Ok',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          onPressed: () => Navigator.pop(context),
          width: 80,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Body-Mass-Index')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selected = GenderType.male;
                      });
                    },
                    cardChild: GenderCard(
                      icon: FontAwesomeIcons.mars,
                      gender: 'MALE',
                    ),
                    colour: selected == GenderType.male
                        ? kActiveColor
                        : kInactiveColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selected = GenderType.female;
                      });
                    },
                    cardChild: GenderCard(
                      icon: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                    ),
                    colour: selected == GenderType.female
                        ? kActiveColor
                        : kInactiveColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kTextLabelStyle,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'cm',
                        style: kTextLabelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kActiveSliderColor,
                      inactiveTrackColor: kInactiveSliderColor,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 13.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      label: '$height',
                      max: kMaxSlider,
                      min: kMinSlider,
                      activeColor: kActiveSliderColor,
                      inactiveColor: kInactiveSliderColor,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kTextLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIcon(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIcon(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age += 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kTextLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'kg',
                              style: kTextLabelStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIcon(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight -= 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIcon(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (selected == null) {
                alert();
              } else {
                Calculator calculate =
                    Calculator(weight: weight, height: height);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(
                      bmi: calculate.calculate(),
                      result: calculate.result(),
                      remark: calculate.remark(),
                    ),
                  ),
                );
              }
            },
            child: BottomButton(
              data: 'CALCULATE',
            ),
          ),
        ],
      ),
    );
  }
}
