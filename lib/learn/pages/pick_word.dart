import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/button_next_cubit.dart';
import 'package:toefl_app/domain/state/pick_cubit.dart';
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
    List<String> chapter = [
      'Bab I',
      'Bab II',
      'Bab III',
      'Bab IV',
      'Bab V',
      'Bab VI',
      'Bab VII',
      'Bab VIII'
    ];
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text("pilih kalimat"),
              ),
              BlocBuilder<PickCubit, PickState>(
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        ...chapter.map(
                          (value) {
                            int index = chapter.indexOf(value);

                            return Padding(
                              padding: const EdgeInsets.all(15),
                              child: InkWell(
                                onTap: () {
                                  context.read<PickCubit>().buttonBorder(index);
                                  context
                                      .read<PickCubit>()
                                      .getChosenText(value);
                                },
                                child: Container(
                                    height: 60,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(9)),
                                      color: const Color.fromARGB(
                                          255, 143, 195, 244),
                                      border: state is PickSelectionChanged &&
                                              state.isSelected[index]
                                          ? Border.all(
                                              color: Colors.black,
                                              width: 2,
                                            )
                                          : null,
                                    ),
                                    child: Center(
                                      child: Text(value),
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
          ),
          BottomBackground(
            butoon1: Container(),
            button2: BlocBuilder<ButtonNextCubit, ButtonNextState>(
              builder: (context, state) {
                bool next = state is ButtonNextChange ? state.next : false;
                return InkWell(
                  onTap: () {
                    if (next) {
                      print('true');
                      context.read<ButtonNextCubit>().changeButton(false);
                    }else{
                      print('false');
                      context.read<ButtonNextCubit>().changeButton(true);
                    }
                  },
                  child: ButtonNext(
                    next: next,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
