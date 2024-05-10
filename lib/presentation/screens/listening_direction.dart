import 'package:flutter/material.dart';
import 'package:toefl_app/presentation/widgets/preparation_page.dart';

class ListeningPage extends StatelessWidget {
  const ListeningPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PreparationPage(
        heading: "Listening Comprehension",
        desc:
            "In this section of the test, you will have an opportunity to demonstrate your ability to understand conversations and talks in English. There are three parts to this section with special directions for each part. Answer all the questions on the basis of what is stated or implied by the speakers in this test. When you take the actual TOEFL test, you will not be allowed to take notes or write in your test book.",
        url:
            'https://vnnepnnwzlgsectnnyyc.supabase.co/storage/v1/object/public/listening-audio/paket%201/no1.mp3',
      ),
    );
  }
}
