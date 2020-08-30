import 'package:avances/data/data.dart';
import 'package:avances/models/advance_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'AdvancesScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          body: Stack(
        children: [
          HeaderCurvo(),
          Column(
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
              ),
              CircleAvatar(
                radius: 45.0,
                backgroundColor: Colors.grey[300],
                backgroundImage: CachedNetworkImageProvider(
                    'https://i.ibb.co/ZH7356D/cody.jpg'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '¡Próximamente!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Container(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: advances
                  .map((e) => Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 310,
                                  ),
                                  FloatingActionButton(
                                    heroTag: e
                                        .name, //hero tag unico se puede crear atributo id e igualar a esta variable
                                    child: CircleAvatar(
                                      radius: 50.0,
                                      backgroundImage:
                                          CachedNetworkImageProvider(e.image),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdvanceScreen(
                                                    advances: advances,
                                                    currentAdvance: e.posicion -
                                                        1, //se envia la posicion del boton presionado para mostrar su info
                                                  )));
                                    },
                                  ),
                                  Text(e.name),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                        ],
                      ))
                  .toList(),
            ),
          ),
        ],
      )),
    );
  }
}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Colors.black,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Color(0xff1bbc9b);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    path.lineTo(0, size.height * 0.35);
    //path.lineTo(size.width, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.50, size.height * 0.50, size.width, size.height * 0.35);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
