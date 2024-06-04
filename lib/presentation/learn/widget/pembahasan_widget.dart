import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/models/material_question.dart';
import 'package:toefl_app/domain/state/button_next_cubit.dart';

class PembahasanWidget extends StatelessWidget {
  const PembahasanWidget({super.key, required this.question});
  final MaterialQuestionModel question;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonNextCubit, ButtonNextState>(
      builder: (context, state) {
        final ValueNotifier<bool> _isExpanded = ValueNotifier<bool>(false);
        const int _maxLines = 3;
        if (state is ButtonNextChange && state.next) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.amber,
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Pembahasan',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: _isExpanded,
                      builder: (context, isExpanded, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question.pembahasan,
                              maxLines: isExpanded ? null : _maxLines,
                              overflow: isExpanded
                                  ? TextOverflow.visible
                                  : TextOverflow.ellipsis,
                            ),
                            GestureDetector(
                              onTap: () {
                                _isExpanded.value = !_isExpanded.value;
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF14487A),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    isExpanded ? 'Show less' : 'Show more',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                )),
          );
        }
        return Container();
      },
    );
  }
}
