import 'package:flutter/material.dart';
import 'package:toefl_app/learn_grammar/style.dart';

class QuestionNextScreen extends StatefulWidget {
  const QuestionNextScreen({super.key});

  @override
  State<QuestionNextScreen> createState() => _QuestionNextScreenState();
}

class _QuestionNextScreenState extends State<QuestionNextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: 89.0, left: 30, right: 30, bottom: 81.0),
          child: Column(
            children: [
              Text(
                "Torem ipsum ______________ adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
                maxLines: 9,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.justify,
                style: Style.getBlackBoldTextWhite(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              ),
              SizedBox(
                height: 40.0,
              ),
              AnswerWidget(
                isCorrect: false,
                text: 'ipsum',
              ),
              SizedBox(
                height: 30.0,
              ),
              AnswerWidget(
                isCorrect: true,
                text: 'dolor',
              ),
              Expanded(child: SizedBox()),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => ()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                      SizedBox(),
                    Text(
                      "Next",
                      style: Style.getBlackBoldTextWhite(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.arrow_forward)
                  ]),
                  style: Style.getButtonStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnswerWidget extends StatelessWidget {
  AnswerWidget({
    super.key,
    required this.isCorrect,
    required this.text,
  });

  final bool isCorrect;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.0),
          color: (isCorrect) ? Color(0xff3FC600) : Colors.white,
          border:
              (isCorrect) ? null : Border.all(width: 1.0, color: Colors.red)),
      child: Text("${text}",
          style: (isCorrect)
              ? Style.getBlackBoldTextWhite(color: Colors.black, fontSize: 16.0)
              : Style.getBlackBoldTextWhite(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal)),
    );
  }
}
