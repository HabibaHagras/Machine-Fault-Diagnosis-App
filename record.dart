import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:file_case/file_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Auth/controllers/Record/RecordController.dart';
import 'Auth/controllers/Record/audiopicker_Controller.dart';
import 'constants/colors.dart';

class recordScreen extends StatefulWidget {
  const recordScreen({super.key});

  @override
  State<recordScreen> createState() => _recordScreenState();
}

class _recordScreenState extends State<recordScreen> {
/**----------------------------------المتغيرات الحلوة ---------------------------------- */

  final recorder = FlutterSoundRecorder(); //for record
  bool isRecording = false; // for record
  var cony = CupertinoIcons.play_circle; // for icon of play
  var t = null; // for duration

  late final RecorderController recorderController; // for wave ui

  var isWaveformDisplaying = true;
  var recordButtonIcon = CupertinoIcons.play_circle;
  final firstController = FileCaseController(
      filePickerOptions: FilePickerOptions(type: FileType.any),
      tag: 'controller1');
  RecordController _recordController = Get.put(RecordController());
  audiopicker_Controller _audiopicker_Controller =
      Get.put(audiopicker_Controller());
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text(
              'Please choose media to select',
              style: TextStyle(color: rBasicColor),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height / 8,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      _audiopicker_Controller.getRecord();
                    },
                    child: Container(
                      width: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.upload),
                          Text('Uplaod',
                              style: TextStyle(
                                fontSize: 16,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
/**---------------------------------------النهاية ----------------------------- */

/**----------------------------  init and dispose  -------------------------------------------- */

  @override
  void initState() {
    super.initState();

    initRecorder();
    _initialiseController();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    recorderController.dispose();

    super.dispose();
  }

  /**-----------------------    the end       ---------------------------------- */

  /// -------------------------  wave ui    --------------------------------- */

  void _initialiseController() {
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 16000;
  }

/*-------------------        the end         -------------------------------- */

  /// -----------------      start record family          ------------------------------------- */

/*------------------------      initial             -------------------- */
  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }

    final statusStorage = await Permission.storage.status;
    if (!statusStorage.isGranted) {
      await Permission.storage.request();
    }

    directoryPath = await _directoryPath();
    completePath = await _completePath(directoryPath);
    _createDirectory();
    _createFile();
    await recorder.openRecorder();
    isRecording = true;
    recorder.setSubscriptionDuration(
      const Duration(milliseconds: 500),
    );
  }

/*-----------------------------      end init             ---------------------------- */

/*-----------------------------   ***     record start ******       ---------------------- */

  Future record() async {
    if (!isRecording) return;
    await recorderController.record();

    print("Path where the file will be : " + completePath);
    await recorder.startRecorder(
      toFile: completePath,
      numChannels: 1,
      sampleRate: 44100,
    );
  }

/*----------------------       end record start              ------------------------- */

/*---------------------------   **********  stop record ***********             -------------------*/

  Future stop() async {
    if (!isRecording) return;
    final path = await recorder.stopRecorder();
    final path1 = await recorderController.stop();
    // final audioFile = File(path!);
    File f = File(completePath);
    print('Recorder audio: $f');
  }

/*-------------------------       end record stop              ---------------------------- */
// Future delete () async{
//   if( ! isRecording) return;
//   await recorder.deleteRecord(
//     fileName: completePath);
//     await recorderController.stop();

// }
  Future delete() async {
    if (!recorder.isRecording) return;

    await recorder.stopRecorder();
    await recorderController.stop();

    if (await File(completePath).exists()) {
      await File(completePath).delete();
      setState(() {
        isWaveformDisplaying = false;
        recordButtonIcon = CupertinoIcons.play_circle;
      });
    }
  }
/*-------------------------       end record family              ---------------------------- */

/*-------------------------       start file path family              ---------------------------- */

  String completePath = "";
  String directoryPath = "";

  Future<String> _completePath(String directory) async {
    var fileName = _fileName();
    return "$directory$fileName";
  }

  Future<String> _directoryPath() async {
    var directory = await getExternalStorageDirectory();
    var directoryPath = directory!.path;
    return "$directoryPath/records/";
  }

  String _fileName() {
    return "record.wav";
  }

  Future _createFile() async {
    File(completePath).create(recursive: true).then((File file) async {
      //write to file
      Uint8List bytes = await file.readAsBytes();
      file.writeAsBytes(bytes);
      print("FILE CREATED AT : " + file.path);
    });
  }

  void _createDirectory() async {
    bool isDirectoryCreated = await Directory(directoryPath).exists();
    if (!isDirectoryCreated) {
      Directory(directoryPath).create().then((Directory directory) {
        print("DIRECTORY CREATED AT : " + directory.path);
      });
    }
  }

/*-------------------------       end file path family              ---------------------------- */

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
            top: h > 700 ? 70 : 40, left: 25, right: 25, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // first text

            const Text(
              "Record the voice or \n Upload it",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: h > 700 ? 80 : 30,
            ),

            // icon mic

            Icon(
              // Icons.mic,
              CupertinoIcons.mic,
              size: h > 700 ? 300 : 160,
            ),
            SizedBox(
              height: h > 700 ? 60 : 0,
            ),

            //wave

            // if (isWaveformDisplaying) {

            // },
            Center(
              child: isWaveformDisplaying
                  ? AudioWaveforms(
                      enableGesture: false,
                      size: Size(MediaQuery.of(context).size.width, 70),
                      recorderController: recorderController,
                      waveStyle: WaveStyle(
                        waveColor: rBasicColor,
                        extendWaveform: true,
                        showMiddleLine: false,
                        showDurationLabel: true,
                        durationStyle:
                            TextStyle(color: rBasicColor, fontSize: 16),
                      ),
                      margin: const EdgeInsets.only(bottom: 50),
                    )
                  : Container(
                      height: 120,
                    ),
            ),

            // start row

            Container(
              padding: EdgeInsets.only(top: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //upload icon

                  IconButton(
                    iconSize: 35,
                    onPressed: () {
                      if (recorder.isRecording) {
                        delete();
                        t.cancel();
                      }
                    },
                    icon: Icon(Icons.delete),
                  ),
                  IconButton(
                      onPressed: () async {
                        if (recorder.isRecording) {
                          isWaveformDisplaying = false;
                          recordButtonIcon = CupertinoIcons.play_circle;
                          await stop();
                          t.cancel();
                        } else {
                          isWaveformDisplaying = true;
                          recordButtonIcon = CupertinoIcons.stop_circle;
                          await record();
                          t = Timer(Duration(seconds: 5), () {
                            stop();
                            isWaveformDisplaying = false;
                            setState(() {
                              recordButtonIcon = CupertinoIcons.play_circle;
                            });
                          });
                        }
                        setState(() {});
                      },
                      iconSize: h > 700 ? 70 : 70,
                      icon: Icon(
                        recordButtonIcon,
                        color: rBasicColor,
                      )),

                  // play button

                  IconButton(
                      onPressed: () {
                        myAlert();
                      },
                      iconSize: 35,
                      icon: Icon(
                        Icons.cloud_upload,
                      )),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 25,
                child: IconButton(
                    onPressed: () async {
                      final SharedPreferences? prefs = await _prefs;
                      print("press send");
                      _audiopicker_Controller.Postrecord();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                                content: Container(
                                  height: 200,
                                    child: Column(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children: [
                                      Text(
                                        "Wait For The Result",
                                        style:
                                          TextStyle(color: rBasicColor,),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 30,),
                                      Center(child: CircularProgressIndicator(
                                        color: rBasicColor,
                                        strokeWidth: 3,
                                      ))
                                    ])));
                          });
                    }
                    // const FileUploadIconButton(tag: 'controller1');
                    // },
                    ,
                    iconSize: 20,
                    icon: Icon(
                      Icons.send,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
