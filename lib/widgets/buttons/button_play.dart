import 'package:flutter/material.dart';

class PlayButton extends StatefulWidget {
  void Function() onPlayButtonPress;
  void Function() onStopButtonPress;

  PlayButton({this.onPlayButtonPress, this.onStopButtonPress});

  @override
  _PlayButtonState createState() => new _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  PlayState _playState = PlayState.STOPPED;

  @override
  void initState() {
    super.initState();
    _playState = PlayState.STOPPED;
  }

  @override
  Widget build(BuildContext context) {
    return _buildButton();
  }

  Widget _buildButton() {
    switch (_playState) {
      case PlayState.PLAYING:
        return _buildStopButton();
      case PlayState.STOPPED:
        return _buildPlayButton();
    }
  }

  Widget _buildPlayButton() {
//    return Container(
//      color: Colors.lightBlue,
//      child: IconButton(
//        icon: Icon(Icons.play_arrow),
//        onPressed: _onPlayButtonPressed,
//      ),
//    );
    return Center(child: SizedBox(height: 35, width: 38, child: IconButton(padding: EdgeInsets.all(0),icon: Icon(Icons.play_arrow), onPressed: _onPlayButtonPressed)));
  }

  Widget _buildStopButton() {
    return FlatButton(
      onPressed: _onStopButtonPressed,
      child: Icon(Icons.stop),
    );
  }

  void _onPlayButtonPressed() {
    widget.onPlayButtonPress();
    setState(() {
      _playState = PlayState.PLAYING;
    });
  }

  void _onStopButtonPressed() {
    widget.onStopButtonPress();
    setState(() {
      _playState = PlayState.STOPPED;
    });
  }
}

enum PlayState { PLAYING, STOPPED }
