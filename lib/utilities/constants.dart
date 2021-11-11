import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Fantasy',
  fontSize: 100.0,
  color: Color(0xFF121211),
  shadows: <Shadow>[
    Shadow(
      offset: Offset(2.5, 2.5),
      blurRadius: 5.0,
      color: Color.fromARGB(255, 119,136,153),
    ),
  ],
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Monospace',
  fontSize: 60.0,
  color: Color(0xFF121211),
  shadows: <Shadow>[
    Shadow(
      offset: Offset(2.5, 2.5),
      blurRadius: 5.0,
      color: Color.fromARGB(255, 119,136,153),
    ),
  ],
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
  color:Color(0xFF121211),
  shadows: <Shadow>[
    Shadow(
      offset: Offset(2.5, 2.5),
      blurRadius: 5.0,
      color: Color.fromARGB(255, 119,136,153),
    ),
  ],
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white54,
  icon: Icon(
    Icons.location_city,
    color: Colors.white54,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.black87,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(14.0),
    ),
    borderSide: BorderSide.none,
  ),
);
