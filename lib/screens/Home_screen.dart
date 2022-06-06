import 'package:bmi_calculator/constants/color_type.dart';
import 'package:bmi_calculator/widgets/background_shape_left.dart';
import 'package:bmi_calculator/widgets/background_shape_right.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final weightContoroller = TextEditingController();
  final heightContoroller = TextEditingController();

  double resultBMI = 0;
  String resultText = '';
  double widthGood = 100;
  double widthBad = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'تو چنده BMI?',
          style: TextStyle(color: bmi_colors().bmiDarkBlue),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: weightContoroller,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: bmi_colors().bmiBlue,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'وزن(kg)',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: heightContoroller,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: bmi_colors().bmiBlue,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'قد(cm)',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: () {
                final weight = double.parse(weightContoroller.text);
                final height = double.parse(heightContoroller.text);
                setState(() {
                  resultBMI = weight / (height * height);
                  if (resultBMI > 25) {
                    widthGood = 50;
                    widthBad = 300;
                    resultText = 'شما اضافه وزن دارید';
                  } else if (resultBMI >= 18.5 && resultBMI <= 25) {
                    widthGood = 300;
                    widthBad = 50;
                    resultText = 'وزن شما نرمال است';
                  } else if (resultBMI < 18.5) {
                    widthGood = 20;
                    widthBad = 20;
                    resultText = 'وزن شما از حالت نرمال کمتر است';
                  }
                });
              },
              child: Text(
                '! محاسبه کن ',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: bmi_colors().bmiDarkBlue,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              '${resultBMI.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: bmi_colors().bmiBlueLight,
              ),
            ),
            SizedBox(height: 30),
            Text(
              '${resultText}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: bmi_colors().ShapeRed,
              ),
            ),
            SizedBox(height: 20),
            RightShape(width: widthBad),
            SizedBox(height: 15),
            LeftShape(width: widthGood),
          ],
        ),
      ),
    );
  }
}
