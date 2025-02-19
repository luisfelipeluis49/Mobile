import 'package:flutter/material.dart';

class PagamentoScreen extends StatefulWidget {
  const PagamentoScreen({Key? key}) : super(key: key);

  @override
  State<PagamentoScreen> createState() => _PagamentoScreenState();
}

class _PagamentoScreenState extends State<PagamentoScreen> {
  List<String> imageUrls = [
    'lib/assets/hobbit_book.png',
    'lib/assets/pedra_book.png',
  ];

  List<String> genreDescriptions = [
    '50,00',
    '30,00',
  ];

  String?
      _selectedPayment; // Variável para armazenar a forma de pagamento selecionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.lightBlueAccent,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top +
                      kToolbarHeight, // Espaço para a AppBar
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0, // Reduzindo o espaçamento vertical
                  ),
                  child: Text(
                    'O valor a ser pago é:',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 130.0,
                  ),
                  child: Text(
                    '80,00', //depois o valor vai mudar conforme o banco de dados
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 5, // Espaçamento entre os elementos
                      crossAxisSpacing: 1, // Espaçamento entre os elementos
                    ),
                    shrinkWrap: true,
                    physics:
                        NeverScrollableScrollPhysics(), // Impede que a GridView role
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          //aqui são as imagens dos prodsss
                          Container(
                            height: 190,
                            width: 190,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(imageUrls[index]),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                genreDescriptions[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Selecione a forma de pagamento:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0), // Espaçamento vertical reduzido
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RadioListTile<String>(
                        title: Row(
                          children: [
                            Icon(Icons.payment),
                            SizedBox(width: 8),
                            Text("Pix"),
                          ],
                        ),
                        value: 'pix',
                        groupValue: _selectedPayment,
                        onChanged: (value) {
                          setState(() {
                            _selectedPayment = value;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: Row(
                          children: [
                            Icon(Icons.credit_card),
                            SizedBox(width: 8),
                            Text("Crédito"),
                          ],
                        ),
                        value: 'credit',
                        groupValue: _selectedPayment,
                        onChanged: (value) {
                          setState(() {
                            _selectedPayment = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20), // Adicionei a vírgula que faltava aqui
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orangeAccent, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/confPagamento');
                    },
                    child: Text('Confirmar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
