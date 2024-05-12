import 'package:flutter/material.dart';
import 'package:toefl_app/learn_grammar/question_next.dart';
import 'package:toefl_app/learn_grammar/style.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 89.0, left: 30, right: 30, bottom: 81.0),
          child: Column(
            children: [
              Text("Torem ipsum ______________ adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",maxLines: 9,overflow: TextOverflow.clip, textAlign: TextAlign.justify, style: Style.getBlackBoldTextWhite(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12.0),),
              SizedBox(height: 40.0,),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9.0),
                      borderSide: BorderSide(
                        color: kPrimary,
                        width: 1.0
                      )
                    )
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionNextScreen()));

                }, child: Text("Next", style: Style.getBlackBoldTextWhite(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w500),), style: Style.getButtonStyle(),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}