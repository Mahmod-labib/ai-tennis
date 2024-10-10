import 'package:ai_tennis/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key, required this.label, required this.textEditingController,
  });
  final String label;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return  Padding(
      padding:  EdgeInsets.only(
        left: 2.5 * SizeConfig.widthMultiplier,  // 2.5% of screen width
        right: 2.5 * SizeConfig.widthMultiplier, // 2.5% of screen width
        bottom: 2 * SizeConfig.heightMultiplier,  // 2% of screen height
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          label: Text(label,style: TextStyle(
            fontSize: 2 * SizeConfig.textMultiplier, // Font size responsive
          ),),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }
}
