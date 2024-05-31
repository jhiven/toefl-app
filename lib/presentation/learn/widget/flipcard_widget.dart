import 'package:flutter/material.dart';

class FlipcardWidget extends StatelessWidget {
  final String title;
  final String content;
  final String? translation;
  final Color color;

  const FlipcardWidget(
      {super.key,
      required this.title,
      required this.color,
      required this.content,
      this.translation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(15).copyWith(bottom: 50, top: 30),
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // color: Color.fromRGBO(20, 72, 122, 1),
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: kElevationToShadow[4],
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      content,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow
                          .ellipsis,
                      maxLines: 14,
                    ),
                  ),
                  translation != null
                      ? Text(
                          translation!,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
