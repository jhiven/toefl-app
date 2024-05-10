import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/pick_cubit.dart';
import 'package:toefl_app/domain/state/synonym_cubit.dart';
import 'package:toefl_app/presentation/screens/pick_word.dart';
import 'package:toefl_app/presentation/screens/synonym.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SynonymCubit(),
        ),
        BlocProvider(
          create: (context) => PickCubit(),
        )
      ],
      child: const MaterialApp(
        home: PickWord(),
      ),
    );
  }
}
