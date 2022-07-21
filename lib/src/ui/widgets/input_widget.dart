import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatefulWidget {
  final List<TextInputFormatter>? textInputFormatter;

  final int? maxLength;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String text;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final double valueSize;
  const InputWidget(
      {Key? key,
      this.textInputFormatter,
      this.maxLength,
      this.validator,
      required this.controller,
      required this.text,
      required this.textCapitalization,
      required this.keyboardType,
      required this.textInputAction,
      required this.valueSize})
      : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: SizedBox(
            width: size.width * widget.valueSize,
            child: TextFormField(
                cursorColor: const Color(0xff00b689),
                controller: widget.controller,
                validator: widget.validator,
                textCapitalization: widget.textCapitalization,
                keyboardType: widget.keyboardType,
                textInputAction: TextInputAction.next,
                inputFormatters: widget.textInputFormatter,
                maxLength: widget.maxLength,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(size.width * .02),
                    hintText: widget.text,
                    isDense: true,
                    errorStyle: const TextStyle(
                        color: Colors.red, fontSize: 0, height: 0),
                    hoverColor: const Color(0xff00b689),
                    focusColor: const Color(0xff00b689),
                    counterStyle: const TextStyle(fontSize: 0),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.redAccent)),
                    errorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.redAccent)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xff00b689))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Colors.black.withOpacity(0.6)))))));
  }
}
