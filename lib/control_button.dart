import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/cupertino.dart';

import 'common.dart';


class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  ControlButtons(this.player);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Opens volume slider dialog
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Ink(
              decoration: const ShapeDecoration(
                color: Color(0xFF1B5E20),
                shape: CircleBorder(),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.volume_up),
                onPressed: () {
                  showSliderDialog(
                    context: context,
                    title: "Adjust volume",
                    divisions: 10,
                    min: 0.0,
                    max: 1.0,
                    stream: player.volumeStream,
                    onChanged: player.setVolume,
                  );
                },
              ),
            ),
          ),
        ),

        /// This StreamBuilder rebuilds whenever the player state changes, which
        /// includes the playing/paused state and also the
        /// loading/buffering/ready state. Depending on the state we show the
        /// appropriate button or loading indicator.
        StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                margin: EdgeInsets.all(8.0),
                width: 44.0,
                height: 44.0,
                child: CircularProgressIndicator(),
              );
            } else if (playing != true) {
              return Container(
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Color(0xFF1B5E20),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.play_arrow_outlined),
                    iconSize: 44.0,
                    onPressed: player.play,
                  ),
                ),
              );
            } else if (processingState != ProcessingState.completed) {
              return Container(
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.brown,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.pause),
                    iconSize: 44.0,
                    onPressed: player.pause,
                  ),
                ),
              );
            } else {
              return Container(
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Color(0xFF1B5E20),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.replay),
                    iconSize: 44.0,
                    onPressed: () => player.seek(Duration.zero),
                  ),
                ),
              );
            }
          },
        ),
        // Opens speed slider dialog
        StreamBuilder<double>(
          stream: player.speedStream,
          builder: (context, snapshot) => Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Ink(
                decoration: const ShapeDecoration(
                  color: Color(0xFF1B5E20),
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 34,
                  icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                  onPressed: () {
                    showSliderDialog(
                      context: context,
                      title: "Adjust speed",
                      divisions: 10,
                      min: 0.5,
                      max: 1.5,
                      stream: player.speedStream,
                      onChanged: player.setSpeed,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}