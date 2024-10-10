import 'package:ai_tennis/core/routes/routes.dart';
import 'package:ai_tennis/core/utils/size_config.dart';
import 'package:ai_tennis/features/authencation/presentation/components/custom_button.dart';
import 'package:ai_tennis/features/authencation/presentation/components/custom_text_form_field.dart';
import 'package:ai_tennis/features/authencation/presentation/controller/auth_bloc.dart';
import 'package:ai_tennis/features/authencation/presentation/controller/auth_event.dart';
import 'package:ai_tennis/features/authencation/presentation/controller/auth_state.dart';
import 'package:ai_tennis/features/authencation/presentation/screens/login.dart';
import 'package:ai_tennis/main.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  Future<void> saveFullName(String fullName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', fullName);
  }
  @override
  Widget build(BuildContext context) {
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    SizeConfig.init(context);

    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state is AuthSuccess){
              AwesomeDialog(
                headerAnimationLoop: true,
                customHeader: const Icon(
                  Icons.info, color: Colors.indigoAccent,
                  size: 55,
                ),
                btnOkColor: Colors.deepPurpleAccent,
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.rightSlide,
                title: 'Confirm Registration',
                desc: 'Are You Sure ?',
                btnCancelOnPress: () {},
                btnOkOnPress: () async{
                  await saveFullName(fullNameController.text);
                  navigationService.navigateTo(Routes.getLocation);
                },
              )
                .show();

          }
          else if(state is AuthError){
              AwesomeDialog(
                headerAnimationLoop: true,
                customHeader: const Icon(
                  Icons.info, color: Colors.red,
                  size: 55,
                ),
                btnOkColor: Colors.deepPurpleAccent,
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.rightSlide,
                title: 'Error',
                desc: state.message,
                btnCancelOnPress: () {},
                btnOkOnPress: () {},
              )
                  .show();
            }
          },
          builder: (context, state) {
            if(state is AuthLoading){
              return const Center(child: CircularProgressIndicator());

            }
            return Column(

              children: [
                 SizedBox(height: 10 * SizeConfig.heightMultiplier,),
                 Text("Sign Up", style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 3 * SizeConfig.textMultiplier,
                  fontWeight: FontWeight.bold,
                ),),
                 Text("create your account", style: TextStyle(
                  color: Colors.grey,
                  fontSize: 2 * SizeConfig.textMultiplier,
                  fontWeight: FontWeight.w400,
                ),),
                 SizedBox(height: 5 * SizeConfig.heightMultiplier,),
                CustomTextFormField(label: 'Full Name',
                  textEditingController: fullNameController,),
                CustomTextFormField(label: 'EmailL',
                  textEditingController: emailController,),
                CustomTextFormField(label: 'Password',
                  textEditingController: passwordController,),
                SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                Button(backgroundColor: Colors.deepPurpleAccent,
                  label: "Next", function: (){
                  context.read<AuthBloc>().add(
                     RegisterEvent(
                      emailController.text,
                       passwordController.text
                    )
                  );

                    }

                ),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                GestureDetector(
                  onTap:()=> Navigator.push(context ,MaterialPageRoute(builder:
                  (context)=> const LoginScreen())),
                  child:  Text("Have an account ?", style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 2 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w400,
                  ),),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

