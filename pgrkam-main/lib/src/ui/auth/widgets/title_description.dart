import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleDescription extends StatelessWidget {
  final String title;
  final String description;

  const TitleDescription({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.rubik(
            fontSize: 22,
            color: const Color(0xFF333333),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: GoogleFonts.rubik(
            fontSize: 14,
            letterSpacing: 0.0,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF555555),
          ),
        )
      ],
    );
  }
}
