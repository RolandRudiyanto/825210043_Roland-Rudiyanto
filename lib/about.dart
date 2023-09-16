import 'package:flutter/material.dart';

class About extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0) ,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Image.asset('assets/FTI UNTAR.png',),
                  Padding(padding: const EdgeInsets.all(10)),
                  Image.asset('assets/Logo SI clear.png',width: 200,),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Roland Rudiyanto",style: TextStyle(fontSize: 20),),
                  Text("825210043",style: TextStyle(fontSize: 15),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
