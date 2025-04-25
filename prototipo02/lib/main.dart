import 'package:flutter/material.dart';

void main() => runApp(CalculadoraIMCApp());

class CalculadoraIMCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial', // Define a fonte Arial como padrão para o aplicativo
      ),
      home: TelaIMC(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaIMC extends StatefulWidget {
  @override
  State<TelaIMC> createState() => _TelaIMCState();
}

class _TelaIMCState extends State<TelaIMC> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  String resultado = '';
  String? imagemResultado;

  void calcularIMC() {
    String pesoTexto = pesoController.text.replaceAll(',', '.');
    String alturaTexto = alturaController.text.replaceAll(',', '.');

    final double? peso = double.tryParse(pesoTexto);
    final double? altura = double.tryParse(alturaTexto);

    if (peso != null && altura != null && altura > 0) {
      final double imc = peso / (altura * altura);
      String classificacao;
      String? imagem;

      if (imc < 18.5) {
        classificacao = 'Abaixo do peso! Risco a saúde!';imagem = 'assets/images/abaixo_peso.png';imagem = 'assets/images/reprovado.png';
      } else if (imc < 24.9) {
        classificacao = 'Peso ideal, está saúdavel!';
        imagem = 'assets/images/aprovado.png';
      } else if (imc < 29.9) {
        classificacao = 'Acima do peso! Tomar cuidado com a saúde';
        imagem = 'assets/images/alerta.png';
      } else  {
        classificacao = 'Obesidade! Risco à saúde';
        imagem = 'assets/images/reprovado.png';
      }

      setState(() {
        resultado = 'Resultado: ${imc.toStringAsFixed(2)}\n$classificacao';
        imagemResultado = imagem;
      });
    } else {
      setState(() {
        resultado = 'Por favor, insira peso e altura válidos.';
        imagemResultado = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Calculadora de IMC',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Icon(
              Icons.accessibility_new,
              size: 24,
              color: Colors.white,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Ícone alterado aqui
            Icon(
              Icons.accessibility_new,
              size: 40,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                labelText: 'Altura (m)',
                labelStyle: TextStyle(color: Colors.black), // Cor do label
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
                labelStyle: TextStyle(color: Colors.black), // Cor do label
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularIMC,
              child: Text(
                'Calcular IMC',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Text(
              resultado,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            if (imagemResultado != null)
              Image.asset(
                imagemResultado!,
                height: 100,
              ),
          ],
        ),
      ),
    );
  }
}