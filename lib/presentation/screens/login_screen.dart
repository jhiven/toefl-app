import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/auth/authentication_cubit.dart';
import 'package:toefl_app/domain/state/user/user_cubit.dart';
import 'package:toefl_app/presentation/screens/home_screen.dart';
import 'package:toefl_app/presentation/screens/register_screen.dart';
import 'package:toefl_app/presentation/widgets/login_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        switch (state) {
          case AuthenticationLoginSucess():
            context.read<UserCubit>().getSession();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login success'),
              ),
            );
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ),
            );
          case AuthenticationFailed():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed with error message: ${state.errorMsg}'),
              ),
            );
          default:
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Mengatur posisi vertikal ke atas
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
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
                  ),
                ),
                const SizedBox(
                  height: 20,
                ), // Menambahkan jarak antara teks
                const Text(
                  'LOGIN',
                  style: TextStyle(
                      color: Color(0xFF14487A),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                    height: 70), // Menambahkan jarak antara judul dan form
              ],
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        LoginInput(
                          hintText: "Fill your email",
                          labelText: "Email",
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null) {
                              return 'Email can not be empty';
                            }

                            if (value.isEmpty) {
                              return 'Email can not be empty';
                            }

                            final emailRegex = RegExp(
                                r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                            if (!emailRegex.hasMatch(value)) {
                              return 'Please input valid email';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        LoginInput(
                          labelText: "Password",
                          hintText: 'Fill your password',
                          controller: _passwordController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          validator: (value) {
                            if (value == null) {
                              return 'Password can not be empty';
                            }

                            if (value.isEmpty) {
                              return 'Password can not be empty';
                            }

                            if (value.length < 8) {
                              return 'Password must be longer than 8 characters';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 35),
                        Container(
                          margin: const EdgeInsets.only(
                              top:
                                  30), // Memberikan jarak antara tombol "Login" dengan elemen di atasnya
                          width: double
                              .infinity, // Menentukan lebar sesuai dengan lebar layar
                          height: 50, // Menentukan tinggi sesuai kebutuhan
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final email = _emailController.text;
                                final password = _passwordController.text;

                                context.read<AuthenticationCubit>().login(
                                      email: email,
                                      password: password,
                                    );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(
                                  0), // Menghilangkan padding bawaan ElevatedButton
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    99), // Atur radius border
                              ),
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff14487A),
                                    Color(0xff39608F)
                                  ], // Atur warna gradien
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(
                                    99), // Atur radius border
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white, // Warna teks
                                    fontSize: 18, // Ukuran font
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
                              'Don\'t have an account? ',
                              style: TextStyle(color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const RegisterScreen();
                                    },
                                  ),
                                );
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  color: Color(0xff14487A), // Warna tautan
                                  decoration: TextDecoration
                                      .underline, // Garis bawah untuk menandakan tautan
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
    );
  }
}
