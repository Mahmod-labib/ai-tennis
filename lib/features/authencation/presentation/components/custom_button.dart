import 'package:flutter/animation.dart';
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
    return SizedBox(
      height: 40,
      width: 140,
      child: ElevatedButton(
          onPressed: function,
          style: ElevatedButton.styleFrom(
            backgroundColor:backgroundColor?? Colors.indigoAccent,
          ),
          child:  Text(label , style: const TextStyle(
            fontSize: 20 ,
            color: Colors.white,
          ),)),
    );
  }
}
