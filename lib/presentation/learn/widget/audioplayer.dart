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
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _playerState = PlayerState.stopped;
    _player.onPlayerStateChanged.listen((PlayerState s) {
      if (mounted) {
        setState(() {
          _playerState = s;
        });
      }
    });
    _player.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          _duration = newDuration;
        });
      }
    });

    _player.onPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          _position = newPosition;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(15)
      ),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          IconButton(
            icon: _playerState == PlayerState.playing // Perubahan di sini
                ? Icon(Icons.pause)
                : Icon(Icons.play_arrow), iconSize: 30,
            onPressed: () {
              if (_playerState == PlayerState.playing) {
                // Perubahan di sini
                _player.pause();
                if (mounted) {
                  setState(() {
                    _isPaused = true;
                  });
                }
              } else {
                if (_isPaused) {
                  _player.resume();
                } else {
                  _player.play(
                    UrlSource(widget.url),
                  );
                }
                if (mounted) {
                  setState(() {
                    _isPaused = false;
                  });
                }
              }
            },
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 30,
                ),
                _buildSlider(),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_formatTime(_position)),
                      Text(_formatTime(_duration))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Widget _buildSlider() {
    return Slider(
      min: 0,
      max: _duration.inSeconds.toDouble(),
      value: _position.inSeconds.toDouble(),
      onChanged: (value) async {
        final position = Duration(seconds: value.toInt());
        await _player.seek(position);
      },
    );
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return "$minutes:$seconds";
  }
}
