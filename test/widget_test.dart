import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab08_bmi_calculator/main.dart';
import 'package:lab08_bmi_calculator/calculator_brain.dart';
import 'package:lab08_bmi_calculator/components/reusable_card.dart';

void main() {
  test('Công thức, ngưỡng chưa làm tròn và dữ liệu không hợp lệ', () {
    expect(CalculatorBrain(height: 170, weight: 60).bmi, closeTo(20.761, .001));
    for (final entry in <double, String>{
      73.96: 'Underweight',
      74: 'Normal',
      99.96: 'Normal',
      100: 'Overweight',
    }.entries) {
      final calc = CalculatorBrain(height: 200, weight: entry.key);
      expect(calc.getResult(), entry.value);
      expect(calc.getInterpretation(), isNotEmpty);
    }
    expect(() => CalculatorBrain(height: 0, weight: 60), throwsArgumentError);
  });

  testWidgets('Chọn giới tính, tăng giảm, tính BMI và quay lại giữ dữ liệu', (
    tester,
  ) async {
    await tester.pumpWidget(const BmiApp());
    await tester.tap(find.byKey(const Key('female')));
    await tester.pump();
    expect(
      tester.widget<ReusableCard>(find.byKey(const Key('female'))).selected,
      isTrue,
    );
    final slider = tester.widget<Slider>(
      find.byKey(const Key('height-slider')),
    );
    expect(slider.min, 120);
    expect(slider.max, 220);
    slider.onChanged!(180);
    await tester.pump();
    for (final key in ['weight-plus', 'age-minus']) {
      await tester.ensureVisible(find.byKey(ValueKey(key)));
      await tester.tap(find.byKey(ValueKey(key)));
      await tester.pump();
    }
    expect(find.text('61'), findsOneWidget);
    expect(find.text('24'), findsOneWidget);
    await tester.tap(find.text('CALCULATE'));
    await tester.pumpAndSettle();
    expect(find.text('18.8'), findsOneWidget);
    expect(find.text('Normal'), findsOneWidget);
    await tester.tap(find.text('RE-CALCULATE'));
    await tester.pumpAndSettle();
    expect(find.text('180 cm'), findsOneWidget);
    expect(find.text('61'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
