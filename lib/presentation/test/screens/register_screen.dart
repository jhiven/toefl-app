import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/auth/authentication_cubit.dart';
import 'package:toefl_app/domain/state/user/user_cubit.dart';
import 'package:toefl_app/presentation/test/screens/home_page.dart';
import 'package:toefl_app/presentation/test/screens/login_screen.dart';
import 'package:toefl_app/presentation/test/widgets/login_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationRegisterSuccess) {
          context.read<UserCubit>().getSession();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Register success')),
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else if (state is AuthenticationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Failed with error message: ${state.errorMsg}')),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                  fontSize: 34, fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: 'TOEFL ',
                                  style: TextStyle(color: Color(0xFF14487A)),
                                ),
                                TextSpan(
                                  text: 'PENS',
                                  style: TextStyle(color: Color(0xFFF6C410)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'REGISTER',
                            style: TextStyle(
                              color: Color(0xFF14487A),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 57),
                          LoginInput(
                            controller: _nameController,
                            labelText: 'Name',
                            hintText: "Fill ur name",
                            enabled: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name cannot be empty';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          LoginInput(
                            controller: _emailController,
                            labelText: "Email",
                            hintText: "Fill ur Email",
                            keyboardType: TextInputType.emailAddress,
                            enabled: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email cannot be empty';
                              }
                              final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                              if (!emailRegex.hasMatch(value)) {
                                return 'Please input a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          LoginInput(
                            controller: _passwordController,
                            labelText: "Password",
                            hintText: "Fill ur Password",
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            enabled: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password cannot be empty';
                              }
                              if (value.length < 8) {
                                return 'Password must be longer than 8 characters';
                              }
                              return null;
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 60),
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  final email = _emailController.text;
                                  final password = _passwordController.text;
                                  final name = _nameController.text;

                                  context.read<AuthenticationCubit>().register(
                                        email: email,
                                        password: password,
                                        name: name,
                                      );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(99),
                                ),
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff14487A),
                                      Color(0xff39608F)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(99),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(color: Colors.black),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Color(0xff14487A),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
