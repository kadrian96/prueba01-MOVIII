import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const Ejercicio01());
}

class Ejercicio01 extends StatelessWidget {
  const Ejercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Ejercicio01",
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
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context){
  return (Container(
    width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
           image:AssetImage('assets/image/fondo5.jpg'),
           fit: BoxFit.cover
        )
      ),
      child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
            const Text("Nivel de masa corporal", style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 65, 173, 223),)),
            const SizedBox(height: 20),
            Altura(),
            const SizedBox(height: 20),
            Peso(),
            const SizedBox(height: 20),
            Boton(context)
      ],),
      

  ));
}

final TextEditingController _altura = TextEditingController();
final TextEditingController _peso = TextEditingController();


Widget Altura(){
  return(
    Container(
     padding: const EdgeInsets.all(10),
        child: TextField(
          controller: _altura,
          decoration:  InputDecoration(
            labelText: 'Altura en m',
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

Widget Peso(){
  return(
    Container(
      padding: const EdgeInsets.all(10),
        child: TextField(
          controller: _peso,
          decoration:  InputDecoration(
            labelText: 'Peso en kg',
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

String calcular() {
  double alt = double.tryParse(_altura.text) ?? 0.00;
  double pes = double.tryParse(_peso.text) ?? 0.00;
  double imc=pes/(alt*alt);
  String texto;
  if(imc<18.5){
    texto='Bajo peso';
  }else if(imc>=18.5 && imc<=24.9){
    texto='Peso normal';
  }else if(imc>=25.0 && imc<=29.9){
    texto='Sobrepeso';
  }else{
    texto='Obecidad';
  }

  return texto;
}

void alerta(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Info"),
        content: Text("Su peso se encuentra en el rango de: ${calcular()}"),
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