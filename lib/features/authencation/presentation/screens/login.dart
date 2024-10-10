import 'package:ai_tennis/core/routes/routes.dart';
import 'package:ai_tennis/core/utils/responsive_helper.dart';
import 'package:ai_tennis/core/utils/size_config.dart';
import 'package:ai_tennis/features/authencation/presentation/components/custom_button.dart';
import 'package:ai_tennis/features/authencation/presentation/controller/auth_bloc.dart';
import 'package:ai_tennis/features/authencation/presentation/controller/auth_event.dart';
import 'package:ai_tennis/features/authencation/presentation/controller/auth_state.dart';
import 'package:ai_tennis/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    SizeConfig.init(context);

    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
           if(state is AuthSuccess){
             ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content: Text('Login Successful!')));
             navigationService.navigateTo(Routes.getLocation);

           } else if (state is AuthError) {
               ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text(state.message)),
               );
             }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }


            bool isMobile = ResponsiveHelper.isMobile(context);
            double horizontalPadding = isMobile ? 5 * SizeConfig.widthMultiplier : 10 * SizeConfig.widthMultiplier;
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal:horizontalPadding ),
              child: Column(

                children: [
                   SizedBox(height:  10 * SizeConfig.heightMultiplier,),
                   Text("LOGIN", style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 4 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.bold,
                  ),),
                   Text("welcome Back !", style: TextStyle(
                    color: Colors.grey,
                    fontSize: 2*SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w400,
                  ),),
                  const SizedBox(height: 40,),
                  CustomTextFormField(label: 'EmailL',
                    textEditingController: emailController,),
                  CustomTextFormField(label: 'Password',
                    textEditingController: passwordController,),
                   SizedBox(height:  3 * SizeConfig.heightMultiplier,),
                  Button(backgroundColor: Colors.deepPurpleAccent,
                      label: "LOGIN", function: () {
                        context.read<AuthBloc>().add(
                          LoginEvent(
                            emailController.text,
                            passwordController.text,
                          ),
                        );
                      }
                  ),
                   SizedBox(height:  2 * SizeConfig.heightMultiplier,),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
