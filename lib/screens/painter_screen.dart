import 'dart:developer';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:meditative_coloring/screens/interpertation.dart';
import 'package:meditative_coloring/screens/set_your_intension.dart';
import 'package:meditative_coloring/screens/signup_screen.dart';

class DrawItOut extends StatefulWidget {
  const DrawItOut({Key? key}) : super(key: key);

  @override
  State<DrawItOut> createState() => _DrawItOutState();
}

class _DrawItOutState extends State<DrawItOut> {
  List<Color> mainColors = const [
    ui.Color(0xffFF0000),
    ui.Color(0xffDD6E0F),
    ui.Color(0xffFFFF00),
    ui.Color(0xff10771A),
    ui.Color(0xff9ACD32),
    ui.Color(0xff0073CF),
    ui.Color(0xff562270),
    ui.Color(0xffFFFFFF),
    ui.Color(0xffFF00F5),
    ui.Color(0xff654321),
    ui.Color(0xff000000),
    ui.Color(0xff808080),
    ui.Color(0xffFFC727),
  ];
  Color selectedColor = const Color(0xff443a49);
  List<DrawingArea?> points = [];
  Color selectedPaperColor = const Color(0xffffffff);

  double strokeWidth = 5.0;

  bool recta = false;

  void changeColor(Color color) {
    setState(() => selectedColor = color);
  }

  void changePaperColor(Color color) {
    setState(() => selectedPaperColor = color);
  }

  void selectColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white.withOpacity(0.90),
        title: Text(
          'Select a color'.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
              letterSpacing: 1.0,
              fontFamily: 'Calder',
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 24),
        ),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: selectedColor,
            onColorChanged: changeColor,
            availableColors: mainColors,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Close".toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                letterSpacing: 1.0,
                fontFamily: 'Calder',
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          )
        ],
      ),
    );
  }

  void colorPicker(String title) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                letterSpacing: 1.0,
                fontFamily: 'Calder',
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xFFAAAAAA),
                  style: BorderStyle.solid,
                  width: 0.4,
                ),
                color: const Color(0xFFF5F5F5),
              ),
              child: Wrap(
                children: List.generate(
                  mainColors.length,
                  (index) {
                    return buildColorPicker(
                      color: mainColors[index],
                      changeColor: () {
                        Navigator.of(context).pop(mainColors[index]);
                      },
                      isCurrentColor: title.toLowerCase().contains("paper")
                          ? mainColors[index] == selectedPaperColor
                          : mainColors[index] == selectedColor,
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Close".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ).then((value) {
      if (value != null) {
        if (title.toLowerCase().contains("paper")) {
          changePaperColor(value);
        } else {
          changeColor(value);
        }
      }
    });
  }

  void selectPaperColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          'Select your paper color'.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
              letterSpacing: 1.0,
              fontFamily: 'Calder-DarkShadow',
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 24),
        ),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: selectedPaperColor,
            onColorChanged: changePaperColor,
            availableColors: const [
              Colors.white,
              Colors.red,
              Colors.pink,
              Colors.purple,
              Colors.deepPurple,
              Colors.indigo,
              Colors.blue,
              Colors.blueAccent,
              Colors.lightBlueAccent,
              Colors.green,
              Colors.greenAccent,
              Colors.lightGreen,
              Colors.lightGreenAccent,
              Colors.yellow,
              Colors.yellowAccent,
              Colors.amber,
              Colors.deepOrange,
              Colors.brown,
              Colors.grey,
              Colors.blueGrey,
              Colors.black,
              Colors.purpleAccent,
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Close".toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  letterSpacing: 1.0,
                  fontFamily: 'Calder-DarkShadow',
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 24),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top:16.0),
                child: TitleWidget(
                  
                  title: "Color it out",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xFFAAAAAA),
                  style: BorderStyle.solid,
                  width: 0.4,
                ),
                color: const Color(0xFFF5F5F5),
              ),
              child: Wrap(
                children: List.generate(
                  mainColors.length,
                  (index) {
                    return buildColorPicker(
                      color: mainColors[index],
                      changeColor: () {
                        changeColor(mainColors[index]);
                      },
                      isCurrentColor: mainColors[index] == selectedColor,
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xFFAAAAAA),
                            style: BorderStyle.solid,
                            width: 0.4,
                          ),
                          color: const Color(0xFFF5F5F5),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                selectColor();
                                setState(() {
                                  recta = false;
                                });
                              },
                              child: Image.asset(
                                "assets/images/pen.png",
                                width: 20,
                                height: 20,
                                color: Colors.black,
                              ),
                            ),
                            const VerticalDivider(
                              thickness: 0.4,
                              width: 0.5,
                              color: Color(0xFFAAAAAA),
                            ),
                            InkWell(
                              onTap: () {
                                log(points.toString());
                                setState(() {
                                  points.clear();
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/images/eraser.png",
                                  width: 20,
                                  height: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Slider(
                        min: 1.0,
                        max: 5.0,
                        label: "Stroke $strokeWidth",
                        activeColor: Colors.black,
                        value: strokeWidth,
                        onChanged: (double value) {
                          setState(() {
                            strokeWidth = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        onPressed: () {
                          colorPicker("Select Paper Color");
                        },
                        child: const Text(
                          "Change\n Paper Color",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16.0),
                // width: width * 0.80,
                decoration: BoxDecoration(
                  color: selectedPaperColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(
                    color: const Color(0xFFAAAAAA),
                    style: BorderStyle.solid,
                    width: 2.0,
                  ),
                ),
                child: GestureDetector(
                  onPanEnd: (details) {
                    setState(() {
                      points.add(null);
                    });
                  },
                  onPanStart: (details) {
                    setState(() {
                      points.add(DrawingArea(
                          point: details.localPosition,
                          areaPaint: Paint()
                            ..strokeCap = StrokeCap.round
                            ..isAntiAlias = true
                            ..color = selectedColor
                            ..strokeWidth = strokeWidth));
                    });
                  },
                  onPanUpdate: (details) {
                    setState(() {
                      points.add(DrawingArea(
                          point: details.localPosition,
                          areaPaint: Paint()
                            ..strokeCap = StrokeCap.round
                            ..isAntiAlias = true
                            ..color = selectedColor
                            ..strokeWidth = strokeWidth));
                    });
                  },
                  child: SizedBox.expand(
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      child: CustomPaint(
                        painter: MyCustomPainter(points: points, rectug: recta),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 24, 16),
              child: PrimaryButton(
                title: "Interpret Drawing",
                onClick: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          contentPadding: const EdgeInsets.symmetric(vertical: 24.0,),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                          title: const Text(
                            "ARE YOU DONE COLORING? ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Calder",
                              fontSize: 24,
                            ),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Interpretation(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Yes",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    
                                  },
                                  child: const Text(
                                    "No",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      });
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const Interpretation(),
                  //   ),
                  // );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildColorPicker(
      {required Color color,
      required ui.VoidCallback changeColor,
      required bool isCurrentColor}) {
    return Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: changeColor,
          borderRadius: BorderRadius.circular(50),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 210),
            opacity: isCurrentColor ? 1 : 0,
            child: const Icon(
              Icons.done,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  MyCustomPainter({required this.points, required this.rectug});

  List<DrawingArea?> points;
  List<Offset> offsetPoints = [];
  bool rectug;

  /*@override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);
    canvas.clipRect(rect);

    for (int x = 0; x < points.length - 1; x++) {
      if (points[x] != null && points[x + 1] != null) {
        canvas.drawLine(points[x].point, points[x + 1].point, points[x].areaPaint);
      } else if (points[x] != null && points[x + 1] == null) {
        canvas.drawPoints(PointMode.points, [points[x].point], points[x].areaPaint);
      }
    }
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    return oldDelegate.points != points;
  }*/

  //This is where we can draw on canvas.
  @override
  void paint(Canvas canvas, Size size) {
    /* if(rectug)
      {
        final paint = Paint()
          ..color = Colors.blue
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke;

        final a = Offset(size.width * 1 / 6, size.height * 1 / 4);
        final b = Offset(size.width * 5 / 6, size.height * 3 / 4);
        final rect = Rect.fromPoints(a, b);

        canvas.drawRect(rect, paint);
      }
    else
      {
        for (int i = 0; i < points.length - 1; i++) {
          if (points[i] != null && points[i + 1] != null) {
            //Drawing line when two consecutive points are available
            canvas.drawLine(points[i].point, points[i + 1].point,
                points[i].areaPaint);
          } else if (points[i] != null && points[i + 1] == null) {
            offsetPoints.clear();
            offsetPoints.add(points[i].point);
            offsetPoints.add(Offset(
                points[i].point.dx + 0.1, points[i].point.dy + 0.1));

            //Draw points when two points are not next to each other
            canvas.drawPoints(ui.PointMode.points, offsetPoints, points[i].areaPaint);
          }
        }
      }*/

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        //Drawing line when two consecutive points are available
        canvas.drawLine(
            points[i]!.point, points[i + 1]!.point, points[i]!.areaPaint);
      } else if (points[i] != null && points[i + 1] == null) {
        offsetPoints.clear();
        offsetPoints.add(points[i]!.point);
        offsetPoints
            .add(Offset(points[i]!.point.dx + 0.1, points[i]!.point.dy + 0.1));
        //Draw points when two points are not next to each other
        canvas.drawPoints(
            ui.PointMode.points, offsetPoints, points[i]!.areaPaint);
      }
    }
  }

  //Called when CustomPainter is rebuilt.
  //Returning true because we want canvas to be rebuilt to reflect new changes.
  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) => true;
}

class DrawingArea {
  Offset point;
  Paint areaPaint;

  DrawingArea({required this.point, required this.areaPaint});
}
