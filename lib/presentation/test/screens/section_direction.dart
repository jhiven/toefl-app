import 'package:flutter/material.dart';
import 'package:toefl_app/domain/models/test_section_model.dart';
import 'package:toefl_app/presentation/test/widgets/preparation_page.dart';

class SectionDirection extends StatelessWidget {
  const SectionDirection({
    super.key,
    required this.sectionType,
  });

  final SectionType sectionType;

  @override
  Widget build(BuildContext context) {
    switch (sectionType) {
      case SectionType.listening:
        return const PreparationPage(
          heading: "Listening Comprehension",
          desc:
              "In this section of the test, you will have an opportunity to demonstrate your ability to understand conversations and talks in English. There are three parts to this section with special directions for each part. Answer all the questions on the basis of what is stated or implied by the speakers in this test. When you take the actual TOEFL test, you will not be allowed to take notes or write in your test book.",
          url:
              'https://vnnepnnwzlgsectnnyyc.supabase.co/storage/v1/object/public/listening-audio/paket%201/no1.mp3',
        );
      case SectionType.structure:
        return const PreparationPage(
          heading: "Structure and Written Expretion",
          desc:
              "Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus ",
        );
      case SectionType.reading:
        return const PreparationPage(
          heading: "Reading Comprehension",
          desc:
              "Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus",
        );
      default:
        return const SizedBox();
    }
  }
}
