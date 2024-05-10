import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/auth/authentication_cubit.dart';
import 'package:toefl_app/domain/state/user/user_cubit.dart';
import 'package:toefl_app/presentation/screens/home_screen.dart';
import 'package:toefl_app/presentation/screens/login_screen.dart';

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
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        switch (state) {
          case AuthenticationRegisterSuccess():
            context.read<UserCubit>().getSession();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Register success'),
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
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null) {
                    return 'Email can not be empty';
                  }

                  if (value.isEmpty) {
                    return 'Email can not be empty';
                  }

                  final emailRegex = RegExp(
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                  if (!emailRegex.hasMatch(value)) {
                    return 'Please input valid email';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(hintText: 'Password'),
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
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: 'Name'),
                validator: (value) {
                  if (value == null) {
                    return 'Name can not be empty';
                  }

                  if (value.isEmpty) {
                    return 'Name can not be empty';
                  }

                  return null;
                },
              ),
              ElevatedButton(
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
                child: const Text('Register'),
              ),
              TextButton(
                child: const Text('go to login'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
