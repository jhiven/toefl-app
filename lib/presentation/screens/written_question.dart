import 'package:flutter/material.dart';
import 'package:toefl_app/widgets/question_page.dart';

class WrittenQuestion extends StatefulWidget {
  const WrittenQuestion({super.key});

  @override
  State<WrittenQuestion> createState() => _WrittenQuestionState();
}

class _WrittenQuestionState extends State<WrittenQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.timer),
                Text(
                  "Time left 30:45",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 4.0),
              child: Text(
                "Page 1 of 50",
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          QuestionPage(),
          _storyText(context, "What is your mother name boyyy ?")
        ],
      ),
    );
  }
}

_storyText(BuildContext context, String text) {
  late MediaQueryData queryData = MediaQuery.of(context);
  return Padding(
    padding: const EdgeInsets.only(left: 36.0, right: 36, top: 20, bottom: 20),
    child: Flexible(
      child: SizedBox(
        height: queryData.size.height * 0.3,
        width: queryData.size.width,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Text(
              text,
              textAlign: TextAlign.justify,
            )),
      ),
    ),
  );
}
