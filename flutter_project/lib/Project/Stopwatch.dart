import 'dart:async';

import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {


  // now lets create the logic of time required of visited app
  int seconds = 0,  minutes = 0, hours = 0;
  String digiSeconds = "00", digiMinutes = "00", digiHours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  // creating the stop timer function
  void stop(){
    timer!.cancel();
    setState(() {
      started = false;

    });
  }

  void reset(){
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digiSeconds = "00";
      digiMinutes = "00";
      digiHours = "00";

      started = false;
    });
  }

  void addLaps(){
    String lap = "$digiHours:$digiMinutes:$digiSeconds";
    setState(() {
      laps.add(lap);
      
    });
  }
  
  // creating the start timer function
  
  void start(){
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if(localSeconds > 59){
        if(localMinutes > 59){
          localHours++;

          localMinutes = 0;

        }
        else{
          localMinutes++;
          localSeconds = 0;

        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digiSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digiHours = (hours >= 10) ? "$hours" : "0$hours";
        digiSeconds = (minutes >= 10) ? "$minutes" : "0$minutes";


      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "StopWatch App",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(child: Text(
               // "00:00:00",
                "$digiHours:$digiMinutes:$digiSeconds",
                style: TextStyle(color: Colors.deepPurple,
                fontSize:82.0,
                fontWeight: FontWeight.w600,

              ),
              ),),
              Container(
                height: 400.0,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                // now lets add a list builder

                child: ListView.builder(
                    itemCount: laps.length,
                    itemBuilder: (context, index){
                      return Padding(
                          padding: EdgeInsects.all(16.0),
                      child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                      "Lap n${index+ 1}",
                      style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,

                      ),
                      ),
                      Text(
                      "${laps[index]}",
                      style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                      ),
                      ),
                      ],
                      ),
                      );
                    }
              )),
              SizedBox(
                height: 20.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: (){
                        (!started) ?start() : stop();
                      },
                      shape: const StadiumBorder(
                        side: BorderSide(color: Colors.redAccent),
                      ),
                      child: Text(
                        (!started) ? "Start" : "Pause",
                        // "Start",
                        style: TextStyle(color: Colors.redAccent),

                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  IconButton(
                    color: Colors.yellow ,
                    onPressed: (){
                      addLaps();
                    //reset();
                    },
                    icon: Icon(Icons.flag),
                  ),
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: (){
                        reset();
                        addLaps();
                      },
                      fillColor: Colors.pink,
                      shape: const StadiumBorder(
                        // side: BorderSide(color: Colors.redAccent),
                      ),
                      child: Text(
                        "Reset",
                        //"Reset",
                        style: TextStyle(color: Colors.redAccent),

                      ),
                    ),
                  ),
                ],
              )

            ],
  
          ),
        ),
      ),

    );
  }
}

class EdgeInsects {
  static all(double d) {}
}
