import 'package:flutter/material.dart';

void main() => runApp(CalculadoraIMCApp());

class CalculadoraIMCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

  void calcularIMC() {
    String pesoTexto = pesoController.text.replaceAll(',', '.');
    String alturaTexto = alturaController.text.replaceAll(',', '.');

    final double? peso = double.tryParse(pesoTexto);
    final double? altura = double.tryParse(alturaTexto);

    if (peso != null && altura != null && altura > 0) {
      final double imc = peso / (altura * altura);
      String classificacao;

      if (imc < 18.5) {
        classificacao = 'Abaixo do peso';
      } else if (imc < 24.9) {
        classificacao = 'Peso normal';
      } else if (imc < 29.9) {
        classificacao = 'Sobrepeso';
      } else {
        classificacao = 'Obesidade';
      }

      setState(() {
        resultado = 'Resultado: ${imc.toStringAsFixed(2)}\n$classificacao';
      });
    } else {
      setState(() {
        resultado = 'Por favor, insira peso e altura válidos.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Ícone solicitado
            Icon(Icons.monitor_weight, size: 40, color: Colors.blue),

            SizedBox(height: 20),

            // Campo para altura
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura (m)',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),

            // Campo para peso
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            // Botão para calcular
            ElevatedButton(
              onPressed: calcularIMC,
              child: Text('Calcular IMC'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),

            SizedBox(height: 20),

            // Exibição do resultado
            Text(
              resultado,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
