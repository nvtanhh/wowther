import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'user_state.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState());

  bool get isLoggedIn => false;
}
