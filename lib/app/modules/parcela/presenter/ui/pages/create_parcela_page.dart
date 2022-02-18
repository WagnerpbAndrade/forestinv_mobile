import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/constants/colors_const.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_button.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_text_form_field.dart';
import 'package:forestinv_mobile/app/modules/parcela/domain/entities/parcela.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/output/controllers/create_parcela_controller.dart';
import 'package:forestinv_mobile/app/modules/parcela/presenter/output/stores/create_parcela_store.dart';
import 'package:forestinv_mobile/helper/extensions.dart';

class CreateParcelaPage extends StatefulWidget {
  final List args;

  const CreateParcelaPage(this.args);

  @override
  _CreateParcelaPageState createState() => _CreateParcelaPageState();
}

class _CreateParcelaPageState
    extends ModularState<CreateParcelaPage, CreateParcelaStore> {
  final createParcelaController = Modular.get<CreateParcelaController>();
  DateTime _date = DateTime.now();
  Parcela? get parcela => widget.args.elementAt(0);

  @override
  void initState() {
    super.initState();
    print('Parcela in CreateParcelaPage: ${parcela?.id}');
    createParcelaController.configPage(parcela);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: parcela == null
            ? const Text(
                'Cadastrar Parcela',
                style: TextStyle(
                  color: ColorsConst.textColorPrimary,
                  fontWeight: FontWeight.w400,
                ),
              )
            : const Text('Editar Parcela'),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Observer(
                          builder: (context) {
                            return CustomTextFormField(
                              controller: createParcelaController
                                  .txtNumeroParcelaController,
                              label: "Número da parcela",
                              icon: const Icon(
                                Icons.email,
                                color: ColorsConst.primary,
                              ),
                              // decoration: InputDecoration(
                              //   prefixIcon: const Icon(
                              //     Icons.calendar_today_outlined,
                              //     color: ColorsConst.primary,
                              //   ),
                              //   labelText: 'Número da parcela',
                              //   filled: true,
                              //   border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(10.0),
                              //     borderSide: const BorderSide(
                              //       width: 0,
                              //       style: BorderStyle.none,
                              //     ),
                              //   ),
                              //   fillColor: ColorsConst.primary.withOpacity(0.1),
                              // ),
                              onChanged: (value) {
                                store.numero = value.toString();

                                store.validarNumeroParcela();
                              },
                              textError: store.textErrorNumero,
                              valido: store.numeroError,
                              isPassWord: false,
                              textType: TextInputType.number,
                            );
                          },
                        ),
                        Observer(
                          builder: (context) {
                            return CustomTextFormField(
                              controller: createParcelaController
                                  .txtAreaParcelaController,
                              label: "Área da parcela",
                              icon: const Icon(
                                Icons.email,
                                color: ColorsConst.primary,
                              ),
                              // decoration: InputDecoration(
                              //   prefixIcon: const Icon(
                              //     Icons.calendar_today_outlined,
                              //     color: ColorsConst.primary,
                              //   ),
                              //   labelText: 'Área da parcela',
                              //   filled: true,
                              //   border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(10.0),
                              //     borderSide: const BorderSide(
                              //       width: 0,
                              //       style: BorderStyle.none,
                              //     ),
                              //   ),
                              //   fillColor: ColorsConst.primary.withOpacity(0.1),
                              // ),
                              onChanged: (value) {
                                store.area = value.toString();

                                store.validarAreaParcela();
                              },
                              textError: store.textErrorArea,
                              valido: store.areaError,
                              isPassWord: false,
                              textType: const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                            );
                          },
                        ),
                        Observer(
                          builder: (context) {
                            return CustomTextFormField(
                              controller: createParcelaController
                                  .txtLarguraParcelaController,
                              label: "Largura da parcela",
                              icon: const Icon(
                                Icons.email,
                                color: ColorsConst.primary,
                              ),
                              // decoration: InputDecoration(
                              //   prefixIcon: const Icon(
                              //     Icons.calendar_today_outlined,
                              //     color: ColorsConst.primary,
                              //   ),
                              //   labelText: "Largura da parcela",
                              //   filled: true,
                              //   border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(10.0),
                              //     borderSide: const BorderSide(
                              //       width: 0,
                              //       style: BorderStyle.none,
                              //     ),
                              //   ),
                              //   fillColor: ColorsConst.primary.withOpacity(0.1),
                              // ),
                              onChanged: (value) {
                                store.largura = value.toString();

                                store.validarLarguraParcela();
                              },
                              textError: store.textErrorLargura,
                              valido: store.larguraError,
                              isPassWord: false,
                              textType: const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                            );
                          },
                        ),
                        Observer(
                          builder: (context) {
                            return CustomTextFormField(
                              controller: createParcelaController
                                  .txtNumTalhaoParcelaController,
                              label: "Número do talhão da parcela",
                              icon: const Icon(
                                Icons.email,
                                color: ColorsConst.primary,
                              ),
                              // decoration: InputDecoration(
                              //   prefixIcon: const Icon(
                              //     Icons.calendar_today_outlined,
                              //     color: ColorsConst.primary,
                              //   ),
                              //   labelText: "Número do talhão",
                              //   filled: true,
                              //   border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(10.0),
                              //     borderSide: const BorderSide(
                              //       width: 0,
                              //       style: BorderStyle.none,
                              //     ),
                              //   ),
                              //   fillColor: ColorsConst.primary.withOpacity(0.1),
                              // ),
                              onChanged: (value) {
                                store.numTalhao = value.toString();

                                store.validarNumTalhaoParcela();
                              },
                              textError: store.textErrorNumTalhao,
                              valido: store.numTalhaoError,
                              isPassWord: false,
                              textType: TextInputType.number,
                            );
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   mainAxisSize: MainAxisSize.max,
                            //   children: [
                            //     CustomTextFormField(
                            //       width:
                            //           MediaQuery.of(context).size.width * 0.45,
                            //       controller: createParcelaController
                            //           .txtLatitudeParcelaController,
                            //       label: "Latitude",
                            //       icon: const Icon(
                            //         Icons.email,
                            //         color: ColorsConst.primary,
                            //       ),
                            //       onChanged: (value) {
                            //         store.latitude = value.toString();

                            //         store.validarLatitudeParcela();
                            //       },
                            //       textError: store.textErrorLatitude,
                            //       valido: store.latitudeError,
                            //       isPassWord: false,
                            //       textType: TextInputType.text,
                            //     ),
                            //     CustomTextFormField(
                            //       width:
                            //           MediaQuery.of(context).size.width * 0.45,
                            //       controller: createParcelaController
                            //           .txtLongitudeParcelaController,
                            //       label: "Longitude",
                            //       icon: const Icon(
                            //         Icons.email,
                            //         color: ColorsConst.primary,
                            //       ),
                            //       onChanged: (value) {
                            //         store.longitude = value.toString();

                            //         store.validarLongitudeParcela();
                            //       },
                            //       textError: store.textErrorLongitude,
                            //       valido: store.longitudeError,
                            //       isPassWord: false,
                            //       textType: TextInputType.text,
                            //     ),
                            //   ],
                            // ),
                            // Row(
                            //   mainAxisSize: MainAxisSize.max,
                            //   children: [
                            //     Expanded(
                            //       child: ElevatedButton.icon(
                            //         style: ButtonStyle(
                            //             backgroundColor:
                            //                 MaterialStateProperty.all<Color>(
                            //               ColorsConst.secondary,
                            //             ),
                            //             fixedSize:
                            //                 MaterialStateProperty.all<Size>(
                            //                     Size.infinite)),
                            //         onPressed: () async {
                            //           final position =
                            //               await createParcelaController
                            //                   .getPosition();
                            //           final latitude = position.latitude;
                            //           final longitude = position.longitude;
                            //           createParcelaController
                            //               .txtLatitudeParcelaController
                            //               .text = latitude.toString();
                            //           createParcelaController
                            //               .txtLongitudeParcelaController
                            //               .text = longitude.toString();
                            //         },
                            //         icon: const Icon(
                            //           Icons.gps_fixed_rounded,
                            //           color: ColorsConst.textColorPrimary,
                            //         ),
                            //         label: const Text('GPS'),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TextFormField(
                          controller: createParcelaController
                              .txtDataPlantioParcelaController,
                          onTap: () {
                            setState(() {
                              createParcelaController
                                  .txtDataPlantioParcelaController
                                  .text = _date.formattedDate();
                              _selectDate(context);
                            });
                          },
                          readOnly: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.calendar_today_outlined,
                              color: ColorsConst.primary,
                            ),
                            labelText: 'Data de plantio',
                            hintText: _date.formattedDate(),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            fillColor: ColorsConst.primary.withOpacity(0.1),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomTextFormField(
                          controller: createParcelaController
                              .txtEspacamentoParcelaController,
                          label: "Espaçamento. Ex: 2x2, 5x5",
                          icon: const Icon(
                            Icons.email,
                            color: ColorsConst.primary,
                          ),
                          // decoration: InputDecoration(
                          //   prefixIcon: const Icon(
                          //     Icons.calendar_today_outlined,
                          //     color: ColorsConst.primary,
                          //   ),
                          //   labelText: "Espaçamento. Ex: 2x2, 5x5",
                          //   filled: true,
                          //   border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(10.0),
                          //     borderSide: const BorderSide(
                          //       width: 0,
                          //       style: BorderStyle.none,
                          //     ),
                          //   ),
                          //   fillColor: ColorsConst.primary.withOpacity(0.1),
                          // ),
                          onChanged: (value) {
                            store.espacamento = value.toString();

                            store.validarEspacamentoParcela();
                          },
                          textError: store.textErrorEspacamento,
                          valido: store.espacamentoError,
                          isPassWord: false,
                          textType: TextInputType.text,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
            child: CustomButton(
              action: () async {
                print('Entrou no botão');
                if (store.isValidFields()) {
                  print('Entrou no if isValidFields');
                  if (parcela == null) {
                    print('Entrou no if parcela == null');
                    final response = await createParcelaController
                        .createParcela(widget.args.elementAt(1), _date);
                    if (response.ok) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Parcela cadastrada com sucesso. ',
                            style: TextStyle(
                              color: ColorsConst.textColorPrimary,
                            ),
                          ),
                          backgroundColor: ColorsConst.primary,
                          action: SnackBarAction(
                            textColor: ColorsConst.textColorPrimary,
                            label: 'Ok',
                            onPressed: () {},
                          ),
                          duration: const Duration(milliseconds: 1500),
                        ),
                      );
                      Modular.to.pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            response.message ?? '',
                            style: const TextStyle(
                              color: ColorsConst.textColorPrimary,
                            ),
                          ),
                          backgroundColor: ColorsConst.primary,
                          action: SnackBarAction(
                            textColor: ColorsConst.textColorPrimary,
                            label: 'Ok',
                            onPressed: () {},
                          ),
                          duration: const Duration(milliseconds: 1500),
                        ),
                      );
                    }
                  } else {
                    final response =
                        await createParcelaController.updateParcela(
                            parcela!.id.toString(), widget.args.elementAt(1));
                    if (response.ok) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Parcela atualizada com sucesso.',
                            style: TextStyle(
                              color: ColorsConst.textColorPrimary,
                            ),
                          ),
                          backgroundColor: ColorsConst.primary,
                          action: SnackBarAction(
                            textColor: ColorsConst.textColorPrimary,
                            label: 'Ok',
                            onPressed: () {},
                          ),
                          duration: const Duration(milliseconds: 1500),
                        ),
                      );
                      Modular.to.pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            response.message ?? '',
                            style: const TextStyle(
                              color: ColorsConst.textColorPrimary,
                            ),
                          ),
                          backgroundColor: ColorsConst.primary,
                          action: SnackBarAction(
                            textColor: ColorsConst.textColorPrimary,
                            label: 'Ok',
                            onPressed: () {},
                          ),
                          duration: const Duration(milliseconds: 1500),
                        ),
                      );
                    }
                  }
                } else {
                  print('Campos não validados');
                }
              },
              title: parcela == null ? "Salvar" : 'Atualizar',
              margin: const EdgeInsets.only(top: 5),
            ),
          ),
        ],
      ),
    );
  }

  final MaterialColor _buttonTextColor =
      const MaterialColor(0xff9C23FC, <int, Color>{
    50: Color(0xff9C23FC),
    100: Color(0xff9C23FC),
    200: Color(0xff9C23FC),
    300: Color(0xff9C23FC),
    400: Color(0xff9C23FC),
    500: Color(0xff9C23FC),
    600: Color(0xff9C23FC),
    700: Color(0xff9C23FC),
    800: Color(0xff9C23FC),
    900: Color(0xff9C23FC),
  });

  Future<void> _selectDate(BuildContext context) async {
    final _datePicker = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1970),
      lastDate: DateTime(2023),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            primarySwatch: _buttonTextColor,
            primaryColor: ColorsConst.primary,
          ),
          child: child!,
        );
      },
    );
    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
        print(_date.toString());
      });
    }
  }
}
