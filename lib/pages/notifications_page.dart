import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:gdg_lawrence/controls/spinning_control.dart';
import 'package:gdg_lawrence/models/podcast_model.dart';
import 'package:gdg_lawrence/shared/factory.dart';
import 'package:gdg_lawrence/shared/repository.dart';
import 'package:gdg_lawrence/shared/utils.dart';
import 'package:audioplayer/audioplayer.dart';

class NotificationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotificationsPageState();
  }
}
class NotificationsPageState extends State<NotificationsPage> {

  List<PodcastModel> podcasts;
  List<Widget> podcastsWidgets;
  PodcastModel selectedPodcast;
  String podcastDuration = '--:--';
  String countdownDuration = '--:--';
  String podcastName = "----";
  String podcastPath = '';


  AudioPlayer audioPlayer = new AudioPlayer();
  bool isPlaying = false;
  Duration position = new Duration(
    days: 0,
    hours: 0,
    minutes: 0,
    seconds: 0,
    microseconds: 0,
    milliseconds: 0
  );
  double sliderPosition = 0.0;
  double maxSliderValue = 21;

  StreamSubscription listen;
  StreamSubscription pState;

  NotificationsPageState() {

    listen = audioPlayer.onAudioPositionChanged.listen(onAudioPositionChanged);
    //pState = audioPlayer.onPlayerStateChanged.listen(onAudioPlayerStateChanged);

    Repository.getAllPodcasts().then((e) {
      setState(() {
          podcasts = e;
          podcastsWidgets = List<Widget>();
          
          for(var i = 0; i < podcasts.length; i++) {
            podcastsWidgets.add(Factory.getPodcastRowWidget(podcasts[i], onSelectedPodcast));
          }
      });
    });
  }

  void onAudioPositionChanged(Duration duration) {
      setState(() {
          position = duration;
          sliderPosition = position.inSeconds.toDouble();

          podcastDuration = DateFormat.Hms().format(DateTime(0,0,0,0,0,duration.inSeconds,0,0));
          countdownDuration = DateFormat.Hms().format(DateTime(0,0,0,0,0,selectedPodcast.durationInSeconds - duration.inSeconds,0,0));
      });
  }

  void onAudioPlayerStateChanged(AudioPlayerState state) {
      setState(() {
          if (state == AudioPlayerState.COMPLETED) {
            sliderPosition = 0.0;
            isPlaying = false;

            podcastDuration = DateFormat.Hms().format(DateTime(0,0,0,0,0,0,0,0));
            countdownDuration = DateFormat.Hms().format(DateTime(0,0,0,0,0,selectedPodcast.durationInSeconds,0,0));
          }
      });
  }

  Future<void> onSelectedPodcast(PodcastModel p) async {
    await audioPlayer.stop();
    listen.cancel();
    audioPlayer = AudioPlayer();
    listen = audioPlayer.onAudioPositionChanged.listen(onAudioPositionChanged);
    
    setState(() {
      
      isPlaying = false;
      sliderPosition = 0.0;

      var timeAsDateTime = DateTime(0,0,0,0,0,p.durationInSeconds,0,0);
      var timeFormat = DateFormat.Hms().format(timeAsDateTime);

      selectedPodcast = p;
      podcastDuration = DateFormat.Hms().format(DateTime(0,0,0,0,0,0,0,0));
      countdownDuration = timeFormat;  
      podcastName = selectedPodcast.name;
      podcastPath = selectedPodcast.path;
      maxSliderValue = p.durationInSeconds.toDouble();
    });
  }

  Future<void> playPodcast() async {
    isPlaying = !isPlaying;

    if (isPlaying) {
      await audioPlayer.pause();
      await audioPlayer.play(podcastPath);
      await audioPlayer.pause();
      await audioPlayer.play(podcastPath);
    }
    else {
      await audioPlayer.pause();
    }
  }

  @override
  Future<void> deactivate() async {
    await audioPlayer.stop();
    listen.cancel();
    //pState.cancel();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Utils.googleYellow,
        title: Text("Mini Podcasts",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
      ),
      body: Container(
        color: Utils.googleYellow,
        child: Column(
          children: <Widget>[
            Expanded(
              child: podcasts != null ? ListView(
            children: podcastsWidgets,
              ) : Center(
                child: SpinningControl(
                  color1: Colors.black,
                  color2: Colors.black,
                  color3: Colors.black,
                  color4: Colors.black
                ),
              )
            ),
            Container(
              color: Colors.black,
              padding: EdgeInsets.all(30),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: Icon(
                      isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled, 
                      color: Colors.white, size: 50),
                    onTap: () {
                        setState(() {
                          playPodcast();                        
                        });
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(podcastName,
                            style: TextStyle(color: Colors.white)
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 50,
                                child: Text(countdownDuration,
                                  style: TextStyle(color: Colors.white, fontSize: 10)
                                ),
                              ),
                              Expanded(
                                child: Slider(
                                  activeColor: Colors.white,
                                  inactiveColor: Colors.white.withOpacity(0.2),
                                  onChanged: (val) {
                                    /*setState(() {
                                        sliderPosition = val;                                  
                                    });*/
                                  },
                                  onChangeStart: (val) {
                                    //audioPlayer.pause();
                                  },
                                  onChangeEnd: (val) {
                                    /*isPlaying = true;
                                    audioPlayer.seek(val);
                                    audioPlayer.play(selectedPodcast.path);
                                    */
                                  },
                                  min: 0,
                                  max: maxSliderValue,
                                  value: sliderPosition
                                )
                              ),
                              Container(
                                width: 50,
                                child: Text(podcastDuration,
                                  style: TextStyle(color: Colors.white, fontSize: 10)
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    )
                  )],
              ),
            )
          ],
        ),
      )
    );
  }
}