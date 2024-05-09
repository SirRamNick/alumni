import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class OlopscForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final GlobalKey<FormState> formKey;
  final Widget subTitle;
  const OlopscForm({
    super.key,
    required this.formKey,
    required this.subTitle,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: ListTile(
          title: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          subtitle: subTitle,
        ),
      ),
    );
  }
}
