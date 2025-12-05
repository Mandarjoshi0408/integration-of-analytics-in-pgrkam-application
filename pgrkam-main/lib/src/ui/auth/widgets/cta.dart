import '/src/utils/color_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Cta extends ConsumerWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isProcessing;

  const Cta({
    required this.label,
    required this.onPressed,
    required this.isProcessing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      onPressed: isProcessing ? null : onPressed,
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.green[900],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: isProcessing
              ? Theme(
                  data: ThemeData(
                    primarySwatch: ColorUtils.generateMaterialColor(
                      Colors.white,
                    ),
                  ),
                  child: const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator.adaptive(),
                  ),
                )
              : Text(
                  label,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                    fontSize: 15.5,
                  ),
                ),
        ),
      ),
    );
  }
}
