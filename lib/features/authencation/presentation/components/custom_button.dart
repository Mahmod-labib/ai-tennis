import 'package:ai_tennis/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key, required this.backgroundColor, required this.label,required this.function,
  });
 final Color backgroundColor;
 final String label;
 final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SizedBox(
      height: 6 * SizeConfig.heightMultiplier,
      width: 55 * SizeConfig.widthMultiplier,
      child: ElevatedButton(
          onPressed: function,
          style: ElevatedButton.styleFrom(
            backgroundColor:backgroundColor,
          ),
          child:  Text(label , style:  TextStyle(
            fontSize: 2.5 * SizeConfig.textMultiplier, // Font size based on text multiplier
            color: Colors.white,
          ),)),
    );
  }
}
