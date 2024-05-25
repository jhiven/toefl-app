import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/data/repository/auth_repository.dart';
import 'package:toefl_app/presentation/screens/login_screen.dart';
import 'package:toefl_app/presentation/widgets/login_input.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController emailController = TextEditingController();
  List<String> heading = ["Username", "Email", "Best Score"];
  List<String> labelText = ["robyAW", "robyarjuna221@gmail.com", "660"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          leading: IconButton(
            icon: const BackButtonIcon(),
            color: const Color(0xFF14487A),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 246,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF14487A),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 130,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Roby Arjuna",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 78,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: heading.length,
                  itemBuilder: (context, index) {
                    String currentHeading = heading[index];
                    String currentLabelText = labelText[index];
                    return _profileField(
                        currentHeading, currentLabelText, emailController);
                  },
                ),
              ),
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthRepository>().logout();

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    child: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _profileField(
    String heading, String labelText, TextEditingController emailController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        heading,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 16),
      ),
      const SizedBox(
        height: 4,
      ),
      LoginInput(
        hintText: "Fill your email",
        labelText: labelText,
        controller: emailController,
        keyboardType: null,
        validator: null,
      ),
      const SizedBox(
        height: 20,
      )
    ],
  );
}
