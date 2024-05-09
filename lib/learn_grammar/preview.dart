import 'package:flutter/material.dart';
import 'package:toefl_app/learn_grammar/style.dart';
import 'package:toefl_app/learn_grammar/question.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 89.0, left: 30, right: 30, bottom: 81.0),
          child: Column(
            children: [
              Expanded(child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus. Curabitur tempor quis eros tempus lacinia. Nam bibendum pellentesque quam a convallis. Sed ut vulputate nisi. Integer in felis sed leo vestibulum venenatis. Suspendisse quis arcu sem. Aenean feugiat ex eu vestibulum vestibulum. Morbi a eleifend magna. Nam metus lacus, porttitor eu mauris a, blandit ultrices nibh. Mauris sit amet magna non ligula vestibulum eleifend. Nulla varius volutpat turpis sed lacinia. Nam eget mi in purus lobortis eleifend. Sed nec ante dictum sem condimentum ullamcorper quis venenatis nisi. Proin vitae facilisis nisi, ac posuere leo.",maxLines: 9,overflow: TextOverflow.clip, textAlign: TextAlign.justify, style: Style.getBlackBoldTextWhite(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12.0),)),
              Container(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionScreen()));

                }, child: Text("Test", style: Style.getBlackBoldTextWhite(color: kPrimary, fontSize: 12.0, fontWeight: FontWeight.w500)), style: Style.getButtonStyle(foreGroundColor: kPrimary, backgroundColor: Colors.white,outlined: true)),
              ),
              SizedBox(height: 20.0,),
              Container(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionScreen()));

                }, child: Text("Next", style: Style.getBlackBoldTextWhite(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w500),), style: Style.getButtonStyle(),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}