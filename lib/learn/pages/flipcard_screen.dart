import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:toefl_app/learn/widget/flipcard_widget.dart';

class FlipcardScreen extends StatefulWidget {
  const FlipcardScreen({super.key});

  @override
  State<FlipcardScreen> createState() => _FlipcardScreenState();
}

class _FlipcardScreenState extends State<FlipcardScreen> {
  int _currentIndex = 0;
  final keyList = List.generate(5 + 1, (index) => GlobalKey<FlipCardState>());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _showFlipcardBeginDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text('Flipcards'),
        centerTitle: true,
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
                      if (keyList[_currentIndex].currentState?.isFront !=
                          true) {
                        keyList[_currentIndex].currentState?.toggleCard();
                      }
                      if (index != (5 + 1) - 1) {
                        _currentIndex = index;
                      } else {
                        _showFlipcardCompletedDialog();
                      }
                    });
                  },
                ),
                itemCount: 5 + 1,
                itemBuilder: (context, index, realIndex) {
                  if (index == (5 + 1) - 1) {
                    return SizedBox();
                  }

                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: FlipCard(
                      key: keyList[index],
                      flipOnTouch: disableFlip(index),
                      front: FlipcardWidget(
                        title: ' ',
                        content: 'trend',
                        color: Color.fromRGBO(20, 72, 122, 1),
                        textColor: Colors.white,
                        contentSize: 40,
                      ),
                      back: FlipcardWidget(
                        title: 'tren',
                        content: "nomina: gaya mutakhir\n\nverb: the direction or way in which something is changing\n\nToday's computer culture is trending toward more touch-screen technology.",
                        color: Color.fromRGBO(246, 196, 16, 1),
                        textColor: Colors.black,
                        contentSize: 17,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text(
                '${_currentIndex + 1} of ${(5 + 1) - 1}',
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool disableFlip(index) {
    if (index != _currentIndex) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> _showFlipcardBeginDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            content: const SingleChildScrollView(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image(
                        image: AssetImage(
                            'assets/images/flipcard_dialog_image_1.png')),
                    Text('Tap to flip the card'),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Image(
                        image: AssetImage(
                            'assets/images/flipcard_dialog_image_2.png')),
                    Text(
                      'Swipe left/right\nto the next/previous card',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            )),
            actions: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(246, 196, 16, 1),
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 3,
                        )
                      ]),
                  child: TextButton(
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Color.fromRGBO(20, 72, 122, 1)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showFlipcardCompletedDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            content: const SingleChildScrollView(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.check_rounded,
                  color: Color.fromRGBO(20, 72, 122, 1),
                  size: 100,
                ),
                Text('Flipcards Completed'),
              ],
            )),
            actions: <Widget>[
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(),
                      ),
                      child: TextButton(
                        child: const Text(
                          'Go back',
                          style:
                              TextStyle(color: Color.fromRGBO(20, 72, 122, 1)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(246, 196, 16, 1),
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(2, 2),
                              blurRadius: 3,
                            )
                          ]),
                      child: TextButton(
                        child: const Text(
                          'Start again',
                          style:
                              TextStyle(color: Color.fromRGBO(20, 72, 122, 1)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FlipcardScreen()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
