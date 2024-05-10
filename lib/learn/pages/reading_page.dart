import 'package:flutter/material.dart';
import 'package:toefl_app/learn/pages/readingtest_page.dart';

void main() {
  runApp(ReadingPage());
}

class ReadingPage extends StatelessWidget {
  const ReadingPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
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
            Positioned(
              left: 5,
              right: 5,
              bottom: 0,
              child: Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Atest()));
                        },
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Color(0xFF14487A)),
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.all(10.0),
                        ),
                        child: const Text(
                          'Test',
                          style: TextStyle(color: Color(0xFF14487A)),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          // Button Next location
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF14487A),
                          padding: EdgeInsets.all(10.0),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
