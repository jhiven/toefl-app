import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String image;
  final String title;
  final int trailing;

  const CustomListTile({
    Key? key,
    required this.image,
    required this.title, required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 92,
      decoration: BoxDecoration(
        color: const Color(0xFF14487A),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                image,
                width: 40,
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: 220,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 28),
                  ),
                ),
              ),
            ],
          ),
          _showTrailing(trailing)
        ],
      ),
    );
  }
}

Widget _showTrailing(int trailing){
  if (trailing == 1) {
    return Icon(Icons.check_circle_rounded, size: 30, color: Colors.green,);
  } else if(trailing == 2){
    return Icon(Icons.lock, size: 30, color: Colors.amber,);
  }
  return Container();
}