import 'package:demo_clean/core/widgets/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              AppTextField(
                controller: emailController,
                hintText: "Enter your email",
                validator: (value) => value!.isEmpty ? "Email is required" : null,
              ),
              const SizedBox(height: 10),
              AppTextField(
                controller: passwordController,
                hintText: "Enter your password",
                obscureText: true,
                validator: (value) => value!.length < 6 ? "Password must be at least 6 characters" : null,
              ),
              const SizedBox(height: 20),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailure) {
                    appSnackBar(context, state.message);
                  }
                  if (state is AuthSuccess) {
                    appSnackBar(context, "Welcome ${state.name}");
                  }
                },
                builder: (context, state) {
                  return state is AuthLoading
                      ? CircularProgressIndicator():
                      FilledButton(onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                            LoginRequested(emailController.text, passwordController.text),
                          );
                        }
                      }, child: Text("Login"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
