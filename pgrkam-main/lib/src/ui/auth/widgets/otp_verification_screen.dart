// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../utils/color_utils.dart';
// import '../../../utils/no_overscroll_behavior.dart';
// import '../auth_page_model.dart';
// import 'widgets.dart';

// class OtpVerificationScreen extends ConsumerWidget {
//   const OtpVerificationScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final otp = ref.watch(
//       authPageModelProvider.select(
//         (_) => _.otp,
//       ),
//     );
//     final status = ref.watch(
//       authPageModelProvider.select(
//         (_) => _.status,
//       ),
//     );
//     return Column(
//       children: [
//         ScrollConfiguration(
//           behavior: NoOverscrollScrollBehavior(),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(height: 40),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     children: [
//                       const TitleDescription(
//                         title: 'Enter OTP',
//                         description: 'Enter the 4 digit sms code',
//                       ),
//                       const SizedBox(height: 35),
//                       const OtpTextField(),
//                       const SizedBox(height: 30),
//                       Cta(
//                         label: 'LOGIN',
//                         onPressed: status == AuthPageStatus.processingVerifyOtp
//                             ? () {}
//                             : ref
//                                 .read(authPageModelProvider.notifier)
//                                 .verifyOtp,
//                         isProcessing: otp.length == 4 &&
//                                 status == AuthPageStatus.processingVerifyOtp
//                             ? true
//                             : false,
//                       ),
//                       const SizedBox(height: 25),
//                       Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             'Didn\'t receive a code?',
//                             style: GoogleFonts.rubik(
//                               fontWeight: FontWeight.w400,
//                               fontSize: 15,
//                               letterSpacing: 0.2,
//                               color: const Color(0xFF555555),
//                             ),
//                           ),
//                           const _ResendOtpButton(),
//                         ],
//                       ),
//                       const SizedBox(height: 50),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _ResendOtpButton extends ConsumerWidget {
//   const _ResendOtpButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return CupertinoButton(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 6,
//         vertical: 6,
//       ),
//       onPressed: ref.read(authPageModelProvider.notifier).resendOtp,
//       child: ref.watch(
//         authPageModelProvider.select(
//           (_) => _.status == AuthPageStatus.processingResendOtp,
//         ),
//       )
//           ? Theme(
//               data: ThemeData(
//                 primarySwatch: ColorUtils.generateMaterialColor(
//                   Colors.white,
//                 ),
//               ),
//               child: const SizedBox(
//                 width: 20,
//                 height: 20,
//                 child: CircularProgressIndicator.adaptive(),
//               ),
//             )
//           : Text(
//               'Resend',
//               style: GoogleFonts.roboto(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 15,
//                 letterSpacing: 0.2,
//                 color: const Color(0xFF1878f3),
//               ),
//             ),
//     );
//   }
// }
