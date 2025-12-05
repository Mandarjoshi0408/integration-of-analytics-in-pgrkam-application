import '/src/ui/auth/auth_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailTextField extends ConsumerStatefulWidget {
  const EmailTextField({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends ConsumerState<EmailTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: ref.read(authPageModelProvider).mobile,
    );
    _controller.addListener(() {
      ref.read(authPageModelProvider.notifier).setEmail(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: _controller,

        cursorColor: Colors.orange.withOpacity(0.6),
        decoration: InputDecoration(
          hintText: 'Enter email',
          hintStyle: GoogleFonts.rubik(
            color: const Color(0XFF777777),
            fontSize: 15.5,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w400,
          ),
          counterText: '',
          contentPadding: const EdgeInsets.fromLTRB(20, 18, 13, 18),
          filled: true,
          fillColor: const Color(0xFFf7f7f7),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFeeeeee),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange.withOpacity(0.6),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        style: GoogleFonts.rubik(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color(0XFF333333),
          letterSpacing: 1,
        ),

        // maxLength: 10,
      ),
    );
  }
}

class PasswordTextField extends ConsumerStatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends ConsumerState<PasswordTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: ref.read(authPageModelProvider).password,
    );
    _controller.addListener(() {
      ref.read(authPageModelProvider.notifier).setPassword(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: _controller,
        cursorColor: Colors.orange.withOpacity(0.6),
        decoration: InputDecoration(
          hintText: 'Enter password',
          hintStyle: GoogleFonts.rubik(
            color: const Color(0XFF777777),
            fontSize: 15.5,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w400,
          ),
          counterText: '',
          contentPadding: const EdgeInsets.fromLTRB(20, 18, 13, 18),
          filled: true,
          fillColor: const Color(0xFFf7f7f7),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFeeeeee),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange.withOpacity(0.6),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        style: GoogleFonts.rubik(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color(0XFF333333),
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class NameTextField extends ConsumerStatefulWidget {
  const NameTextField({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _NameTextFieldState();
}

class _NameTextFieldState extends ConsumerState<NameTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: ref.read(authPageModelProvider).name,
    );
    _controller.addListener(() {
      ref.read(authPageModelProvider.notifier).setName(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: _controller,
        cursorColor: Colors.orange.withOpacity(0.6),
        decoration: InputDecoration(
          hintText: 'Enter Name',
          hintStyle: GoogleFonts.rubik(
            color: const Color(0XFF777777),
            fontSize: 15.5,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w400,
          ),
          counterText: '',
          contentPadding: const EdgeInsets.fromLTRB(20, 18, 13, 18),
          filled: true,
          fillColor: const Color(0xFFf7f7f7),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFeeeeee),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange.withOpacity(0.6),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        style: GoogleFonts.rubik(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color(0XFF333333),
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class MobileTextField extends ConsumerStatefulWidget {
  const MobileTextField({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MobileTextFieldState();
}

class _MobileTextFieldState extends ConsumerState<MobileTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: ref.read(authPageModelProvider).mobile,
    );
    _controller.addListener(() {
      ref.read(authPageModelProvider.notifier).setMobile(
          _controller.text.trim().isEmpty ? 0 : int.parse(_controller.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: _controller,
        cursorColor: Colors.orange.withOpacity(0.6),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Enter Mobile Number',
          hintStyle: GoogleFonts.rubik(
            color: const Color(0XFF777777),
            fontSize: 15.5,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w400,
          ),
          counterText: '',
          contentPadding: const EdgeInsets.fromLTRB(20, 18, 13, 18),
          filled: true,
          fillColor: const Color(0xFFf7f7f7),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFeeeeee),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange.withOpacity(0.6),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        maxLength: 10,
        style: GoogleFonts.rubik(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color(0XFF333333),
          letterSpacing: 1,
        ),
      ),
    );
  }
}
