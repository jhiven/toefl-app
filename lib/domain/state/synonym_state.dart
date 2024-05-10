part of 'synonym_cubit.dart';

sealed class SynonymState extends Equatable {
  const SynonymState();

  @override
  List<Object> get props => [];
}

final class SynonymInitial extends SynonymState {}

final class SynonymWord1Click extends SynonymState{
  final List<bool> isSelected1;
  final String chosen1;
  final List<bool> isSelected2;
  final String chosen2;
  SynonymWord1Click({List<bool>? isSelected1, String? chosen1, List<bool>? isSelected2, String? chosen2})
      : isSelected1 = isSelected1 ?? List.generate(4, (_) => false),
        chosen1 = chosen1 ?? '',
        isSelected2 = isSelected2 ?? List.generate(4, (_) => false),
        chosen2 = chosen2 ?? '';
  
  @override
  List<Object> get props => [isSelected1, chosen1, isSelected2, chosen2];
}
