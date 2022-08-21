import 'package:flutter/material.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: Colors.transparent,
        title: const Text(
          "Sobre",
        ),
        centerTitle: true,
        // shape: const Border(
        //   bottom: BorderSide(color: corDeLinhaAppBar, width: 1),
        // ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
        //height: TamanhoTela.height(context, 1),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 200,
                            width: 250,
                            decoration: const BoxDecoration(
                              //color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/logo.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "ForestInv é o resultado de um Trabalho de Conclusão de Curso (TCC) em Ciência da Computação pela Universidade Federal do Espírito Santo.",
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "O aplicativo tem por objetivo fazer a validação de consistência de dados durante a coleta de dados de um Inventário Florestal Contínuo.",
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            right: 8,
                            left: 8,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: ColorsConst.secondary.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Desenvolvido por:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Wagner Paulo Barbosa de Andrade\nProf. Dr. Clayton Viera Fraga Filho"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              // SizedBox(
              //   child: Link(
              //     uri: Uri.parse(
              //         'https://www.gov.br/governodigital/pt-br/sisp/documentos/arquivos/guia-de-contagem-de-pontos-de-funcao-do-sisp-para-projetos-dw.pdf'),
              //     builder: (context, openLink) => GestureDetector(
              //       onTap: openLink,
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: const [
              //           Text(
              //             "Referências: ",
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //           Text(
              //             'https://www.gov.br/governodigital/pt-br/sisp/documentos/arquivos/guia-de-contagem-de-pontos-de-funcao-do-sisp-para-projetos-dw.pdf',
              //             style: TextStyle(color: Colors.blueAccent),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
