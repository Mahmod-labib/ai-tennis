import 'package:ai_tennis/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return   Scaffold(
      backgroundColor: Colors.white,
      body: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5 * SizeConfig.heightMultiplier), // Responsive height
          Image(image: const AssetImage("assets/images/ob_img1.jpg") ,
            width: 80 * SizeConfig.widthMultiplier,
            height: 65 * SizeConfig.heightMultiplier,
          ),
           Padding(
             padding: EdgeInsets.symmetric(horizontal: 5 * SizeConfig.widthMultiplier), // Responsive padding
            child: Text("Unleash Your Potential—Discover Personalized Coaching!" ,
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
