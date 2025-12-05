// import '/src/ui/auth/auth_page_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:otp_text_field/otp_text_field.dart';
// import 'package:otp_text_field/style.dart';

// class OtpTextField extends ConsumerStatefulWidget {
//   const OtpTextField({
//     Key? key,
//   }) : super(key: key);

//   @override
//   ConsumerState createState() => _OtpTextFieldState();
// }

// class _OtpTextFieldState extends ConsumerState<OtpTextField> {
//   late final OtpFieldController _controller;
//   final FocusNode focusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     _controller = OtpFieldController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const otpLength = 6;

//     return RawKeyboardListener(
//       onKey: (value) async {
//         if (value.data.logicalKey.keyLabel == "Backspace" &&
//             value.runtimeType.toString() == 'RawKeyDownEvent') {
//           if (focusNode.children.first != FocusManager.instance.primaryFocus) {
//             // move to previous field if current field doesn't have any data
//             final currentFocusedIndex = focusNode.children
//                 .toList()
//                 .indexWhere((_) => _ == FocusManager.instance.primaryFocus);
//             // clear the current position
//             _controller.setValue(
//               '',
//               currentFocusedIndex,
//             );
//             focusNode.requestFocus(
//                 focusNode.children.toList()[currentFocusedIndex - 1]);
//           } else {
//             _controller.setValue('', 0);
//             _controller.clear();
//           }
//         } else if (['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
//             .contains(value.data.logicalKey.keyLabel)) {
//           final currentFocusedIndex = focusNode.children
//               .toList()
//               .indexWhere((_) => _ == FocusManager.instance.primaryFocus);
//           debugPrint('currentFocusedIndex: $currentFocusedIndex');
//           final enteredOtp = ref.read(authPageModelProvider).otp;
//           debugPrint('OTP length: ${enteredOtp.length}');
//           debugPrint('OTP : "$enteredOtp"');
//           if (currentFocusedIndex == enteredOtp.length - 1) {
//             if (currentFocusedIndex + 1 < otpLength) {
//               focusNode.requestFocus(
//                   focusNode.children.toList()[currentFocusedIndex + 1]);
//             }
//           } else {
//             _controller.setValue(
//               value.data.logicalKey.keyLabel,
//               currentFocusedIndex,
//             );
//           }
//         }
//       },
//       focusNode: focusNode,
//       child: OTPTextField(
//         onCompleted: (value) {
//           ref.read(authPageModelProvider.notifier).setOtp(value);
//           ref.read(authPageModelProvider.notifier).verifyOtp();
//         },
//         length: otpLength,
//         width: 320,
//         spaceBetween: 5,
//         fieldWidth: 40,
//         outlineBorderRadius: 100,
//         style: GoogleFonts.nunito(
//           fontSize: 18,
//           fontWeight: FontWeight.w700,
//           color: const Color(0xFF111111),
//         ),
//         textFieldAlignment: MainAxisAlignment.spaceBetween,
//         controller: _controller,
//         fieldStyle: FieldStyle.box,
//         otpFieldStyle: OtpFieldStyle(
//           backgroundColor: Colors.white,
//         ),
//         onChanged: ref.read(authPageModelProvider.notifier).setOtp,
//         contentPadding: const EdgeInsets.only(
//           top: 15,
//           left: 2,
//         ),
//       ),
//     );
//   }
// }
