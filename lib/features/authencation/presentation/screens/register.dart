import 'package:ai_tennis/features/authencation/presentation/components/custom_button.dart';
import 'package:ai_tennis/features/authencation/presentation/components/custom_text_form_field.dart';
import 'package:ai_tennis/features/authencation/presentation/controller/auth_bloc.dart';
import 'package:ai_tennis/features/authencation/presentation/controller/auth_event.dart';
import 'package:ai_tennis/features/authencation/presentation/controller/auth_state.dart';
import 'package:ai_tennis/features/authencation/presentation/screens/login.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
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
                btnOkOnPress: () {},
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
                const SizedBox(height: 100,),
                const Text("Sign Up", style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),),
                const Text("create your account", style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),),
                const SizedBox(height: 40,),
                CustomTextFormField(label: 'Full Name',
                  textEditingController: fullNameController,),
                CustomTextFormField(label: 'EmailL',
                  textEditingController: emailController,),
                CustomTextFormField(label: 'Password',
                  textEditingController: passwordController,),
                const SizedBox(height: 15,),
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
                 const SizedBox(height: 5,),
                GestureDetector(
                  onTap:()=> Navigator.push(context ,MaterialPageRoute(builder:
                  (context)=> const LoginScreen())),
                  child: const Text("Have an account ?", style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 13,
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

