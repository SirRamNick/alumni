import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class OlopscForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final GlobalKey<FormState> formKey;
  final Widget subTitle;
  final Widget? suffixIcon;
  const OlopscForm({
    super.key,
    required this.formKey,
    required this.subTitle,
    required this.textEditingController,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: suffixIcon,
            label: subTitle,
          ),
        ),
      ),
    );
  }
}
