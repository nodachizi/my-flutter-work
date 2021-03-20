import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                child: Column(
      children: [
        Image.asset(
          'assets/lake.jpg',
          width: 500,
          height: 340,
          fit: BoxFit.cover,
        ),
        Container(
          height: 20,
        ),
        TitleSection(),
        Container(
          height: 32,
        ),
        Button(),
        Container(
          height: 22,
        ),
        Dexts(),
      ],
    ))));
  }
}

class TitleSection extends StatefulWidget {
  const TitleSection({Key key}) : super(key: key);

  @override
  _TitleSectionState createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  @override
  bool _isFavorited = true;
  int _count = 41;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _count -= 1;
        _isFavorited = false;
      } else {
        _count += 1;
        _isFavorited = true;
      }
    });
  }

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(0),
            child: IconButton(
              padding: EdgeInsets.all(0),
              alignment: Alignment.centerLeft,
              icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
              color: Colors.blue[300],
              onPressed: _toggleFavorite,
            ),
          ),
          SizedBox(
            width: 18,
            child: Container(
              child: Text('$_count'),
            ),
          )
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Colors.blue[400], Icons.call, 'CALL'),
        _buildButtonColumn(Colors.blue[400], Icons.near_me, 'ROUTE'),
        _buildButtonColumn(Colors.blue[400], Icons.share, 'SHARE'),
      ],
    );
  }
}

class Dexts extends StatelessWidget {
  const Dexts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}
