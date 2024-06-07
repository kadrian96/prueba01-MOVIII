import 'package:flutter/material.dart';
import 'package:prueba_1/screens/Ejercicio01.dart';
import 'package:prueba_1/screens/Ejercicio02.dart';

void main() {
  runApp(const PruebaApp());
}

class PruebaApp extends StatelessWidget {
  const PruebaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Prueba 01",
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
  int indice = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [Cuerpo(context), const Ejercicio01()];
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "PruebaApp",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.amber[900],
        ),
        body: screens[indice],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: indice,
            onTap: (valor) {
              setState(() {
                indice = valor;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.edit_document), label: "Ejercicio 1"),
            ]));
  }
}

Widget Cuerpo(context) {
  return (Container(
    width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.pexels.com/photos/3255761/pexels-photo-3255761.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
              fit: BoxFit.cover)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Text(
              'Nombre: Kevin Martinez',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            Text(
              'User Github: kadrian96',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.blue[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Boton(context),
          ])));
}

Widget Boton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      alerta01(context);
    },
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
      backgroundColor: Colors.white,
      foregroundColor: Colors.deepPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
    child: const Text("Navegar", style: TextStyle(fontSize: 20)),
  );
}

void alerta01(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Mensaje"),
        content: const Text("¿Quiere ir al Ejercicio 02?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Ejercicio02()),
              );
            },
            child: const Text("OK"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("CANCELAR"),
          ),
        ],
      );
    },
  );
}
