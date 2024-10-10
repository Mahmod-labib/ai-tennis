import 'package:ai_tennis/core/routes/navigation_services.dart';
import 'package:ai_tennis/core/routes/routes.dart';
import 'package:ai_tennis/core/utils/size_config.dart';
import 'package:ai_tennis/features/authencation/presentation/screens/auth.dart';
import 'package:ai_tennis/features/on_boarding/presentation/components/on_boarding_screen_1.dart';
import 'package:ai_tennis/features/on_boarding/presentation/components/on_boarding_screen_2.dart';
import 'package:ai_tennis/features/on_boarding/presentation/components/on_boarding_screen_3.dart';
import 'package:ai_tennis/main.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
            child: SmoothPageIndicator(controller: smoothPageController, count: 3 ,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.deepPurpleAccent,
                dotColor: Colors.grey,
              ),
            )),

        Positioned(
          top: 2 * SizeConfig.heightMultiplier,
          right: 5 * SizeConfig.widthMultiplier,
          child: GestureDetector(
            onTap:(){
              if (navigationService.navigatorKey.currentState != null) {
                navigationService.navigateTo(Routes.auth);
              } else {
                debugPrint('Navigator state is null');
              }            },
            child:  Text("Skip" , style: TextStyle(
                fontSize: 2.5 * SizeConfig.textMultiplier , color: Colors.black ,
                fontWeight:  FontWeight.bold
            ),),
          ),
        ),

        ],
      ),
    );
  }
}
