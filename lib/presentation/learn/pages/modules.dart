import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/material/material_cubit.dart';
import 'package:toefl_app/domain/state/modul_cubit.dart';
import 'package:toefl_app/presentation/learn/pages/chapter_list.dart';
import 'package:toefl_app/presentation/learn/widget/customListTile.dart';

class Modules extends StatefulWidget {
  const Modules({super.key});

  @override
  State<Modules> createState() => _ModulesState();
}

class _ModulesState extends State<Modules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Modules',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/5437683.png',
                width: 330,
                height: 308.89,
              ),
            ),
            Text(
              'Pick Your Modules',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChapterList(path: 'assets/solar_book-outline.png',),));
                  context.read<ModulCubit>().pickModul('Reading');
                  context.read<MaterialModulCubit>().selectModul(3);
                },
                child: CustomListTile(image: 'assets/solar_book-outline.png', title: 'Reading', trailing: 0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChapterList(path: 'assets/Group.png',),));
                  context.read<ModulCubit>().pickModul('Listening');
                  context.read<MaterialModulCubit>().selectModul(1);
                },
                child: CustomListTile(image: 'assets/Group.png', title: 'Listening', trailing: 0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChapterList(path: 'assets/tabler_text-grammar.png',),));
                  context.read<ModulCubit>().pickModul('Grammar');
                  context.read<MaterialModulCubit>().selectModul(2);
                },
                child: CustomListTile(image: 'assets/tabler_text-grammar.png', title: 'Grammar', trailing: 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
