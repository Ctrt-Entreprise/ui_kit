import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

import 'item_stepper.dart';

class CtrtStepper extends StatefulWidget {
  final List<String> stepperHeaders;
  final List<Widget> stepperContents;
  final Function() handleNext;
  final Function() handlePrev;
  int currentSteppe;
  CtrtStepper({
    super.key,
    required this.stepperHeaders,
    required this.stepperContents,
    required this.handleNext,
    required this.handlePrev,
    this.currentSteppe = 0,
  });

  @override
  State<CtrtStepper> createState() => _CtrtStepperState();
}

class _CtrtStepperState extends State<CtrtStepper> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: CtrtColors.transparentGrey, width: 2),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.only(top: 1),
            scrollDirection: Axis.horizontal,
            children: [
              for (var i = 0; i < widget.stepperHeaders.length; i++)
                ItemStepper(
                  labelle: widget.stepperHeaders[i],
                  level: '${i + 1}',
                  conpleted: widget.currentSteppe > i || widget.currentSteppe == (widget.stepperHeaders.length - 1),
                ),
            ],
          ),
        ),
        Expanded(
          child: Form(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: widget.stepperContents[widget.currentSteppe],
            ),
          ),
        ),
        Container(
          height: 45,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CtrtOutlineButton(
                onClick: widget.handlePrev,
                text: "Précédent",
                paddingV: 1,
                color: CtrtColors.btnError,
              ),
              CtrtOutlineButton(
                onClick: widget.handleNext,
                text: "Suivant",
                paddingV: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
