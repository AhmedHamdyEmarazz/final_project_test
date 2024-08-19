import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
// final controller2 = TextEditingController();
  final TextEditingController controller;
  final String hintText;
  bool eye;
  Widget icon;
  String? Function(String?)? validator;
  // validator;
  CustomTextField(
      {this.eye = false,
      required this.controller,
      required this.hintText,
      this.validator,
      required this.icon,
      super.key});
  GlobalKey<FormState> formkey2 = GlobalKey<FormState>();

// CustomTextField();
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

bool showw = false;

class _CustomTextFieldState extends State<CustomTextField> {
  final controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        label: Text(widget.hintText),
        prefixIcon: widget.icon,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 10),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          gapPadding: 4.0,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          gapPadding: 4.0,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          gapPadding: 4.0,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          gapPadding: 4.0,
        ),
        suffixIcon: widget.eye
            ? IconButton(
                onPressed: () {
                  setState(() {
                    showw = !showw;
                  });
                },
                icon: Icon(!showw ? Icons.visibility : Icons.visibility_off))
            : null,
      ),
      // label: Text(widget.label)),
      obscureText: widget.eye ? showw : false,
    );
  }
}
