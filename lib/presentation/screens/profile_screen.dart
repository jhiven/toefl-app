import 'package:flutter/material.dart';
import 'package:toefl_app/presentation/widgets/login_input.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController emailController = TextEditingController();
  List<String> heading = ["Username", "Email", "Best Score"];
  List<String> labelText = ["robyAW", "robyarjuna221@gmail.com", "660"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 246,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF14487A),
              ),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 32),
                    child: Text(
                      "Profile",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
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
                  onPressed: () {},
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
    );
  }
}

_profileField(
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
