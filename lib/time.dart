import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class Time extends StatefulWidget {

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  bool _isTic=false;
  int sec = 0;
  int min = 0;
  int hours=0;
  late Timer _timer;

  void initState(){
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  notif(){
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 10,
            channelKey: 'basic_channel',
            title: 'TIMER DONE',
            body: 'TIMER DONE',
            actionType: ActionType.Default

        ),
    );
  }

  void _startCoundown(){
      setState(() {
        _isTic=true;
      });
      _timer=Timer.periodic(Duration(seconds: 1), (timer) {
        if(sec>0){
          setState(() {
            sec--;
          });
        }
        else{
          if(min>0){
            setState(() {
              min--;
              sec=59;
            });
          }
          else{
            if(hours>0){
              setState(() {
                hours--;
                min=59;
              });
            }
            else{
              _isTic=false;
              _timer.cancel();
              notif();
            }
          }
        }
      });
  }

  void _secup(){
    if(sec<60){
      setState(() {
        sec++;
      });
    }
    else{
      sec=0;
    }
  }

  void _secdown(){
    if(sec>0){
      setState(() {
        sec--;
      });
    }
  }

  void _minitup(){
    if(min<60){
      setState(() {
        min++;
      });
    }
    else{
      min=0;
    }
  }

  void _minitdown(){
    if(min>0){
      setState(() {
        min--;
      });
    }
  }

  void _hoursup(){
    if(hours<12){
      setState(() {
        hours++;
      });
    }
    else{
      hours=0;
    }
  }

  void _hoursdown(){
    if(hours>0){
      setState(() {
        hours--;
      });
    }
  }

  void _stopCoundown(){
    _timer.cancel();
    setState(() {
      _isTic=false;
    });
  }

  void _restartCoundown(){
    setState(() {
      min=0;
      sec=0;
      hours=0;
      _isTic=false;
    });
    _timer.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: _hoursup,
                            child: Icon(Icons.arrow_drop_up_sharp,size: 50,),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              color: Colors.blue,
                              child:
                              Text(
                                hours<10 ? "0"+hours.toString():hours.toString(),
                                style: TextStyle(fontSize:70),
                              ),
                            ),
                          ),
                          MaterialButton(
                            onPressed: _hoursdown,
                            child: Icon(Icons.arrow_drop_down_sharp,size: 50,),
                          )
                        ],
                      ),


                Text(":", style: TextStyle(fontSize:70)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: _minitup,
                      child: Icon(Icons.arrow_drop_up_sharp,size: 50,),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.blue,
                        child:
                        Text(
                          min<10 ? "0"+min.toString():min.toString(),
                          style: TextStyle(fontSize:70),
                        ),
                        ),
                      ),
                    MaterialButton(
                      onPressed: _minitdown,
                      child: Icon(Icons.arrow_drop_down_sharp,size: 50,),
                    )
                  ],
                ),

                Text(":", style: TextStyle(fontSize:70)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: _secup,
                      child: Icon(Icons.arrow_drop_up_sharp,size: 50,),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.blue,
                        child:
                        Text(
                          sec<10 ? "0"+sec.toString():sec.toString(),
                          style: TextStyle(fontSize: 70),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: _secdown,
                      child: Icon(Icons.arrow_drop_down_sharp,size: 50,),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child:MaterialButton(
                    onPressed: _startCoundown,
                    child: Text("START",style: TextStyle(fontSize: 20)),
                    color: Colors.green,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child:MaterialButton(
                    onPressed: _stopCoundown,
                    child: Text("PAUSE",style: TextStyle(fontSize: 20)),
                    color: Colors.red,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: MaterialButton(
                    onPressed: _restartCoundown,
                    child: Text("RESTART",style: TextStyle(fontSize: 20)),
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

