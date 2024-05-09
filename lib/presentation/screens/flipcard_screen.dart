import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toefl_app/presentation/widgets/flipcard_widget.dart';

class FlipcardScreen extends StatefulWidget {
  const FlipcardScreen({super.key});

  @override
  State<FlipcardScreen> createState() => _FlipcardScreenState();
}

class _FlipcardScreenState extends State<FlipcardScreen> {
  int _currentIndex = 0;
  final keyList =
      List.generate(5, (index) => GlobalKey<FlipCardState>());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_rounded)),
        title: Text('Flipcards'),
        titleSpacing: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 600,
                  viewportFraction: 0.85, 
                  enlargeCenterPage: true, 
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      if (keyList[_currentIndex].currentState?.isFront != true){
                        keyList[_currentIndex].currentState?.toggleCard();
                      }
                      _currentIndex = index;
                    });
                  },
                ),
                itemCount: 5,
                itemBuilder: (context, index, realIndex) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: FlipCard(
                      key: keyList[index],
                      flipOnTouch: disableFlip(index),
                      front: FlipcardWidget(title: 'QUESTION', color: Color.fromRGBO(20, 72, 122, 1),), 
                      back: FlipcardWidget(title: 'ANSWER', color: Color.fromRGBO(246, 196, 16, 1),),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text(
                '${_currentIndex + 1} of 5',
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool disableFlip(index) {
    if(index != _currentIndex) {
      return false;
    }
    else{
      return true;
    }
  }
}