import 'package:flutter/material.dart';
import '../calculator_brain.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.calculator});
  final CalculatorBrain calculator;
  @override
  Widget build(BuildContext context) {
    final normal = calculator.getResult() == 'Normal';
    return Scaffold(
      appBar: AppBar(title: const Text('KẾT QUẢ CỦA BẠN')),
      bottomNavigationBar: BottomButton(
        label: 'RE-CALCULATE',
        onPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: ReusableCard(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    children: [
                      Icon(
                        normal ? Icons.check_circle_outline : Icons.insights,
                        size: 44,
                        color: normal
                            ? const Color(0xFF8DD9B0)
                            : const Color(0xFFFFCA8C),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        calculator.getResult(),
                        key: const Key('bmi-category'),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: normal
                              ? const Color(0xFF8DD9B0)
                              : const Color(0xFFFFCA8C),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        calculator.calculateBMI(),
                        key: const Key('bmi-result'),
                        style: const TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Text('kg/m²', style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 28),
                      Text(
                        calculator.getInterpretation(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18, height: 1.6),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Khoảng tham khảo: 18.5 ≤ BMI < 25',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
