import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/material/material_cubit.dart';
import 'package:toefl_app/domain/state/modul_cubit.dart';
import 'package:toefl_app/learn/pages/content_page.dart';
import 'package:toefl_app/learn/widget/customListTile.dart';

class ChapterList extends StatefulWidget {
  const ChapterList({super.key, required this.path});
  final String path;

  @override
  State<ChapterList> createState() => _ChapterListState();
}

class _ChapterListState extends State<ChapterList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModulCubit, ModulState>(
      builder: (context, state1) {
        return Scaffold(
          appBar: AppBar(
            title: state1 is ModulValue
                ? Text(
                    state1.modul,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                : Container(),
            centerTitle: true,
            forceMaterialTransparency: true,
          ),
          body: BlocBuilder<MaterialModulCubit, MaterialModulState>(
            builder: (context, state2) {
              if (state2 is MaterialLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state2 is MaterialLoaded) {
                final chapters = state2.data;
                List<int> idAll = [];
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ...chapters.map((value) {
                        idAll.add(value.id);
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ContentPage(id: value.id),
                                  ));
                              context
                                  .read<ModulCubit>()
                                  .pickChapter(value.title);
                            },
                            child: CustomListTile(
                                image: widget.path,
                                title: value.title,
                                trailing: 0),
                          ),
                        );
                      }),
                    ],
                  ),
                );
              } else{
                return Center(child: Text('Failed to load data'));
              }
            },
          ),
        );
      },
    );
  }
}
