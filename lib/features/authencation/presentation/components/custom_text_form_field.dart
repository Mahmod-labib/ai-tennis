import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key, required this.label, required this.textEditingController,
  });
  final String label;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 25 , right: 25 , bottom: 20),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          label: Text(label),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }
}
