import 'package:flutter/material.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({super.key, required this.next});
  final bool next;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xFF14487A),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Text( next ?
            'Next' : 'Check',
            style: TextStyle(color: Colors.white),
          ),
          next ?
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ) : Container(),
        ],
      ),
    );
  }
}
