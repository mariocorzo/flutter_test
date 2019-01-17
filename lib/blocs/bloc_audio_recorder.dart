import 'dart:async';

class AudioRecorder {
  final StreamController<RecorderEvent> _recorderEvent = StreamController<RecorderEvent>();
}

class RecorderEvent {
  RecorderEventType _recorderEventType;

  RecorderEvent._internal(this._recorderEventType);

  RecorderEvent createRecorderPlayEvent() => new RecorderEvent._internal(RecorderEventType.Play);
  RecorderEvent createRecorderStopEvent() => new RecorderEvent._internal(RecorderEventType.Stop);
  RecorderEvent createRecorderRecordEvent() => new RecorderEvent._internal(RecorderEventType.Record);

  bool isPlayEvent() => RecorderEventType.Play == _recorderEventType;
  bool isStopEvent() => RecorderEventType.Stop == _recorderEventType;
  bool isRecordEvent() => RecorderEventType.Record == _recorderEventType;
}

enum RecorderEventType { Play, Stop, Record, Pause }
