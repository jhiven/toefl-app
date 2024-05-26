import 'package:equatable/equatable.dart';

class MaterialModel extends Equatable {
  final int id;
  final String title;
  final String content;
  // final MaterialQuestionModel question;

  const MaterialModel({
    required this.id,
    required this.title,
    required this.content,
    // required this.question,
  });

  factory MaterialModel.fromJson(Map<String, dynamic> json) {

  return MaterialModel(
    id: json['id'] as int,
    title: json['title'] as String,
    content: json['content'] as String,
    // question: MaterialQuestionModel.fromJson(json: 
    //   json['example_question'] as Map<String, dynamic>,
    // ),
  );
}


  static const empty = MaterialModel(
    id: 0,
    title: '',
    content: '',
    // question: MaterialQuestionModel.empty,
  );

  @override
  List<Object?> get props => [id, title, content];
}
