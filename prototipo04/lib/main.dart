import 'package:flutter/material.dart';

void main() {
  runApp(CardapioApp());
}

class CardapioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ramen do ichiraku',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CardapioPage(),
    );
  }
}

class CardapioPage extends StatelessWidget {
  final List<Map<String, String>> pratos = [
    {
      'nome': 'Sushi Temaki',
      'descricao': 'Salmão, arroz e molho tarê',
      'imagem': 'assets/images/sushi.jpg',
      'preco': 'R\$ 24,90',
    },
    {
      'nome': 'Ramen Tradicional',
      'descricao': 'Macarrão oriental com caldo de porco',
      'imagem': 'assets/images/ramen.jpg',
      'preco': 'R\$ 32,50',
    },
    {
      'nome': 'Gohan',
      'descricao': 'Arroz, frango empanado e legumes',
      'imagem': 'assets/images/gohan.jpg',
      'preco': 'R\$ 27,00',
    },
    {
      'nome': 'Mochi',
      'descricao': 'Bolinho de arroz doce recheado com pasta de feijão vermelho',
      'imagem': 'assets/images/mochi.jpg',
      'preco': 'R\$ 18,00',
    },
    {
      'nome': 'Wagashi',
      'descricao': 'Doces tradicionais japoneses feitos com arroz e feijão',
      'imagem': 'assets/images/wagashi.jpg',
      'preco': 'R\$ 22,00',
    },
    {
      'nome': 'Dorayaki',
      'descricao': 'Panqueca recheada com pasta de feijão vermelho doce',
      'imagem': 'assets/images/dorayaki.jpg',
      'preco': 'R\$ 20,00',
    },
    {
      'nome': 'Dango',
      'descricao': 'Espetinho de bolinhos de arroz com molho doce',
      'imagem': 'assets/images/dango.jpg',
      'preco': 'R\$ 15,00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Row(
            children: [
              Image.asset(
                'assets/images/uzumaki.png',  // Caminho do ícone salvo
                width: 60, // Ajuste o tamanho do ícone se necessário
                height: 60,
              ),
              SizedBox(width: 10),
              Text('Ramen do Ichiraku'),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Filtros de categoria
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Wrap(
              spacing: 10,
              runSpacing: 10, // Garantindo que os chips tenham espaçamento vertical também
              children: [
                Chip(label: Text('Sushi')),
                Chip(label: Text('Ramen')),
                Chip(label: Text('Gohan')),
                Chip(label: Text('Mochi')),
                Chip(label: Text('Wagashi')),
                Chip(label: Text('Dorayaki')),
                Chip(label: Text('Dango')),
              ],
            ),
          ),
          
          // Lista de pratos
          Expanded(
            child: ListView.builder(
              itemCount: pratos.length,
              itemBuilder: (context, index) {
                final prato = pratos[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  elevation: 4,
                  child: Stack(
                    children: [
                      // Imagem do prato com o texto
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                prato['imagem']!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    prato['nome']!,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(prato['descricao']!),
                                  SizedBox(height: 6),
                                  Text(
                                    prato['preco']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.green[700],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Pedir'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Sobreposição do texto "Garanta o seu já"
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Novidades',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}