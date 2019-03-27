import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Fam Jam',
      theme: ThemeData(
        fontFamily: 'SpaceGrotesk',
        brightness: Brightness.dark,
      ),
      home: MyApp(),
    ),
  );
}

_myAppBar(String text) {
  return AppBar(
    centerTitle: true,
    title: Text(
      text,
      style: TextStyle(
        fontFamily: 'Lovelo',
        fontSize: 30.0,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final List _images = [
    'images/1.png',
    'images/2.png',
    'images/3.png',
    'images/4.png'
  ];

  final List _groups = [
    'Mom & Dad',
    'Uncle & Aunt',
    'My Fam',
    'Grandparents',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar('Fam Jam'),
      body: CustomScrollView(
        slivers: <Widget>[
          _grid(context),
        ],
      ),
    );
  }

  _card(int index) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Ink(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              _images[index],
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 350,
            color: Colors.grey.shade700,
            child: Text(_groups[index]),
          ),
        ),
      ),
    );
  }

  _grid(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Opinions(),
                ),
              );
            },
            child: _card(index),
          );
        },
        childCount: 4,
      ),
    );
  }
}

class Opinion {
  const Opinion(this.name);
  final String name;
}

class Opinions extends StatefulWidget {
  @override
  State createState() => OpinionState();
}

class OpinionState extends State<Opinions> {
  List<Opinion> _opinions = <Opinion>[
    Opinion('Chocolate'),
    Opinion('Strawberry'),
    Opinion('Mango'),
  ];
  List<String> _filters = <String>[];
  final TextEditingController _textController = TextEditingController();

  Iterable<Widget> get opinionWidgets sync* {
    for (Opinion opinion in _opinions) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onLongPress: () {
            setState(() {
              _opinions.remove(opinion);
            });
          },
          child: FilterChip(
            label: Text(opinion.name),
            selected: _filters.contains(opinion.name),
            onSelected: (bool value) {
              setState(() {
                value
                    ? _filters.add(opinion.name)
                    : _filters.remove(opinion.name);
              });
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar('OPINIONS'),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView(
              children: [_main()],
            ),
          ),
          Divider(
            height: 1.0,
          ),
          _add()
        ],
      ),
    );
  }

  _main() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            top: 8.0,
          ),
          child: Text(
            'Which flavour of ice-cream do you want?',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Image.asset(
          'images/5.jpg',
        ),
        Wrap(
          children: opinionWidgets.toList(),
        ),
      ],
    );
  }

  _handleSubmitted(String text) {
    setState(() {
      if (text.trim().length > 0) {
        _opinions.add(Opinion(text));
        _filters.add(text);
      }
    });
    _textController.clear();
  }

  _add() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () {},
        ),
        Flexible(
          child: TextField(
            controller: _textController,
            onSubmitted: _handleSubmitted,
            decoration: new InputDecoration.collapsed(
              hintText: "Add your opinion",
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () => _handleSubmitted(_textController.text),
        ),
      ],
    );
  }
}
