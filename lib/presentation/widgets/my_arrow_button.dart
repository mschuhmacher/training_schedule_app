import 'package:flutter/material.dart';
import 'package:training_schedule_app/presentation/widgets/row_selection.dart';

class MyArrowButton extends StatelessWidget {
  const MyArrowButton({required this.icon, this.size = 30, super.key});

  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    final iconSize = 2 * size / 3;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Opacity(
        opacity: 0.75,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: cardColor,
            boxShadow: [
              BoxShadow(
                spreadRadius: .5,
                blurRadius: 5,
                offset: Offset.fromDirection(1, 5),
              ),
            ],
          ),
          child: SizedBox(
            width: size,
            height: size,
            child: Icon(icon, size: iconSize),
          ),
        ),
      ),
    );
  }
}
