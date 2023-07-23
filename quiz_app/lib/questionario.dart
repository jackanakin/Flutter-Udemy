import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  const Questionario(
      {super.key,
      required this.perguntaSelecionada,
      required this.perguntas,
      required this.quandoResponder});

  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) quandoResponder;

  bool get temPergundaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPergundaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]["texto"].toString()),
        ...respostas
            .map(
              (resp) => Resposta(
                resp['texto'].toString(),
                () => quandoResponder(
                  int.parse(resp["pontuacao"].toString()),
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
