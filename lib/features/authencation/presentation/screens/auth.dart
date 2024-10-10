import 'package:ai_tennis/core/routes/routes.dart';
import 'package:ai_tennis/core/utils/size_config.dart';
import 'package:ai_tennis/features/authencation/presentation/components/custom_button.dart';
import 'package:ai_tennis/features/authencation/presentation/screens/login.dart';
import 'package:ai_tennis/features/authencation/presentation/screens/register.dart';
import 'package:ai_tennis/main.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image(
              image: const AssetImage("assets/images/auth_logo_.jpg"),
              width:200,
              height:200,
            ),
            SizedBox(height: 5 * SizeConfig.heightMultiplier),

            Button(

              label: "Sign In",
              backgroundColor: Colors.deepPurpleAccent,
               function:(){
                navigationService.navigateTo(Routes.register);
               }
            ),
            SizedBox(height: 2 * SizeConfig.heightMultiplier), // Responsive spacing

            Button(
              label: "Log In",
              backgroundColor: Colors.black12,
    function:(){
    navigationService.navigateTo(Routes.login);
    }


            ),
             SizedBox(
              height: 10*SizeConfig.heightMultiplier,
            ),
          ],
        ),
      ),
    );
  }
}
