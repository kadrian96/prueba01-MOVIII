import 'package:flutter/material.dart';
import 'package:prueba_1/main.dart';

void main() {
  runApp(const Ejercicio02());
}

class Ejercicio02 extends StatelessWidget {
  const Ejercicio02({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Ejercicio02",
      home: Home(),
      debugShowCheckedModeBanner: false,

    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Ejercicio 2",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.amber[900]),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context){
  return (Container(
    width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
           image:AssetImage('assets/image/fondo4.jpg'),
           fit: BoxFit.cover
        )
      ),
      child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
            const Text("Calcular distancia recorrida", style: TextStyle(fontSize: 25, color: Colors.brown,)),
            const SizedBox(height: 20),
            Velocidad(),
            const SizedBox(height: 20),
            Boton(context),
            const SizedBox(height: 20),
            Boton02(context)
      ],),
      

  ));
}
final TextEditingController _velocidad = TextEditingController();
final TextEditingController _peso = TextEditingController();


Widget Velocidad(){
  return(
    Container(
     padding: const EdgeInsets.all(10),
        child: TextField(
          controller: _velocidad,
          decoration:  InputDecoration(
            labelText: 'Velocidad en m/s',
                  labelStyle: TextStyle(color: const Color.fromARGB(255, 26, 25, 25)),
                  filled: true,
                  fillColor: Color.fromARGB(255, 118, 217, 247),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                 
          ),
          keyboardType: TextInputType.number,
        ),
    )
  );
}



// ignore: non_constant_identifier_names
Widget Boton(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: ElevatedButton(
      onPressed: () {
        alerta(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 199, 54, 11),
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        textStyle: const TextStyle(fontSize: 16),
      ),
      child: const Text("Calcular", style: TextStyle(color: Colors.white),),
    ),
  );
}

double calcular() {
  double vel = double.tryParse(_velocidad.text) ?? 0.00;
  double dist = vel*100;
  return dist;
}

void alerta(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Info"),
        content: Text("La distancia que recorre el objeto en 10s es: ${calcular()} [m]"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}

Widget Boton02(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PruebaApp()));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 158, 151, 149),
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        textStyle: const TextStyle(fontSize: 16),
      ),
      child: const Text("Regresar", style: TextStyle(color: Colors.white),),
    ),
  );
}
