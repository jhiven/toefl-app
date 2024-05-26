part of 'modul_cubit.dart';

sealed class ModulState extends Equatable {
  const ModulState();

  @override
  List<Object> get props => [];
}

final class ModulInitial extends ModulState {}

final class ModulValue extends ModulState{
  final String modul;
  final String chapter;

  const ModulValue({required this.modul, required this.chapter});

  @override
  List<Object> get props => [modul, chapter];
}