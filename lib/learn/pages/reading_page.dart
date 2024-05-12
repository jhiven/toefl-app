import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/answer_cubit.dart';
import 'package:toefl_app/domain/state/button_next_cubit.dart';
import 'package:toefl_app/domain/state/modul_cubit.dart';
import 'package:toefl_app/learn/pages/listening_page.dart';
import 'package:toefl_app/learn/pages/readingtest_page.dart';
import 'package:toefl_app/learn/widget/bottom_backgorund.dart';
import 'package:toefl_app/learn/widget/button_next.dart';
import 'package:toefl_app/learn/widget/button_test.dart';
import 'package:toefl_app/learn/pages/question.dart';

class ReadingPage extends StatelessWidget {
  const ReadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModulCubit, ModulState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: state is ModulValue ? Text(state.chapter) : Container(),
            centerTitle: true,
            forceMaterialTransparency: true,
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: RichText(
                        text: TextSpan(
                          text:
                              'Once upon a time, in a quaint little village nestled between rolling hills and lush forests, there lived a young girl named Elara. Elara was known throughout the village for her adventurous spirit and insatiable curiosity. From a young age, she dreamed of exploring the world beyond the confines of her small village. One crisp autumn morning, as the leaves danced in the gentle breeze, Elara made a decision that would change her life forever. With a determined gleam in her eye, she packed a small bag with essentials and bid farewell to her family. "I\'m going on an adventure," she declared, her heart pounding with excitement. Setting off into the unknown, Elara traversed winding paths and crossed babbling brooks, her spirit soaring with each step. Along the way, she encountered friendly villagers who shared tales of distant lands and hidden treasures. Their words fueled her desire to see the world beyond the horizon. As days turned into weeks and weeks into months, Elara\'s journey took her to places she had only dreamed of. She marveled at towering mountains, wandered through bustling marketplaces, and slept beneath the stars in far-flung meadows. Each new experience filled her with wonder and joy. But amidst the beauty and adventure, Elara also faced challenges and obstacles. She weathered fierce storms, braved treacherous terrain, and encountered creatures both strange and wondrous. Yet, through it all, she remained undaunted, drawing strength from the knowledge that every trial was a step closer to her dreams. One fateful day, as the sun dipped below the horizon, Elara stumbled upon a hidden valley shrouded in mist. Intrigued by the mystery that lay beyond, she pressed on, her heart racing with anticipation. And there, nestled among ancient ruins, she discovered a secret that would change everything. In the heart of the valley stood a majestic tree, its branches reaching towards the sky like outstretched arms. Beneath its boughs lay a forgotten treasure—a tome of ancient wisdom containing the secrets of the world. With trembling hands, Elara opened the book, its pages whispering tales of courage, love, and adventure. As she traced her fingers over the words, Elara realized that her journey had never been about the destinations she sought, but the experiences she had along the way. Each triumph and tribulation had shaped her into the person she had become—a fearless explorer, a seeker of truth, and a guardian of dreams. And so, with the knowledge gleaned from the ancient tome, Elara returned to her village, her heart overflowing with stories of her adventures. But more than that, she brought with her a newfound sense of purpose—to inspire others to chase their dreams, explore the unknown, and embrace the magic that lay waiting just beyond the horizon. From that day forward, Elara\'s village was never the same. Her tales captivated the hearts and minds of all who listened, igniting a spark of wanderlust in even the most reluctant souls. And though her journey had come to an end, her spirit lived on in every adventurer who dared to follow in her footsteps. And so, dear reader, remember this—no journey is too long, no dream too big, for in the heart of every explorer lies the courage to chase the unknown and discover the magic that lies within.',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
              BottomBackground(
                butoon1: InkWell(
                  onTap: () {
                    String modul = state is ModulValue ? state.modul : '';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => _changeWidget(modul),
                      ),
                    );
                    context.read<ButtonNextCubit>().changeButton(false);
                    context.read<AnswerCubit>().resetAnswer();
                  },
                  child: ButtonTest(),
                ),
                button2: InkWell(
                  onTap: () {},
                  child: ButtonNext(
                    next: true,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _changeWidget(String modul) {
    if (modul == 'Reading') {
      return ReadingTest();
    } else if (modul == 'Listening') {
      return ListeningTest();
    } else {
      return QuestionScreen();
    }
  }
}
