part of 'pick_cubit.dart';

@immutable
abstract class PickState extends Equatable {
  const PickState();

  @override
  List<Object?> get props => [];
}

class PickInitial extends PickState {}

class PickSelectionChanged extends PickState {
  final List<bool> isSelected;
  final List<String> chosen;

  PickSelectionChanged({List<bool>? isSelected, List<String>? chosen})
      : isSelected = isSelected ?? List.generate(8, (_) => false),
        chosen = chosen ?? [];

  @override
  List<Object?> get props => [isSelected, chosen];
}
