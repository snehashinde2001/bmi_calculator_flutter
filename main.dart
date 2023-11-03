import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result  = "";

  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("BMI Calculator"),
      ),
      body: Container(
        color: Colors.yellowAccent,

        child: Center(
          child: Container(
            //color: Colors.amber,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI ", style: TextStyle(
                  fontSize: 35, fontWeight: FontWeight.w600,
                ),),
                SizedBox(height: 21,),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text("Enter your weight(kg)"),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text("Enter your height(Feet)"),
                    prefixIcon: Icon(Icons.height),

                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text("Enter your height(inch)"),
                    prefixIcon: Icon(Icons.height),

                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height:16,),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!="" && ft!="" && inch!=""){
                    //BMI Calculation

                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch= (iFt * 12)+iInch;

                    var tCm = tInch * 2.54;

                    var tM = tCm/100;

                    var bmi  = iWt/(tM*tM);
                    setState(() {
                      result = "Your BMI is ${bmi.toStringAsFixed(4)}";
                    });


                    }
                  else{
                    setState(() {
                      result = "Please fill all the required blanks";
                    });

                  }
                },
                    child: Text("calculate")),
                SizedBox(height: 11,),

                Text(result, style: TextStyle(
                  fontSize: 19, fontWeight: FontWeight.normal,
                ),)


              ],
            ),
          ),
        ),
      )
      , // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
