import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String url;

  const AudioPlayerWidget({
    super.key,
    required this.url,
  });

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final _player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _player.play(
          UrlSource(widget.url),
        );
      },
      child: const Text('Play'),
    );
  }
}
