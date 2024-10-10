import 'package:ai_tennis/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen3 extends StatelessWidget {
  const OnBoardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return   Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5*SizeConfig.heightMultiplier,),
          Image(image: const AssetImage("assets/images/ob_img3.jpg") ,
            width: 80 * SizeConfig.widthMultiplier, // Responsive width
            height: 65 * SizeConfig.heightMultiplier, // Responsive height
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5 * SizeConfig.widthMultiplier),            child: Text("Ready to Ace Your Skills? Let’s Get Started!" ,
              style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold ,
                fontSize: 2.5 * SizeConfig.textMultiplier, // Responsive font size

              ),
            ),
          ),

        ],
      ),
    );
  }
}
