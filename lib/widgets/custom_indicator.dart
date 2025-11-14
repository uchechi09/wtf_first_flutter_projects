import 'package:flutter/material.dart';

class Customeindicator extends StatelessWidget {
  const Customeindicator({super.key, 
    required this.indicatorCount,
    required this.activeindex,
  });
  final int indicatorCount;
  final int activeindex;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        indicatorCount,
        (index) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: activeindex == index ? Colors.blue : Colors.blue.shade200,
          ),
          height: 10,
          width: 10,
        ),
      ),
    );
  }
}
