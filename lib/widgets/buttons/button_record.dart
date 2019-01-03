import 'package:flutter/material.dart';

class RecordButton extends StatefulWidget {
  void Function() onRecordButtonPress;
  void Function() onStopRecordButtonPress;

  RecordButton({this.onRecordButtonPress, this.onStopRecordButtonPress});

  @override
  _RecordButtonState createState() => new _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  RecordState _recordState = RecordState.STOPPED;

  @override
  void initState() {
    super.initState();
    _recordState = RecordState.STOPPED;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(child: _buildButton());
  }

  Widget _buildButton() {
    switch (_recordState) {
      case RecordState.STOPPED:
        return _buildRecordButton();
      case RecordState.RECORDING:
        return _buildStopButton();
    }
  }

  Widget _buildRecordButton() {
    return FloatingActionButton(
      onPressed: _onRecordButtonPressed,
      child: Icon(Icons.mic),
    );
  }

  Widget _buildStopButton() {
    return FloatingActionButton(
      onPressed: _onStopButtonPressed,
      child: Icon(Icons.stop),
    );
  }

  void _onRecordButtonPressed() {
    widget.onRecordButtonPress();
    setState(() {
      _recordState = RecordState.RECORDING;
    });
  }

  void _onStopButtonPressed() {
    widget.onStopRecordButtonPress();
    setState(() {
      _recordState = RecordState.STOPPED;
    });

  }
}

enum RecordState { RECORDING, STOPPED }
