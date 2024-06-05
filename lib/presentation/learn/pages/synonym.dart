import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/models/synonym.dart';
import 'package:toefl_app/domain/state/synonym_cubit.dart';
import 'package:toefl_app/domain/state/synonym_data/synonym_data_cubit.dart';
import 'package:toefl_app/presentation/learn/widget/bottom_backgorund.dart';
import 'package:toefl_app/presentation/learn/widget/button_next.dart';

class SynonymGame extends StatefulWidget {
  const SynonymGame({super.key});

  @override
  State<SynonymGame> createState() => _SynonymGameState();
}

class _SynonymGameState extends State<SynonymGame> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _showBeginDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double widthItem = screenWidth * 0.4;
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
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: Text(
                  "Choose Synonym Word",
                  style: TextStyle(fontSize: 18),
                ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                ...data.map((kata1) {
                                  int index = data.indexOf(kata1);
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
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
                                          height: 80,
                                          width: widthItem,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(9)),
                                            color: state is SynonymWord1Click &&
                                                    state.answer1[index]
                                                ? Colors.green.shade300
                                                : const Color.fromARGB(
                                                    255, 143, 195, 244),
                                            border: state
                                                        is SynonymWord1Click &&
                                                    (state.isSelected1[index] ||
                                                        state.answer1[index])
                                                ? Border.all(
                                                    color: state.answer1[index]
                                                        ? Colors.green.shade300
                                                        : Colors.black,
                                                    width: 2,
                                                  )
                                                : null,
                                          ),
                                          child: Center(
                                            child: Text(kata1.word1,
                                                style: TextStyle(fontSize: 18)),
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
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
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
                                          height: 80,
                                          width: widthItem,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(9)),
                                            color: state is SynonymWord1Click &&
                                                    state.answer2[index]
                                                ? Colors.green.shade300
                                                : const Color.fromARGB(
                                                    255, 143, 195, 244),
                                            border: state
                                                        is SynonymWord1Click &&
                                                    (state.isSelected2[index] ||
                                                        state.answer2[index])
                                                ? Border.all(
                                                    color: state.answer2[index]
                                                        ? Colors.green.shade300
                                                        : Colors.black,
                                                    width: 2,
                                                  )
                                                : null,
                                          ),
                                          child: Center(
                                            child: Text(kata2.word2,
                                                style: TextStyle(fontSize: 18)),
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

  Future<void> _showBeginDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Theme(
            data: Theme.of(context).copyWith(
              dialogBackgroundColor: Colors.white,
              colorScheme: ColorScheme.fromSwatch().copyWith(
                surface: Colors.white,
                surfaceTint: Colors.transparent,
              ),
            ),
            child: AlertDialog(
              backgroundColor: Colors.white,
              content: const SingleChildScrollView(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Synonym',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                            'Match the left box and the right box. If the answer is correct the border will change to green.'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Image(
                            image:
                                AssetImage('assets/images/synonym_dialog.png')),
                      ),
                    ],
                  ),
                ],
              )),
              actions: <Widget>[
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(246, 196, 16, 1),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(2, 2),
                            blurRadius: 3,
                          )
                        ]),
                    child: TextButton(
                      child: const Text(
                        'OK',
                        style: TextStyle(color: Color.fromRGBO(20, 72, 122, 1)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
