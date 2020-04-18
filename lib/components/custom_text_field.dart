import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    @required this.controller,
    @required this.focusNode,
    @required this.keyboardType,
    @required this.textInputAction,
    @required this.title,
    @required this.onEditingComplete,
    this.obscureText,
    this.changeObscureText,
    this.errorText,
    Key key,
  }) : super(key: key);

  final bool obscureText;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String title;
  final Function onEditingComplete;
  final Function changeObscureText;
  final TextEditingController controller;
  final String Function() errorText;

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextField(
            style: const TextStyle(
              color: Colors.black,
            ),
            focusNode: focusNode,
            cursorColor: Colors.grey,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            controller: controller,
            decoration: CustomInputDecoration(title: title),
            onEditingComplete: onEditingComplete,
            obscureText: obscureText ?? false,
          ),
          if (obscureText != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: changeObscureText,
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            )
          else
            Container()
        ],
      );
}

class CustomInputDecoration extends InputDecoration {
  const CustomInputDecoration({
    this.title,
  }) : super(
          labelText: "$title",
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        );

  final String title;
}
