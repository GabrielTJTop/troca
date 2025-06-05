import 'package:flutter/material.dart';
import 'package:troca/models/produto.dart';
import 'package:troca/screens/produto_detalhe.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});


  final List<Produto> produtos = [
    Produto(
      titulo: 'Iphone 11 usado',
      descricao: 'iPhone 11 usado bateria 82%',
      preco: 1500.00,
      imagemUrl: 'assets/images/ihpone 11.jpg',





    ),
    Produto(
      titulo: 'Apple Watch series 10',
      descricao: 'Apple watch series 10 novo, 2500 a vista, dispenso lisos .',
      preco: 2500.00,
      imagemUrl: 'assets/images/applewatch10.jpeg',
    ),
    Produto(
      titulo: 'FIAT ARGO',
      descricao: 'Argo 2024 30km rodados',
      preco: 74500.00,
      imagemUrl: 'assets/images/argo.jpg',
    ),
    Produto(
      titulo: 'Teclado Mecânico RGB',
      descricao: 'teclado gamer switch blue .',
      preco: 100.00,
      imagemUrl: 'assets/images/teclado.jpg',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Troca'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.75,
        ),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ProdutoDetalheScreen(produto: produto),
                ),
              );
            },
            child: Card(
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      produto.imagemUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          produto.titulo,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'R\$ ${produto.preco.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}