import '/src/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 3,
      color: Colors.white,
      child: ClipOval(
        child: Container(
          height: 38,
          width: 38,
          color: Colors.white,
          child: const Center(
            child: SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(
                color: primaryColor,
                strokeWidth: 3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
