import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/button_next_cubit.dart';
import 'package:toefl_app/domain/state/flip_card_data/flip_card_data_cubit.dart';
import 'package:toefl_app/domain/state/pick_word_data/pick_word_data_cubit.dart';
import 'package:toefl_app/domain/state/synonym_data/synonym_data_cubit.dart';
import 'package:toefl_app/presentation/learn/pages/flipcard_screen.dart';
import 'package:toefl_app/presentation/learn/pages/pick_word.dart';
import 'package:toefl_app/presentation/learn/pages/synonym.dart';
import 'package:toefl_app/presentation/learn/widget/customListTile.dart';

class MiniGames extends StatefulWidget {
  const MiniGames({super.key});

  @override
  State<MiniGames> createState() => _MiniGamesState();
}

class _MiniGamesState extends State<MiniGames> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mini Games',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/mg.jpg',
                width: 330,
                height: 308.89,
              ),
            ),
            Text(
              'Pick Your Mini Games',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  context.read<SynonymDataCubit>().showSynonym();
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>SynonymGame(),));
                },
                child: CustomListTile(image: 'assets/iconoir_search-font.png', title: 'Synonym', trailing: 0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  context.read<FlipCardDataCubit>().showFlipCard();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FlipcardScreen(),));
                },
                child: CustomListTile(image: 'assets/card.png', title: 'Flip Card', trailing: 0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  context.read<PickWordDataCubit>().showPickWord();
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>PickWord(),));
                  context.read<ButtonNextCubit>().changeButton(false);
                },
                child: CustomListTile(image: 'assets/Vector.png', title: 'Pick Words', trailing: 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
