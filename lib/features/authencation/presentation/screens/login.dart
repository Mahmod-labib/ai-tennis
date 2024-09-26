import 'package:ai_tennis/features/authencation/presentation/components/custom_button.dart';
import 'package:ai_tennis/features/authencation/presentation/controller/auth_bloc.dart';
import 'package:ai_tennis/features/authencation/presentation/controller/auth_event.dart';
import 'package:ai_tennis/features/authencation/presentation/controller/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
           if(state is AuthSuccess){
             ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content: Text('Login Successful!')));
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
            return Column(

              children: [
                const SizedBox(height: 100,),
                const Text("LOGIN", style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),),
                const Text("welcome Back !", style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),),
                const SizedBox(height: 40,),
                CustomTextFormField(label: 'EmailL',
                  textEditingController: emailController,),
                CustomTextFormField(label: 'Password',
                  textEditingController: passwordController,),
                const SizedBox(height: 15,),
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
                const SizedBox(height: 5,),

              ],
            );
          },
        ),
      ),
    );
  }
}
