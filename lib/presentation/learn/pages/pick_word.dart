import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/button_next_cubit.dart';
import 'package:toefl_app/domain/state/pick_cubit.dart';
import 'package:toefl_app/domain/state/pick_word_data/pick_word_data_cubit.dart';
import 'package:toefl_app/learn/widget/bottom_backgorund.dart';
import 'package:toefl_app/learn/widget/button_next.dart';

class PickWord extends StatefulWidget {
  const PickWord({super.key});

  @override
  State<PickWord> createState() => _PickWordState();
}

class _PickWordState extends State<PickWord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pick Word',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          BlocBuilder<PickWordDataCubit, PickWordDataState>(
            builder: (context, state1) {
              if (state1 is PickWordDataLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state1 is PickWordDataLoaded) {
                List<String> answer = state1.answer;
                context.read<PickCubit>().initialpick(answer);
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text("pilih kalimat ${state1.question}"),
                    ),
                    BlocBuilder<PickCubit, PickState>(
                      builder: (context, state) {
                        if (state is PickSelectionChanged) {
                          print(state.check);
                        }
                        return SizedBox(
                          width: double.infinity,
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              state is PickSelectionChanged &&
                                      state.doCheck &&
                                      !state.check
                                  ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Answer : '),
                                        ...state.answer.map(
                                          (value) {
                                            return Text('${value} ');
                                          },
                                        )
                                      ],
                                    )
                                  : Container(),
                              ...state1.data.map(
                                (value) {
                                  int index = state1.data.indexOf(value);

                                  return Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: InkWell(
                                      onTap: () {
                                        context
                                            .read<PickCubit>()
                                            .buttonBorder(index);
                                        context
                                            .read<PickCubit>()
                                            .getChosenText(value.word);
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
                                            border: state is PickSelectionChanged &&
                                                    state.doCheck && state.isSelected[index]
                                                ? Border.all(
                                                    color: state.check
                                                        ? Colors.green
                                                        : Colors.red,
                                                    width: 2,
                                                  )
                                                : state is PickSelectionChanged &&
                                                        state.isSelected[index]
                                                    ? Border.all(
                                                        color: Colors.black,
                                                        width: 2,
                                                      )
                                                    : null,
                                          ),
                                          child: Center(
                                            child: Text(value.word),
                                          )),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text('Failed to load data'),
                );
              }
            },
          ),
          BlocBuilder<PickCubit, PickState>(
            builder: (context, state) {
              if (state is PickSelectionChanged) {
                bool allFalse =
                    state.isSelected.every((element) => element == false);
                if (!allFalse) {
                  return BottomBackground(
                    butoon1: Container(),
                    button2: BlocBuilder<ButtonNextCubit, ButtonNextState>(
                      builder: (context, state) {
                        bool next =
                            state is ButtonNextChange ? state.next : false;
                        return InkWell(
                          onTap: () {
                            if (next) {
                              context.read<PickWordDataCubit>().showPickWord();
                              context
                                  .read<ButtonNextCubit>()
                                  .changeButton(false);
                            } else {
                              context.read<PickCubit>().check();
                              context
                                  .read<ButtonNextCubit>()
                                  .changeButton(true);
                            }
                          },
                          child: ButtonNext(
                            next: next,
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
