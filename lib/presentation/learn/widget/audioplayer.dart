import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicPlayer extends StatefulWidget {
  final String url;

  const MusicPlayer({
    super.key,
    required this.url,
  });

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final _player = AudioPlayer();
  late PlayerState _playerState;
  bool _isPaused = false;

  @override
    void initState() {
      super.initState();
      _playerState = PlayerState.stopped;
      _player.onPlayerStateChanged.listen((PlayerState s) {
        setState(() {
          _playerState = s;
        });
      });
    }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: _playerState == PlayerState.playing // Perubahan di sini
              ? Icon(Icons.pause)
              : Icon(Icons.play_arrow),
          onPressed: () {
            if (_playerState == PlayerState.playing) { // Perubahan di sini
              _player.pause();
              setState(() {
                _isPaused = true;
              });
            } else {
              if (_isPaused) {
                _player.resume();
              } else {
                _player.play(UrlSource(widget.url),);
              }
              setState(() {
                _isPaused = false;
              });
            }
          },
        ),
        if (_playerState == PlayerState.completed) // Perubahan di sini
          IconButton(
            icon: Icon(Icons.replay),
            onPressed: () {
              _player.seek(Duration.zero);
              _player.resume();
            },
          ),
      ],
    );
  }
   @override
    void dispose() {
      _player.dispose();
      super.dispose();
    }
}

