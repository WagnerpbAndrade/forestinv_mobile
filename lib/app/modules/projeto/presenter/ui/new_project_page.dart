import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/core/utils/responsive_config.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_dropdown_button.dart';
import 'package:forestinv_mobile/app/core/widgets/custom_textformfield.dart';
import 'package:forestinv_mobile/app/modules/services/via_cep_service.dart';

class NewProjectPage extends StatefulWidget {
  @override
  _NewProjectPageState createState() => _NewProjectPageState();
}

class _NewProjectPageState extends State<NewProjectPage> {
  late FocusNode area;
  late FocusNode format;
  late FocusNode locale;
  late FocusNode submit;

  @override
  void initState() {
    super.initState();
    area = FocusNode();
    format = FocusNode();
    locale = FocusNode();
    submit = FocusNode();
  }

  @override
  void dispose() {
    area.dispose();
    format.dispose();
    locale.dispose();
    submit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo projeto"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  focusNode: area,
                  label: 'Nome do Projeto',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLines: 1,
                  maxLenght: 100,
                ),
                SizedBox(
                  height: ResponsiveConfig.screenHeight! * 0.01,
                ),
                CustomTextFormField(
                  focusNode: format,
                  label: 'Área (ha)',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  maxLines: 1,
                  maxLenght: 9,
                  autofocus: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(
                  height: ResponsiveConfig.screenHeight! * 0.01,
                ),
                CustomDropdownButton(
                  width: double.infinity,
                  dropdownValue: 'Quadrada',
                  items: ['Quadrada', 'Retangular'],
                  icon: Icons.arrow_downward,
                ),
                SizedBox(
                  height: ResponsiveConfig.screenHeight! * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        focusNode: locale,
                        label: 'Cep',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        maxLenght: 8,
                        autofocus: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        var viaCepService = Modular.get<ViaCepService>();
                        viaCepService.fetchCep(cep: '29015380');
                      },
                      icon: Icon(Icons.search),
                      label: Text(''),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
