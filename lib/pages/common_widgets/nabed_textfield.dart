import 'package:flutter/material.dart';

class NabedTextField extends StatefulWidget {
  const NabedTextField({
    Key? key,
    this.hintText,
    this.onChanged,
    this.isSuffixIcon,
    this.initialValue,
    this.context,
    this.hintColor,
    this.textEditingController,
    this.useObscure = false,
    this.onTab,
    this.keyboardType,
    this.focusNode,
    this.validator,
  }) : super(key: key);

  final String? hintText;
  final bool useObscure;
  final bool? isSuffixIcon;
  final BuildContext? context;
  final Color? hintColor;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final String? initialValue;
  final Function? onTab;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;

  @override
  _NabedTextFieldState createState() => _NabedTextFieldState();
}

class _NabedTextFieldState extends State<NabedTextField> {
  bool showPassword = false;
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType ?? TextInputType.text,
      focusNode: widget.focusNode ?? _focusNode,
      onTap: widget.onTab as void Function()?,

      // ignore: avoid_bool_literals_in_conditional_expressions
      obscureText: widget.useObscure ? !showPassword : false,
      validator: widget.validator,
      onChanged: widget.onChanged,
      initialValue: widget.initialValue,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        labelText: widget.hintText!,
        labelStyle: TextStyle(
          height: 0.5,
          color: widget.hintColor ?? Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: widget.isSuffixIcon == true
            ? IconButton(
                onPressed: () => setState(
                    () => showPassword = !showPassword), //widget.onPressed,
                icon: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black),
              )
            : null,
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();

    super.dispose();
  }
}

// Widget mawahebTextField({
//   String hintText,
//   bool isSuffixIcon,
//   Function onPressed,
//   bool showPassword,
//   BuildContext context,
//   Color hintColor,
//   TextEditingController textEditingController,
// }) {
//   return TextFormField(
//     // ignore: avoid_bool_literals_in_conditional_expressions
//     obscureText: showPassword == null ? false : !showPassword,

//     controller: textEditingController,
//     decoration: InputDecoration(
//       enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//       hintText: context.translate(hintText),
//       hintStyle: TextStyle(color: hintColor ?? Colors.black, fontWeight: FontWeight.w200, fontFamily: 'Poppins'),
//       suffixIcon: isSuffixIcon == true
//           ? IconButton(
//               onPressed: onPressed,
//               icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility, color: Colors.black),
//             )
//           : null,
//     ),
//   );
// }
