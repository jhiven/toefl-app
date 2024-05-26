import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/data/provider/supabase_database.dart';
import 'package:toefl_app/data/repository/auth_repository.dart';
import 'package:toefl_app/data/repository/example_question.dart';
import 'package:toefl_app/data/repository/flip_card_repository.dart';
import 'package:toefl_app/data/repository/meterial_repository.dart';
import 'package:toefl_app/data/repository/pick_word_repository.dart';
import 'package:toefl_app/data/repository/synonym_repository.dart';
import 'package:toefl_app/data/repository/test_repository.dart';
import 'package:toefl_app/domain/state/answer_cubit.dart';
import 'package:toefl_app/domain/state/auth/authentication_cubit.dart';
import 'package:toefl_app/domain/state/button_next_cubit.dart';
import 'package:toefl_app/domain/state/example_question/example_question_cubit.dart';
import 'package:toefl_app/domain/state/flip_card_data/flip_card_data_cubit.dart';
import 'package:toefl_app/domain/state/material/material_cubit.dart';
import 'package:toefl_app/domain/state/modul_cubit.dart';
import 'package:toefl_app/domain/state/pick_cubit.dart';
import 'package:toefl_app/domain/state/pick_word_data/pick_word_data_cubit.dart';
import 'package:toefl_app/domain/state/synonym_cubit.dart';
import 'package:toefl_app/domain/state/synonym_data/synonym_data_cubit.dart';
import 'package:toefl_app/domain/state/test_packet/test_packet_cubit.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/domain/state/timer/timer_bloc.dart';
import 'package:toefl_app/domain/state/user/user_cubit.dart';
import 'package:toefl_app/presentation/screens/home_screen.dart';
import 'package:toefl_app/presentation/screens/login_screen.dart';
import 'package:toefl_app/utils/supabase_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = SimpleBlocObserver();

  final supabase = await Supabase.initialize(
    url: SupabaseConstants.url,
    anonKey: SupabaseConstants.anonKey,
  );

  runApp(
    MyApp(
      supabaseDatabase: SupabaseDatabase(
        supabaseClient: supabase.client,
      ),
      home: supabase.client.auth.currentSession == null
          ? const LoginScreen()
          : const HomeScreen(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.supabaseDatabase,
    required this.home,
  });

  final SupabaseDatabase supabaseDatabase;
  final Widget home;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(
            supabaseDatabase: supabaseDatabase,
          ),
        ),
        RepositoryProvider(
          create: (context) => TestRepository(
            supabaseDatabase: supabaseDatabase,
          ),
        ),
        RepositoryProvider(
          create: (context) => MaterialRepository(supabaseDatabase: supabaseDatabase),
        ),
        RepositoryProvider(
          create: (context) => ExampleRepository(supabaseDatabase: supabaseDatabase),
        ),
        RepositoryProvider(
          create: (context) => SynonymRepository(supabaseDatabase: supabaseDatabase),
        ),
        RepositoryProvider(
          create: (context) => PickWordRepository(supabaseDatabase: supabaseDatabase),
        ),
        RepositoryProvider(
          create: (context) => FlipCardRepository(supabaseDatabase: supabaseDatabase),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationCubit(
              context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => UserCubit(
              context.read<AuthRepository>(),
            )..getSession(),
          ),
          BlocProvider(
            create: (context) => TestPacketCubit(
              context.read<TestRepository>(),
            )..startTest(1),
          ),
          BlocProvider(
            create: (context) => TestSectionCubit(),
          ),
          BlocProvider(
            create: (context) => TimerBloc(),
          ),
          BlocProvider(
          create: (context) => SynonymCubit(),
        ),
        BlocProvider(
          create: (context) => PickCubit(),
        ),
        BlocProvider(
          create: (context) => ModulCubit(),
        ),
        BlocProvider(
          create: (context) => ButtonNextCubit(),
        ),
        BlocProvider(
          create: (context) => AnswerCubit(),
        ),
        BlocProvider(
          create: (context) => MaterialModulCubit(context.read<MaterialRepository>()),
        ),
        BlocProvider(
          create: (context) => ExampleQuestionCubit(context.read<ExampleRepository>()),
        ),
        BlocProvider(
          create: (context) => SynonymDataCubit(context.read<SynonymRepository>()),
        ),
        BlocProvider(
          create: (context) => PickWordDataCubit(context.read<PickWordRepository>()),
        ),
        BlocProvider(
          create: (context) => FlipCardDataCubit(context.read<FlipCardRepository>()),
        ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          themeMode: ThemeMode.light,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: home,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
        ),
      ),
    );
  }
}
