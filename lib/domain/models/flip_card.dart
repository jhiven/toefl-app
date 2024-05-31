import 'package:equatable/equatable.dart';

class FlipCardModel extends Equatable {
  final String frontSide;
  final String translation;
  final String backSide;

  const FlipCardModel({required this.frontSide, required this.translation, required this.backSide});

  factory FlipCardModel.fromJson(Map<String, dynamic> json) {
    return FlipCardModel(
      frontSide: json['front_side'] as String,
      translation: json['vocab_translation'] as String,
      backSide: json['back_side'] as String,
    );
  }


  static const empty = FlipCardModel(
    frontSide: '',
    translation: '',
    backSide: ''
  );

  @override
  List<Object?> get props => [frontSide, translation, backSide];
}