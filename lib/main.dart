import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
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
import 'package:toefl_app/domain/state/test_history/test_history_cubit.dart';
import 'package:toefl_app/domain/state/test_leaderboard/test_leaderboard_cubit.dart';
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
import 'package:toefl_app/presentation/test/screens/login_screen.dart';
import 'package:toefl_app/presentation/test/widgets/bottom_navigation.dart';
import 'package:toefl_app/theme.dart';
import 'package:toefl_app/utils/supabase_constants.dart';
import 'package:toefl_app/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  initializeDateFormatting();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

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
          : const NavigationBottom(),
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
          create: (context) =>
              MaterialRepository(supabaseDatabase: supabaseDatabase),
        ),
        RepositoryProvider(
          create: (context) =>
              ExampleRepository(supabaseDatabase: supabaseDatabase),
        ),
        RepositoryProvider(
          create: (context) =>
              SynonymRepository(supabaseDatabase: supabaseDatabase),
        ),
        RepositoryProvider(
          create: (context) =>
              PickWordRepository(supabaseDatabase: supabaseDatabase),
        ),
        RepositoryProvider(
          create: (context) =>
              FlipCardRepository(supabaseDatabase: supabaseDatabase),
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
            lazy: false,
            create: (context) => UserCubit(
              context.read<AuthRepository>(),
            )..getSession(),
          ),
          BlocProvider(
            create: (context) => TestPacketCubit(
              context.read<TestRepository>(),
            ),
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
            create: (context) =>
                MaterialModulCubit(context.read<MaterialRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                ExampleQuestionCubit(context.read<ExampleRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                SynonymDataCubit(context.read<SynonymRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                PickWordDataCubit(context.read<PickWordRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                FlipCardDataCubit(context.read<FlipCardRepository>()),
          ),
          BlocProvider(
            create: (context) => TestHistoryCubit(
              testRepository: context.read<TestRepository>(),
            )..getHistory(
                userId: Supabase.instance.client.auth.currentUser!.id,
              ),
          ),
          BlocProvider(
            create: (context) => TestLeaderboardCubit(
              testRepository: context.read<TestRepository>(),
            )..getLeaderboard(),
          ),
        ],
        child: MaterialApp(
          title: 'Toefl PENS',
          themeMode: ThemeMode.light,
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: home,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
        ),
      ),
    );
  }
}
