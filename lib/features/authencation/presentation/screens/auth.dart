import 'package:ai_tennis/features/authencation/presentation/components/custom_button.dart';
import 'package:ai_tennis/features/authencation/presentation/screens/login.dart';
import 'package:ai_tennis/features/authencation/presentation/screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Image(
              image: AssetImage("assets/images/auth_logo_.jpg"),
              width: 200,
              height: 350,
            ),
             Button(

              label: "Sign In",
              backgroundColor: Colors.deepPurpleAccent,
               function:()=>Navigator.push(context , MaterialPageRoute(builder:
               (context)=>const RegisterScreen(),
               )),
            ),
            const SizedBox(
              height: 30,
            ),
             Button(
              label: "Log In",
              backgroundColor: Colors.black12,
               function: () {
                Navigator.push(context, MaterialPageRoute(builder:
                (context)=>const LoginScreen(),
                ));
               },

            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
