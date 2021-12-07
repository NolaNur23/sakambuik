import 'package:flutter/material.dart';
import 'package:sakambuik/componen/text_field_container.dart';

class RoundedInputField extends StatefulWidget {
  final String hintText, isi;
  // final Initial
  final TextEditingController editInput;
  final IconData icon;
  final Color cursorColor;
  final bool hide;
  final TextInputType keyType;
  final ValueChanged<String> onSaved;
  final ValueChanged<String> validator;
  final InputDecoration inDecoration;
  final ValueChanged<String> onChange;
  const RoundedInputField({
    Key key,
    this.hide = false,
    this.editInput,
    this.keyType,
    this.hintText,
    this.isi,
    this.inDecoration,
    this.validator,
    this.onSaved,
    this.cursorColor,
    this.icon = Icons.person,
    this.onChange,
  }) : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  TextEditingController editInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        initialValue: widget.isi,
        controller: editInput,
        obscureText: widget.hide,
        cursorColor: widget.cursorColor,
        decoration: widget.inDecoration,
        onChanged: widget.onChange,
        keyboardType: widget.keyType,
        validator: widget.validator,
      ),
    );
  }
}
