part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final bool isSubmitted;
  const SignInState({
    this.isSubmitted = false,
  });

  SignInState copyWith({
    bool? isSubmitted,
  }) {
    return SignInState(
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }

  @override
  List<Object> get props => [isSubmitted];
}
