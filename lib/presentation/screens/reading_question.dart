import 'package:flutter/material.dart';
import 'package:toefl_app/presentation/widgets/question_page.dart';

class ReadingQuestion extends StatefulWidget {
  const ReadingQuestion({super.key});

  @override
  State<ReadingQuestion> createState() => _ReadingQuestionState();
}

class _ReadingQuestionState extends State<ReadingQuestion> {
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
        surfaceTintColor: Colors.white,
      ),
      body: Stack(
        children: [
          QuestionPage(),
          Column(
            children: [
              _storyText(context,
                  "Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos"),
              _questionCard(context,
                  "What is your daddy name boy, where is home, how to mewminggg ?"),
            ],
          ),
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

_questionCard(BuildContext context, String question) {
  late MediaQueryData queryData = MediaQuery.of(context);
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32.0),
    child: SizedBox(
      height: queryData.size.height * 1 / 10,
      width: queryData.size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Color.fromRGBO(196, 209, 222, 1),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            question,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    ),
  );
}
