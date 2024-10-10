import 'package:ai_tennis/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5 * SizeConfig.heightMultiplier), // Responsive height
          Image(image: const AssetImage("assets/images/ob_img2.jpg") ,
            width: 80 * SizeConfig.widthMultiplier,
            height: 65 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5 * SizeConfig.widthMultiplier),
            child: Text("Join the Future of Tennis Training with AI!" ,
              style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold ,
                fontSize: 2.5 * SizeConfig.textMultiplier,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
