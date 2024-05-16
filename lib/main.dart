import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/bloc_observer.dart';
import 'package:toefl_app/data/provider/supabase_database.dart';
import 'package:toefl_app/data/repository/auth_repository.dart';
import 'package:toefl_app/data/repository/test_repository.dart';
import 'package:toefl_app/domain/state/auth/authentication_cubit.dart';
import 'package:toefl_app/domain/state/test_packet/test_packet_cubit.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/domain/state/timer/timer_bloc.dart';
import 'package:toefl_app/domain/state/user/user_cubit.dart';
import 'package:toefl_app/presentation/screens/home_page.dart';
import 'package:toefl_app/presentation/screens/login_screen.dart';
import 'package:toefl_app/theme.dart';
import 'package:toefl_app/utils/supabase_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

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
          : const HomePage(),
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
