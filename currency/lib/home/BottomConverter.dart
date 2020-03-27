import 'package:flutter/material.dart';

class BottomConverter extends StatefulWidget {
  final List<String> currencies;
  final int active;
  final Function change, activate;
  final bool changing;
  final String from, to;

  BottomConverter({
    this.currencies,
    this.active,
    this.change,
    this.changing,
    this.activate,
    this.from,
    this.to,
  });

  @override
  _BottomConverterState createState() => _BottomConverterState();
}

class _BottomConverterState extends State<BottomConverter> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      height: data.size.height * 0.25,
      width: data.size.width * 0.8,
      decoration: BoxDecoration(
        color: Color(0xFF270F50),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(data.size.width * 0.05),
          bottomRight: Radius.circular(data.size.width * 0.05),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: getRow(data),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '1832.16',
                style: TextStyle(
                  color: Color(0xFFCF9ABF),
                  fontSize: data.size.width * 0.12,
                ),
              ),
              Text(
                '1 ${widget.from} = 1.41 ${widget.to}',
                style: TextStyle(
                  color: Color(0xBBCF9ABF),
                  fontSize: data.size.width * 0.05,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> getRow(data) {
    if (widget.changing) {
      return [
        Container(
          height: data.size.width * 0.1,
          width: data.size.width * 0.75,
          margin: EdgeInsets.all(data.size.width * 0.025),
          decoration: BoxDecoration(
            color: Color(0xFF210F3F),
            borderRadius: BorderRadius.circular(
              data.size.width * 0.03,
            ),
          ),
          child: Center(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(widget.currencies.length, (i) {
                return GestureDetector(
                  onTap: () {
                    widget.change(2, i);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: data.size.width * 0.1,
                    ),
                    child: Center(
                      child: Text(
                        widget.currencies[i],
                        style: TextStyle(
                          color: (i == widget.active
                              ? Color(0xFFF4F0F5)
                              : Color(0x88F4F0F5)),
                          fontSize: data.size.width * 0.05,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ];
    } else {
      return [
        GestureDetector(
          onTap: () {
            widget.activate();
          },
          child: Container(
            height: data.size.width * 0.1,
            width: data.size.width * 0.2,
            margin: EdgeInsets.all(data.size.width * 0.025),
            decoration: BoxDecoration(
              color: Color(0xFF210F3F),
              borderRadius: BorderRadius.circular(
                data.size.width * 0.03,
              ),
            ),
            child: Center(
              child: Text(
                widget.currencies[widget.active],
                style: TextStyle(
                  color: Color(0xFFF4F0F5),
                  fontSize: data.size.width * 0.05,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      ];
    }
  }
}
