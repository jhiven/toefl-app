import 'package:equatable/equatable.dart';
import 'package:toefl_app/domain/models/test_section_model.dart';

class TestPacketModel extends Equatable {
  final String name;
  final List<TestSectionModel> listSection;
  final int id;

  const TestPacketModel({
    required this.name,
    required this.listSection,
    required this.id,
  });

  factory TestPacketModel.fromJson(Map<String, dynamic> json) {
    final questions = json['test_question'] as List;

    return TestPacketModel(
      name: json['name'] as String,
      id: json['id'] as int,
      listSection: SectionType.values
          .where((element) => element != SectionType.unknown)
          .map((sectionType) => TestSectionModel.fromQuestionsJson(
              questions: questions, sectionType: sectionType))
          .toList(),
    );
  }

  TestPacketModel copyWith({
    String? name,
    int? id,
    List<TestSectionModel>? listSection,
  }) {
    return TestPacketModel(
      name: name ?? this.name,
      id: id ?? this.id,
      listSection: listSection ?? this.listSection,
    );
  }

  @override
  List<Object?> get props => [name, listSection, id];
}
