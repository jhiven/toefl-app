import 'package:flutter/material.dart';

class ChapterList extends StatefulWidget {
  const ChapterList({super.key});

  @override
  State<ChapterList> createState() => _ChapterListState();
}

class _ChapterListState extends State<ChapterList> {
  List<String> chapter = [
    'Bab I',
    'Bab II',
    'Bab III',
    'Bab IV',
    'Bab V',
    'Bab I',
    'Bab II',
    'Bab III',
    'Bab IV',
    'Bab V',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {},
            child: Icon(Icons.arrow_back),
          ),
          title: Text(
            'Reading',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...chapter.map((value) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(10),
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
                              Icon(
                                Icons.book,
                                size: 45,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Text("data")
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ));
  }
}
