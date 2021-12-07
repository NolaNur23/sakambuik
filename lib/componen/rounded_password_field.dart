import 'package:flutter/material.dart';
import 'package:sakambuik/componen/text_field_container.dart';
import 'package:sakambuik/constant.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> validator;
  final TextEditingController editInputPass;
  final InputDecoration inDecoration;
  // final IconData iconPass;
  const RoundedPasswordField({
    Key key,
    this.editInputPass,
    this.onChanged,
    this.inDecoration,
    this.validator,
  }) : super(key: key);
  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool hide = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // bool hide = true;
    return Form(
      key: _formKey,
      child: TextFieldContainer(
          child: TextFormField(
              controller: widget.editInputPass,
              obscureText: hide,
              validator: widget.validator,
              onChanged: widget.onChanged,
              cursorColor: BlueSambuik,
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(
                    hide ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      hide = !hide;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 1.5,
                  ),
                ),
              ))),
    );
  }
}
