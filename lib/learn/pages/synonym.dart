import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/synonym_cubit.dart';
import 'package:toefl_app/learn/widget/bottom_backgorund.dart';
import 'package:toefl_app/learn/widget/button_next.dart';

class SynonymGame extends StatefulWidget {
  const SynonymGame({super.key});

  @override
  State<SynonymGame> createState() => _SynonymGameState();
}

class _SynonymGameState extends State<SynonymGame> {
  List<String> chapter1 = [
    'Bab I',
    'Bab II',
    'Bab III',
    'Bab IV',
  ];
  List<String> chapter2 = ['Bab V', 'Bab VI', 'Bab VII', 'Bab 9'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Synonym',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text("pilih kalimat"),
              ),
              BlocBuilder<SynonymCubit, SynonymState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Column(
                        children: [
                          ...chapter1.map((kata1) {
                            int index = chapter1.indexOf(kata1);
                            return Padding(
                              padding: const EdgeInsets.all(15),
                              child: InkWell(
                                onTap: () {
                                  context
                                      .read<SynonymCubit>()
                                      .buttonBorder1(index);
                                  context
                                      .read<SynonymCubit>()
                                      .getChosenText1(kata1);
                                },
                                child: Container(
                                    height: 60,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(9)),
                                      color: const Color.fromARGB(
                                          255, 143, 195, 244),
                                      border: state is SynonymWord1Click &&
                                              state.isSelected1[index]
                                          ? Border.all(
                                              color: Colors.black,
                                              width: 2,
                                            )
                                          : null,
                                    ),
                                    child: Center(
                                      child: Text(kata1),
                                    )),
                              ),
                            );
                          }),
                        ],
                      ),
                      Column(
                        children: [
                          ...chapter2.map((kata2) {
                            int index = chapter2.indexOf(kata2);
                            return Padding(
                              padding: const EdgeInsets.all(15),
                              child: InkWell(
                                onTap: () {
                                  context
                                      .read<SynonymCubit>()
                                      .buttonBorder2(index);
                                  context
                                      .read<SynonymCubit>()
                                      .getChosenText2(kata2);
                                },
                                child: Container(
                                    height: 60,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(9)),
                                      color: const Color.fromARGB(
                                          255, 143, 195, 244),
                                      border: state is SynonymWord1Click &&
                                              state.isSelected2[index]
                                          ? Border.all(
                                              color: Colors.black,
                                              width: 2,
                                            )
                                          : null,
                                    ),
                                    child: Center(
                                      child: Text(kata2),
                                    )),
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  );
                },
              )
            ],
          ),
          BottomBackground(
            butoon1: Container(),
            button2: InkWell(
              onTap: () {},
              child: ButtonNext(next: true,),
            ),
          ),
        ],
      ),
    );
  }
}
