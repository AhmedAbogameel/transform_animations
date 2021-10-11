import 'package:awesome_snack_bar/constants.dart';
import 'package:flutter/material.dart';

class RecordingButtonView extends StatefulWidget {
  const RecordingButtonView({Key? key}) : super(key: key);

  @override
  State<RecordingButtonView> createState() => _RecordingButtonViewState();
}

class _RecordingButtonViewState extends State<RecordingButtonView> {

  // final initialOffset = Offset(sizeFromWidth(1.1), sizeFromHeight(0.95));
  Offset offset = Offset(sizeFromWidth(1.1), sizeFromHeight(0.96));
  bool isLocked = false;
  bool isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if(isDragging || isLocked)
            AnimatedPositioned(
              duration: Duration(milliseconds: 250),
              top: sizeFromHeight(1.1),
              left: offset.dx - 15,
              child: CircleAvatar(child: Icon(Icons.lock)),
            ),
          if(!isLocked)
            AnimatedPositioned(
              curve: Curves.bounceIn,
              duration: Duration(milliseconds: 250),
              top: offset.dy,
              left: offset.dx,
              child: GestureDetector(
                onPanUpdate: (details) {
                  isDragging = true;
                  if(isLocked) return;
                  final delta = offset.dy + details.delta.dy;
                  if(delta > sizeFromHeight(1.1))
                    offset = Offset(offset.dx, delta);
                  else
                    isLocked = true;
                  setState(() {});
                },
                onPanEnd: (details) {
                  setState(() => isDragging = false);
                  if(isLocked) return;
                  setState(() => offset = Offset(sizeFromWidth(1.1) ,sizeFromHeight(0.96)));
                },
                child: Icon(Icons.record_voice_over),
              ),
            ),
        ],
      ),
    );
  }
}
