import 'package:flutter/material.dart';

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Image(image: AssetImage("assets/images/ob_img2.jpg") ,
            width: 300,
            height: 450,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15 ,right: 15),
            child: Text("Join the Future of Tennis Training with AI!" ,
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
