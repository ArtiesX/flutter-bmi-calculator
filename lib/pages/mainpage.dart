import 'dart:math';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/input_bim.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  double? _h = 0;
  double? _w = 0;
  double _bimResult = 0;
  String textResult = "";
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('BIM CALCULATOR',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          )),
      centerTitle: true,
      actions: <Widget>[
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          FocusScope.of(context).unfocus();
        });
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: _buildAppBar(),
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'HEIGHT',
                        style: labelTextStyle,
                      ),
                      InputCard(
                        cardChild: Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            style: inputTextStyle,
                            textAlign: TextAlign.center,
                            controller: _height,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: 'Your Height in cm',
                                hintStyle: inputTextStyle,
                                filled: true,
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'WEIGHT',
                        style: labelTextStyle,
                      ),
                      InputCard(
                        cardChild: Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            style: inputTextStyle,
                            textAlign: TextAlign.center,
                            controller: _weight,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: 'Your weight in kg',
                                filled: true,
                                hintStyle: inputTextStyle,
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    height: double.infinity,
                    width: size.width * 0.9,
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: inactiveCardColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Text(
                              'Your Result',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                    top: 30,
                                  ),
                                  child: Text(
                                    _bimResult.toStringAsFixed(2),
                                    style: const TextStyle(
                                      fontSize: 32.0,
                                      color: Colors.white,
                                    ),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Text(
                                    textResult,
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                      color: Color(0xFF8D8E98),
                                    ),
                                  ))
                            ],
                          )
                          // Visibility(
                          //   visible: textResult.isNotEmpty,
                          //   child: Column(
                          //     children: [
                          //       Padding(
                          //         padding: const EdgeInsets.only(
                          //           top: 30,
                          //         ),
                          //         child: Text(
                          //           _bimResult.toStringAsFixed(2),
                          //           style: const TextStyle(
                          //             fontSize: 32,
                          //             color: Colors.white,
                          //           ),
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.only(top: 40),
                          //         child: Text(
                          //           textResult,
                          //           style: const TextStyle(
                          //             color: Color(0xFF8D8E98),
                          //             fontSize: 24,
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    )),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    calculateBmi();
                    if (_bimResult < 18.5) {
                      textResult = "You are under weight";
                    } else if (_bimResult >= 18.5 && _bimResult <= 24.9) {
                      textResult = "You have normal weight";
                    } else if (_bimResult >= 25 && _bimResult <= 29.9) {
                      textResult = "You are over weight";
                    } else {
                      textResult = "You are more over weight.";
                    }
                  });
                },
                child: Container(
                  color: const Color(0xffff1965),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 80,
                  child: const Center(
                    child: Text('CALCULATE',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 28,
                        )),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void calculateBmi() {
    setState(() {
      print(_height.text);
      print(_weight.text);
      _h = double.parse(_height.text);
      _w = double.parse(_weight.text);
      _bimResult = _w! / pow(_h! / 100, 2);
      double bmi = _bimResult;
      _bimResult = bmi;
    });
  }
}
