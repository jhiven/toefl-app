part of 'material_cubit.dart';

sealed class MaterialModulState extends Equatable {
  const MaterialModulState();

  @override
  List<Object> get props => [];
}

final class MaterialInitial extends MaterialModulState {}

final class MaterialLoading extends MaterialModulState {}

final class MaterialLoaded extends MaterialModulState {
  final List<MaterialModel> data;

  const MaterialLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

final class MaterialError extends MaterialModulState {
  final String message;

  const MaterialError({required this.message});

  @override
  List<Object> get props => [message];
}