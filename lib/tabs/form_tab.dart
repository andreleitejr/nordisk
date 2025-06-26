// lib/screens/form_tab.dart

import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' hide Uint8List;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nordisk/theme/theme_colors.dart';
import 'package:nordisk/theme/theme_icons.dart';
import 'package:nordisk/widgets/health_data_notifier.dart';
import 'package:nordisk/widgets/icon_widget.dart';
import 'package:nordisk/widgets/title_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class FormTab extends StatefulWidget {
  final User user;

  const FormTab({super.key, required this.user});

  @override
  State<FormTab> createState() => _FormTabState();
}

class _FormTabState extends State<FormTab> {
  int currentStep = 1;

  void _showGuidanceDialog(HealthDataNotifier notifier) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Orientações'),
        content: SingleChildScrollView(child: _buildGuidanceSection(notifier)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<HealthDataNotifier>();
    return Scaffold(
      backgroundColor: Color(0xFFf5fffe),
      appBar: AppBar(
        backgroundColor: Color(0xFFf5fffe),
        centerTitle: true,
        leading: const SizedBox.shrink(),
        title: TitleWidget(title: 'Calcular MashScore'),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 24),
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showGuidanceDialog(notifier),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(color: Color(0xFFf5fffe)),
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(Icons.abc_outlined, color: Colors.red, size: 36),
              //     SizedBox(width: 12),
              //     Text(
              //       "O Seu Mashscore",
              //       style: TextStyle(
              //         fontSize: 28,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.indigo,
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 16),
              // Text(
              //   "ID do Utilizador: ${widget.user.uid}",
              //   textAlign: TextAlign.center,
              //   style: const TextStyle(color: Colors.grey, fontSize: 12),
              // ),
              // const SizedBox(height: 24),
              Text(
                "Seu Progresso",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              LinearPercentIndicator(
                lineHeight: 32,
                percent: notifier.completionPercentage / 100,
                center: Text(
                  "${notifier.completionPercentage.toStringAsFixed(0)}% Concluído",
                  style: GoogleFonts.montserrat(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                barRadius: const Radius.circular(10),
                progressColor: Colors.green,
                backgroundColor: Colors.grey[200],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Mashscore",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        notifier.mashScore.toStringAsFixed(0),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                  // Column(
                  //   children: [
                  //     const Text(
                  //       "Nível Atual",
                  //       style: TextStyle(fontSize: 16, color: Colors.grey),
                  //     ),
                  //     Text(
                  //       notifier.level.toString(),
                  //       style: const TextStyle(
                  //         fontSize: 28,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.amber,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              const SizedBox(height: 24),
              if (currentStep == 1) ...[
                _buildYesNoSelector(
                  label: "Você tem diabetes?",
                  icon: ThemeIcons.blood,
                  iconColor: Colors.red,
                  value: notifier.hasDiabetes,
                  onChanged: notifier.setHasDiabetes,
                ),

                _buildYesNoSelector(
                  label: "Você tem hipertensão?",
                  icon: ThemeIcons.heart,
                  iconColor: Colors.blue,
                  value: notifier.hasHypertension,
                  onChanged: notifier.setHasHypertension,
                ),

                _buildYesNoSelector(
                  label: "Você tem colesterol alto?",
                  icon: ThemeIcons.flaskConical,
                  iconColor: Colors.green,
                  value: notifier.hasCholesterol,
                  onChanged: notifier.setHasCholesterol,
                ),
                // _buildInputField(
                //   controller: notifier.bloodPressureController,
                //   label: "Pressão Arterial (mmHg)",
                //   hint: "Ex: 120",
                //   icon: Icons.add,
                //   iconColor: Colors.blue,
                // ),
                // _buildInputField(
                //   controller: notifier.glucoseLevelController,
                //   label: "Nível de Glicose (mg/dL)",
                //   hint: "Ex: 90",
                //   icon: Icons.add,
                //   iconColor: Colors.red,
                // ),
                // _buildInputField(
                //   controller: notifier.cholesterolController,
                //   label: "Colesterol Total (mg/dL)",
                //   hint: "Ex: 180",
                //   icon: Icons.add,
                //   iconColor: Colors.green,
                // ),
                // _buildInputField(
                //   controller: notifier.heightController,
                //   label: "Altura (m)",
                //   hint: "Ex: 1.75",
                //   icon: Icons.add,
                //   iconColor: Colors.teal,
                // ),
                // _buildInputField(
                //   controller: notifier.weightController,
                //   label: "Peso (kg)",
                //   hint: "Ex: 70",
                //   icon: Icons.add,
                //   iconColor: Colors.amber,
                // ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 56,
                  child: TextButton(
                    onPressed: () => setState(() => currentStep = 2),
                    style: TextButton.styleFrom(
                      backgroundColor: ThemeColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Próximo"),
                  ),
                ),
              ],

              if (currentStep == 2) ...[
                _buildInputField(
                  controller: notifier.heightController,
                  label: "Altura (m)",
                  hint: "Ex: 1.75",
                  icon: ThemeIcons.ruler,
                  iconColor: Colors.teal,
                ),
                _buildInputField(
                  controller: notifier.weightController,
                  label: "Peso (kg)",
                  hint: "Ex: 70",
                  icon: ThemeIcons.weight,
                  iconColor: Colors.amber,
                ),

                _buildInputField(
                  controller: notifier.ageController,
                  label: "Idade (anos)",
                  hint: "Ex: 35",
                  icon: ThemeIcons.calendar,
                  iconColor: Colors.purple,
                ),
                // _buildInputField(
                //   controller: notifier.weightController,
                //   label: "Data de Nascimento",
                //   hint: "Ex: 01/01/1980",
                //   icon: Icons.add,
                //   iconColor: Colors.amber,
                // ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: TextButton(
                          onPressed: () => setState(() => currentStep = 1),
                          style: TextButton.styleFrom(
                            backgroundColor: ThemeColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text("Voltar"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: TextButton(
                          onPressed: () => setState(() => currentStep = 3),
                          style: TextButton.styleFrom(
                            backgroundColor: ThemeColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text("Próximo"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],

              if (currentStep == 3) ...[
                // _buildInputField(
                //   controller: notifier.heartRateController,
                //   label: "Frequência Cardíaca (bpm)",
                //   hint: "Ex: 70",
                //   icon: Icons.add,
                //   iconColor: Colors.orange,
                // ),
                _buildInputField(
                  controller: notifier.astLevelController,
                  label: "AST (U/L)",
                  hint: "Ex: 25",
                  icon: ThemeIcons.syringe,
                  iconColor: Colors.red.shade800,
                ),
                _buildInputField(
                  controller: notifier.altLevelController,
                  label: "ALT (U/L)",
                  hint: "Ex: 30",
                  icon: ThemeIcons.pipette,
                  iconColor: Colors.green.shade800,
                ),
                _buildInputField(
                  controller: notifier.plateletCountController,
                  label: "Plaquetas (x10^9/L)",
                  hint: "Ex: 200",
                  icon: ThemeIcons.testTube,
                  iconColor: Colors.redAccent,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: TextButton(
                          onPressed: () => setState(() => currentStep = 2),
                          style: TextButton.styleFrom(
                            backgroundColor: ThemeColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text("Voltar"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: TextButton(
                          onPressed: () => setState(() => currentStep = 4),
                          style: TextButton.styleFrom(
                            backgroundColor: ThemeColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text("Próximo"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],

              if (currentStep == 4) ...[
                const SizedBox(height: 24),

                if (notifier.uploadedExamFilePath == null &&
                    notifier.uploadedExamFileBytes == null) ...[
                  SizedBox(
                    height: 56,
                    child: TextButton.icon(
                      icon: const Icon(Icons.upload_file),
                      label: const Text("Fazer upload de exame"),
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['pdf', 'jpg', 'png'],
                        );

                        if (result != null) {
                          final file = result.files.single;

                          if (kIsWeb && file.bytes != null) {
                            notifier.setUploadedExamFileFromBytes(
                              file.name,
                              file.bytes!,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: ThemeColors.primary,
                                content: Text("Arquivo carregado na memória"),
                              ),
                            );
                          } else if (file.path != null) {
                            notifier.setUploadedExamFile(file.path!);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Arquivo salvo localmente"),
                              ),
                            );
                          }
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: ThemeColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.insert_drive_file, color: Colors.grey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFdae3ff),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: ThemeColors.primary),
                          ),
                          child: Text(
                            notifier.uploadedExamFileName ??
                                'Documento selecionado',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],

              const SizedBox(height: 32),
              // if (notifier.individualFieldTourinhos.containsValue(true))
              //   _buildTourinhoSection(
              //     title: "Seus Tourinhos de Preenchimento:",
              //     tourinhos: notifier.individualFieldTourinhos.entries
              //         .where((e) => e.value)
              //         .map((e) => "Tourinho Novo Nordisk (${e.key})")
              //         .toList(),
              //     color: Colors.lime,
              //   ),
              // if (notifier.bonusTourinhos.isNotEmpty)
              //   _buildTourinhoSection(
              //     title: "Seus Tourinhos Bônus:",
              //     tourinhos: notifier.bonusTourinhos
              //         .map(
              //           (id) =>
              //               "Tourinho Novo Nordisk (${id.split('-').last}% Concluído)",
              //         )
              //         .toList(),
              //     color: Colors.yellow,
              //   ),
              const SizedBox(height: 24),
              if (notifier.showLowScoreMessage)
                _buildLowScoreMessage(notifier.lowScoreBenefit),
              // ElevatedButton.icon(
              //   onPressed: notifier.toggleGuidance,
              //   icon: Icon(
              //     notifier.showGuidance ? Icons.abc_outlined : Icons.abc_outlined,
              //   ),
              //   label: Text(
              //     notifier.showGuidance
              //         ? 'Ocultar Orientações'
              //         : 'Mostrar Orientações',
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     foregroundColor: Colors.white,
              //     backgroundColor: Colors.indigo,
              //     padding: const EdgeInsets.symmetric(vertical: 12),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //   ),
              // ),
              // if (notifier.showGuidance) _buildGuidanceSection(notifier),
            ],
          ),
        ),
      ),
    );
  }

  // Equivalente ao renderInputField do React
  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required String icon,
    required Color iconColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                  child: IconWidget(icon: icon, color: iconColor, size: 20),
                ),
                const WidgetSpan(child: SizedBox(width: 8)),
                TextSpan(
                  text: label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYesNoSelector({
    required String label,
    required String icon,
    required Color iconColor,
    required bool? value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                  child: IconWidget(icon: icon, color: iconColor, size: 20),
                ),
                const WidgetSpan(child: SizedBox(width: 8)),
                TextSpan(
                  text: label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => onChanged(true),
                  borderRadius: BorderRadius.circular(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<bool>(
                        value: true,
                        groupValue: value,
                        onChanged: (val) => onChanged(val!),
                        activeColor: Colors.green,
                      ),
                      const Text("Sim"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => onChanged(false),
                  borderRadius: BorderRadius.circular(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<bool>(
                        value: false,
                        groupValue: value,
                        onChanged: (val) => onChanged(val!),
                        activeColor: Colors.red,
                      ),
                      const Text("Não"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTourinhoSection({
    required String title,
    required List<String> tourinhos,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                const WidgetSpan(child: Icon(Icons.abc_outlined, size: 20)),
                const WidgetSpan(child: SizedBox(width: 8)),
                TextSpan(
                  text: title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: tourinhos
                .map(
                  (text) => Chip(
                    label: Text(
                      text,
                      style: TextStyle(fontSize: 10, color: Colors.black87),
                    ),
                    backgroundColor: color.withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildLowScoreMessage(String benefit) {
    late String message;
    late Color color;
    late Color borderColor;
    late Color textColor;

    if (benefit == 'baixo') {
      message =
          'O seu Mashscore é baixo. Recomendamos que procure um médico de confiança para uma avaliação mais detalhada. Veja no mapa abaixo lugares para check-ups gratuitos e MASHPOINTs.';
      color = Colors.red[50]!;
      borderColor = Colors.red[200]!;
      textColor = Colors.red[800]!;
    } else if (benefit == 'medio') {
      message =
          'O seu Mashscore é Intermediário Temos um MASHLEADER próximo de si, agende no mapa em baixo para o(a) ajudar a melhorar a sua saúde! Ganhou um mês de acompanhamento médico para o(a) ajudar a melhorar a sua saúde!';
      color = Colors.yellow[50]!;
      borderColor = Colors.yellow[200]!;
      textColor = Colors.yellow[800]!;
    } else if (benefit == 'alto') {
      message =
          'O seu Mashscore é Alto. Parabéns! Continue a monitorizar a sua saúde para manter este excelente resultado.';
      color = Colors.blue[50]!;
      borderColor = Colors.blue[200]!;
      textColor = Colors.blue[800]!;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Icon(Icons.abc_outlined, color: textColor, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Text(message, style: TextStyle(color: textColor)),
          ),
        ],
      ),
    );
  }

  Widget _buildGuidanceSection(HealthDataNotifier notifier) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue[100]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (notifier.completionPercentage == 100)
            const Text(
              "Parabéns! Todos os seus dados foram inseridos. Continue a monitorizar a sua saúde!",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )
          else ...[
            // if (notifier.bloodPressureController.text.isEmpty)
            //   const Text("• Pressão Arterial: Verifique regularmente."),
            // if (notifier.glucoseLevelController.text.isEmpty)
            //   const Text(
            //     "• Nível de Glicose: Importante para detetar diabetes.",
            //   ),
            if (notifier.hasCholesterol != null && notifier.hasCholesterol!)
              const Text(
                "• Colesterol Total: Peça um painel lipídico ao seu médico.",
              ),
            if (notifier.heightController.text.isEmpty ||
                notifier.weightController.text.isEmpty)
              const Text("• IMC: Insira altura e peso para calcular."),
            if (notifier.heartRateController.text.isEmpty)
              const Text(
                "• Frequência Cardíaca: Monitorize o seu pulso em repouso.",
              ),
            if (notifier.ageController.text.isEmpty ||
                notifier.astLevelController.text.isEmpty ||
                notifier.altLevelController.text.isEmpty ||
                notifier.plateletCountController.text.isEmpty)
              const Text("• FIB-4: Exames importantes para a saúde do fígado."),
          ],
        ],
      ),
    );
  }
}
