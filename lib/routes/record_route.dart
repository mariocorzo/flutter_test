import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_module_tests/widgets/buttons/button_play.dart';
import 'package:flutter_module_tests/widgets/buttons/button_record.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'package:path_provider/path_provider.dart';

class RecordScreen extends StatefulWidget {
  @override
  RecordScreenState createState() => new RecordScreenState();
}

class RecordScreenState extends State<RecordScreen> {
  FlutterSound flutterSound;
  String _recorderTxt = '00:00:00';
  String _playerTxt = '00:00:00';
  StreamSubscription _recorderSubscription;
  StreamSubscription _playerSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterSound = new FlutterSound();
    flutterSound.setSubscriptionDuration(0.01);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Record"),
        ),
        body: Column(
          children: <Widget>[
            FlatButton(child: Text("Testear"), onPressed: _buttonTest),
            Container(
              height: 1.0,
              color: Colors.black,
            ),
            FutureBuilder<List<FileSystemEntity>>(
                future: _getFiles(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    print("SNAPSHOT HAS DATA");
                    List items = snapshot.data;
                    items = items.reversed.toList();
                    return Expanded(
                      child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            print(items[index].path);
                            return Text(items[index].path.toString());
                          }),
                    );
                  } else {
                    return new Container();
                  }
                }),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                _recorderTxt,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 1.0,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(child: RecordButton(onRecordButtonPress: _onRecordButtonPress, onStopRecordButtonPress: _onStopRecordButtonPress)))),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(child: PlayButton(onPlayButtonPress: _onPlayButtonPress, onStopButtonPress: _onStopPlayButtonPress)))),
            ),
          ],
        ));
  }

  void _onRecordButtonPress() async {
    try {
      var dir = await getExternalStorageDirectory();
      var dire = dir.path.toString() + "/" + new DateTime.now().toString();
      String path = await flutterSound.startRecorder(dire);

      _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
        DateTime date = new DateTime.fromMillisecondsSinceEpoch(e.currentPosition.toInt());
        String txt = DateFormat('mm:ss:SS', 'en_US').format(date);

        this.setState(() {
          this._recorderTxt = txt.substring(0, 8);
        });
      });
    } on Exception catch (err) {
      print('startRecorder error: $err');
    }
  }

  void _onStopRecordButtonPress() async {
    try {
      String result = await flutterSound.stopRecorder();
      print('stopRecorder: $result');

      if (_recorderSubscription != null) {
        _recorderSubscription.cancel();
        _recorderSubscription = null;
      }
    } catch (err) {
      print('stopRecorder error: $err');
    }
  }

  void _onStopPlayButtonPress() async {
    try {
      String result = await flutterSound.stopPlayer();
      print('stopPlayer: $result');
      if (_playerSubscription != null) {
        _playerSubscription.cancel();
        _playerSubscription = null;
      }

//      this.setState(() {
//        this._isPlaying = false;
//      });
    } catch (err) {
      print('error: $err');
    }
  }

  void _onPlayButtonPress() async {
    String path = await flutterSound.startPlayer(null);
    await flutterSound.setVolume(1.0);
    print('startPlayer: $path');

    try {
      _playerSubscription = flutterSound.onPlayerStateChanged.listen((e) {
        if (e != null) {
          DateTime date = new DateTime.fromMillisecondsSinceEpoch(e.currentPosition.toInt());
          String txt = DateFormat('mm:ss:SS', 'en_US').format(date);
          this.setState(() {
//            this._isPlaying = true;
            this._playerTxt = txt.substring(0, 8);
          });
        }
      });
    } catch (err) {
      print('error: $err');
    }
  }

  void _buttonTest() {}

  Future<List<FileSystemEntity>> _getFiles() async {
    var externalStorageDirectory = await getExternalStorageDirectory();
    return externalStorageDirectory.list().where((entity)=> entity is File).toList();
  }
}
