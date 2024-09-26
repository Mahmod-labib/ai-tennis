import 'package:flutter/material.dart';

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Image(image: AssetImage("assets/images/ob_img1.jpg") ,
          width: 300,
            height: 450,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15 ,right: 15),
            child: Text("Unleash Your Potential—Discover Personalized Coaching!" ,
            style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold ,
            fontSize: 14,
            ),
            ),
          ),
        ],
      ),
    );
  }
}
