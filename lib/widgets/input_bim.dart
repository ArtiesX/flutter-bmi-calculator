import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final Widget? cardChild;
  const InputCard({Key? key, required this.cardChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: cardChild,
    );
  }
}
