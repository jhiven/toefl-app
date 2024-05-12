import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/modul_cubit.dart';
import 'package:toefl_app/learn/pages/reading_page.dart';
import 'package:toefl_app/learn/widget/customListTile.dart';

class ChapterList extends StatefulWidget {
  const ChapterList({super.key, required this.path});
  final String path;

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
    return BlocBuilder<ModulCubit, ModulState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: state is ModulValue
                ? Text(
                    state.modul,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                : Container(),
            centerTitle: true,
            forceMaterialTransparency: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ...chapter.map((value) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReadingPage(),
                            ));
                        context.read<ModulCubit>().pickChapter(value);
                      },
                      child: CustomListTile(
                          image: widget.path, title: value, trailing: 0),
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
