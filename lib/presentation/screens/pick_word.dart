import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/pick_cubit.dart';

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
        leading: InkWell(
          onTap: () {},
          child: Icon(Icons.arrow_back),
        ),
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
                                    height: 50,
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 90.0,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF14487A),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
