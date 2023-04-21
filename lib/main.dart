import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyTextField(),
  ));
}

class MyTextField extends StatefulWidget {
 const MyTextField({super.key});
 @override
  // ignore: library_private_types_in_public_api
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField>{
 String inputValue = "";

 final TextEditingController controller = TextEditingController();

 @override
 Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: const Text("EditText Widget"),
      backgroundColor: Colors.red,
    ),
    body: Container(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(10.0)),
            TextField(
              decoration: const InputDecoration(hintText: "Ingrese el texto aquí"),
              maxLength: 30,
              onChanged: (value) {
                setState(() {
                  inputValue = value;
                });
              },
            ),
            const Padding(padding: EdgeInsets.all(10.0)),
            ElevatedButton(
              onPressed:() {
              _showAlert(inputValue);
              }, 
              child: const Text("Alert")
            ),
          ],
        ),
      ),
    )
  );
 }

 Future<void> _showAlert(String value) async {
  // ignore: avoid_print
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder:(BuildContext context) {
      return AlertDialog(
        title: const Text("New Alert"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text("$value ?")
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed:() {
              // ignore: avoid_print
              print("Yes!!! $value");
              Navigator.of(context).pop();
            }, 
            child: const Text("Yes")
          ),
          TextButton(
            onPressed:() {
              Navigator.of(context).pop();
            }, 
            child: const Text("No")
          ),
        ],
      );
    },
  );


 }
}