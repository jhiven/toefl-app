import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toefl_app/data/repository/auth_repository.dart';
import 'package:toefl_app/domain/models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthRepository _authRepository;

  UserCubit(this._authRepository) : super(UserInitial());

  void getSession() async {
    try {
      final UserModel user = await _authRepository.getUser();
      emit(
        UserFetchSucess(
          user: user,
        ),
      );
    } catch (e) {
      emit(UserNoSession());
    }
  }
}
