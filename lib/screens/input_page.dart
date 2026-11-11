import 'package:flutter/material.dart';
import '../calculator_brain.dart';
import '../components/bottom_button.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import 'results_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender _gender = Gender.male;
  int _height = 170, _weight = 60, _age = 25;

  Widget _counter(
    String label,
    String id,
    int value,
    int min,
    int max,
    ValueChanged<int> update,
  ) => ReusableCard(
    child: Column(
      children: [
        Text(label),
        const SizedBox(height: 8),
        Text(
          '$value',
          key: ValueKey('$id-value'),
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              key: ValueKey('$id-minus'),
              icon: Icons.remove,
              label: 'Giảm $label',
              onPressed: value > min
                  ? () => setState(() => update(value - 1))
                  : null,
            ),
            const SizedBox(width: 8),
            RoundIconButton(
              key: ValueKey('$id-plus'),
              icon: Icons.add,
              label: 'Tăng $label',
              onPressed: value < max
                  ? () => setState(() => update(value + 1))
                  : null,
            ),
          ],
        ),
      ],
    ),
  );

  void _calculate() {
    final calculator = CalculatorBrain(
      height: _height.toDouble(),
      weight: _weight.toDouble(),
    );
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => ResultsPage(calculator: calculator),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('BMI CALCULATOR / 08')),
    bottomNavigationBar: BottomButton(
      label: 'CALCULATE',
      onPressed: _calculate,
    ),
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Hiểu cơ thể bạn',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text('Nhập thông tin để tính chỉ số khối cơ thể.'),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Semantics(
                        selected: _gender == Gender.male,
                        button: true,
                        child: ReusableCard(
                          key: const Key('male'),
                          selected: _gender == Gender.male,
                          onTap: () => setState(() => _gender = Gender.male),
                          child: const IconContent(
                            icon: Icons.male,
                            label: 'NAM',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Semantics(
                        selected: _gender == Gender.female,
                        button: true,
                        child: ReusableCard(
                          key: const Key('female'),
                          selected: _gender == Gender.female,
                          onTap: () => setState(() => _gender = Gender.female),
                          child: const IconContent(
                            icon: Icons.female,
                            label: 'NỮ',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ReusableCard(
                  child: Column(
                    children: [
                      const Text('CHIỀU CAO'),
                      Text(
                        '$_height cm',
                        key: const Key('height-value'),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 4,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 12,
                          ),
                        ),
                        child: Slider(
                          key: const Key('height-slider'),
                          value: _height.toDouble(),
                          min: 120,
                          max: 220,
                          divisions: 100,
                          label: '$_height cm',
                          onChanged: (value) =>
                              setState(() => _height = value.round()),
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('120 cm'), Text('220 cm')],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _counter(
                        'CÂN NẶNG (kg)',
                        'weight',
                        _weight,
                        1,
                        300,
                        (v) => _weight = v,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _counter(
                        'TUỔI',
                        'age',
                        _age,
                        18,
                        120,
                        (v) => _age = v,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Khoảng BMI tham khảo dành cho người trưởng thành (18+).',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
