import 'package:fixit/FindResultPage.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class FindOS extends StatefulWidget {
  FindOS({
    Key? key,
  }) : super(key: key);
  final nomeCliente = TextEditingController();

  @override
  _FindOS createState() => _FindOS();
}

class _FindOS extends State<FindOS> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Text("Encontrar Ordem de Serviço"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Procurar...',
                  hintText: 'Digite o ID da OS'),
              controller: widget.nomeCliente,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              height: 50,
              width: 94,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.lightBlue,
                  onSurface: Colors.grey,
                  animationDuration: Duration(seconds: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Row(
                  children: const [Icon(Icons.search), Text('Procurar')],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/FindResultPage', arguments: {
                    'nomeCliente': widget.nomeCliente.text,
                  });
                  widget.nomeCliente.clear();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
