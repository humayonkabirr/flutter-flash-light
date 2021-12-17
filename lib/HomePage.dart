import 'package:flutter/material.dart';
import 'package:flutter_flashlight/flutter_flashlight.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _hasFlashlight = false;
  var isON = false;

  checkLight() async {
    bool hasFlash = await Flashlight.hasFlashlight;
    setState(() {
      _hasFlashlight = hasFlash;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLight();
  }

  bool onOff = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              onOff == true ? 'assets/m.jpg' : 'assets/mm.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: _hasFlashlight
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        child: Image.asset(
                          onOff == true ? 'assets/off.png' : 'assets/on.png',
                          width: 185,
                          height: 185,
                        ),
                        onTap: () {
                          setState(() {
                            onOff = !onOff;
                            onOff
                                ? Flashlight.lightOff()
                                : Flashlight.lightOn();
                          });
                        }),
                  ],
                ),
              )
            : Text(
                "You Don't have Flash in your Camera..",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
