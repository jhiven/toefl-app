import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/models/synonym.dart';
import 'package:toefl_app/domain/state/synonym_cubit.dart';
import 'package:toefl_app/domain/state/synonym_data/synonym_data_cubit.dart';
import 'package:toefl_app/learn/widget/bottom_backgorund.dart';
import 'package:toefl_app/learn/widget/button_next.dart';

class SynonymGame extends StatefulWidget {
  const SynonymGame({super.key});

  @override
  State<SynonymGame> createState() => _SynonymGameState();
}

class _SynonymGameState extends State<SynonymGame> {
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
              BlocBuilder<SynonymDataCubit, SynonymDataState>(
                builder: (context, state) {
                  if (state is SynonymDataLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SynonymDataLoaded) {
                    List<SynonymModel> data = state.data;
                    List<SynonymModel> dataRandom = state.dataRandom;
                    context.read<SynonymCubit>().initialSynonym(data);
                    return BlocBuilder<SynonymCubit, SynonymState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            Column(
                              children: [
                                ...data.map((kata1) {
                                  int index = data.indexOf(kata1);
                                  return Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: InkWell(
                                      onTap: () {
                                        context
                                            .read<SynonymCubit>()
                                            .buttonBorder1(index);
                                        context
                                            .read<SynonymCubit>()
                                            .getChosenText1(kata1.word1);
                                      },
                                      child: Container(
                                          height: 60,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(9)),
                                            color: const Color.fromARGB(
                                                255, 143, 195, 244),
                                            border: state
                                                        is SynonymWord1Click &&
                                                    (state.isSelected1[index] ||
                                                        state.answer1[index])
                                                ? Border.all(
                                                    color: state.answer1[index]
                                                        ? Colors.green
                                                        : Colors.black,
                                                    width: 2,
                                                  )
                                                : null,
                                          ),
                                          child: Center(
                                            child: Text(kata1.word1),
                                          )),
                                    ),
                                  );
                                }),
                              ],
                            ),
                            Column(
                              children: [
                                ...dataRandom.map((kata2) {
                                  int index = dataRandom.indexOf(kata2);
                                  return Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: InkWell(
                                      onTap: () {
                                        context
                                            .read<SynonymCubit>()
                                            .buttonBorder2(index);
                                        context
                                            .read<SynonymCubit>()
                                            .getChosenText2(kata2.word2);
                                      },
                                      child: Container(
                                          height: 60,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(9)),
                                            color: const Color.fromARGB(
                                                255, 143, 195, 244),
                                            border: state
                                                        is SynonymWord1Click &&
                                                    (state.isSelected2[index] ||
                                                        state.answer2[index])
                                                ? Border.all(
                                                    color: state.answer2[index]
                                                        ? Colors.green
                                                        : Colors.black,
                                                    width: 2,
                                                  )
                                                : null,
                                          ),
                                          child: Center(
                                            child: Text(kata2.word2),
                                          )),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return Text('Failed to load data');
                  }
                },
              )
            ],
          ),
          BlocBuilder<SynonymCubit, SynonymState>(
            builder: (context, state) {
              if (state is SynonymWord1Click) {
                bool allTrue =
                    state.answer1.every((element) => element == true);
                if (allTrue) {
                  return BottomBackground(
                    butoon1: Container(),
                    button2: InkWell(
                      onTap: () {
                        context.read<SynonymDataCubit>().showSynonym();
                      },
                      child: ButtonNext(
                        next: true,
                      ),
                    ),
                  );
                }else{
                  return Container();
                }
              }else{
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
