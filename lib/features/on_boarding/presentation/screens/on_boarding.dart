import 'package:ai_tennis/features/authencation/presentation/screens/auth.dart';
import 'package:ai_tennis/features/on_boarding/presentation/components/on_boarding_screen_1.dart';
import 'package:ai_tennis/features/on_boarding/presentation/components/on_boarding_screen_2.dart';
import 'package:ai_tennis/features/on_boarding/presentation/components/on_boarding_screen_3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    PageController smoothPageController=PageController();
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: smoothPageController,
            children:const [
              OnBoardingScreen1(),
              OnBoardingScreen2(),
              OnBoardingScreen3(),
            ],
          ),
        Container(
            alignment: const Alignment(0 , 0.75),
            child: SmoothPageIndicator(controller: smoothPageController, count: 3 ,)),

        Positioned(
          top: 30,
          right: 25,
          child: GestureDetector(
            onTap:()=>Navigator.push(context , MaterialPageRoute(builder: (context)=>Auth())),
            child: const Text("Skip" , style: TextStyle(
                fontSize: 16 , color: Colors.black ,
                fontWeight:  FontWeight.bold
            ),),
          ),
        ),

        ],
      ),
    );
  }
}
