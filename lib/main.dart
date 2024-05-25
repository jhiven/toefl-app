import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/data/provider/supabase_database.dart';
import 'package:toefl_app/data/repository/auth_repository.dart';
import 'package:toefl_app/data/repository/test_repository.dart';
import 'package:toefl_app/domain/state/auth/authentication_cubit.dart';
import 'package:toefl_app/domain/state/test_history/test_history_cubit.dart';
import 'package:toefl_app/domain/state/test_packet/test_packet_cubit.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/domain/state/timer/timer_bloc.dart';
import 'package:toefl_app/domain/state/user/user_cubit.dart';
import 'package:toefl_app/presentation/screens/login_screen.dart';
import 'package:toefl_app/presentation/widgets/bottom_navigation.dart';
import 'package:toefl_app/theme.dart';
import 'package:toefl_app/utils/supabase_constants.dart';
import 'package:toefl_app/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  initializeDateFormatting();

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
            create: (context) => TestHistoryCubit(
              testRepository: context.read<TestRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
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
