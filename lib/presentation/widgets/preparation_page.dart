import 'package:flutter/material.dart';
import 'package:toefl_app/presentation/widgets/primary_button.dart';

class PreparationPage extends StatefulWidget {
  final String heading;
  final String desc;

  const PreparationPage({super.key, required this.heading, required this.desc});

  @override
  State<PreparationPage> createState() => _PreparationPageState();
}

class _PreparationPageState extends State<PreparationPage> {
  late MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heading(widget.heading, context),
            Flexible(
              child: SizedBox(
                height: queryData.size.height * 0.65,
                width: queryData.size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: _description(widget.desc),
                ),
              ),
            ),
            const PrimaryButton(text: "Next", icon: Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}

_heading(String text, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
      Text(
        "section preparation",
        style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
    ],
  );
}

_description(String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      textAlign: TextAlign.justify,
    ),
  );
}
