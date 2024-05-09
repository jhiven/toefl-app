import 'package:flutter/material.dart';
import 'package:toefl_app/learn_grammar/preview.dart';
import 'package:toefl_app/learn_grammar/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Grammar")),
      ),
      body: Padding(
        padding: EdgeInsets.all(21.0),
        child: Column(
          children: [
           ProgressCard(isCompleted: true, subscribers: false, textProgress: ""),
           SizedBox(height: 20.74,),
           ProgressCard(isCompleted: true, subscribers: false, textProgress: ""),
           SizedBox(height: 20.74,),
           ProgressCard(isCompleted: false, subscribers: false, textProgress: "12/20"),
           SizedBox(height: 20.74,),
           ProgressCard(isCompleted: false, subscribers: true, textProgress: ""),
            ],
        ),
      ),
    );
  }
}

class ProgressCard extends StatelessWidget {
  final bool isCompleted;
  final bool subscribers;
  final String textProgress;

  ProgressCard({
    //super.key,
    Key? key,
    required this.isCompleted,
    required this.subscribers,
    required this.textProgress,
  }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewScreen(),)),
      child: Container(
        padding: EdgeInsets.all(26.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: (subscribers) ? Colors.white : kPrimary,
            border:
                (subscribers) ? Border.all(color: kPrimary, width: 1.0) : null),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
           (subscribers) ? Image.asset('assets/images/icon_alphabet_colored.png',
              width: 48.0, height: 48.0) : Image.asset('assets/images/icon_alphabet.png',
              width: 48.0, height: 48.0),
          SizedBox(width: 18.0,),
          (subscribers) ? Expanded(
            child: Text("Bab 1", style: Style.getBlackBoldTextWhite(color: kPrimary)),
          ) : Expanded(child: Text("Bab 1", style: Style.getBlackBoldTextWhite(),)),
          (isCompleted) ? Image.asset(
            'assets/images/icon_check.png',
            width: 48.0,
            height: 48.0,
          ) : SizedBox.shrink(),
           (subscribers) ? Row(
             children: [
              Text("Get Pro", style: Style.getBlackBoldTextWhite(color: kPrimary, fontSize: 16.0, fontWeight: FontWeight.w500),),
              SizedBox(width: 4.0,)
              ,Image.asset(
              'assets/images/icon_clown.png',
              width: 24.68,
              height: 16.07,
                     ),]
           ) : SizedBox.shrink(),
          (textProgress.isNotEmpty) ?
          Text("${textProgress}", style: Style.getBlackBoldTextWhite(),) : SizedBox.shrink()
        ]),
      ),
    );
  }
}
