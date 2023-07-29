import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({super.key});
  static String country = '';
  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        elevation: 8,
        title: Text('University Info'),
        centerTitle: true,
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black,
            width: 1,
            strokeAlign: 6,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
              color: Colors.grey.shade200,
            ),
            child: TextField(
              onChanged: (value) {
                Input.country = value;
              },
              cursorColor: Colors.black,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'Country Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'info_view');
            },
            child: Text(
                'Submit',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
              ),
              elevation: 7,
              padding: EdgeInsets.symmetric(vertical:17, horizontal: 25)
            )
          )
        ],
      ),
    );
  }
}
