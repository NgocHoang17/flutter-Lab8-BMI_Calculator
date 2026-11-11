class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight}) {
    if (!height.isFinite || !weight.isFinite || height <= 0 || weight <= 0) {
      throw ArgumentError('Chiều cao và cân nặng phải là số dương hữu hạn.');
    }
  }

  final double height;
  final double weight;
  double get bmi => weight / ((height / 100) * (height / 100));
  String calculateBMI() => bmi.toStringAsFixed(1);

  // So sánh giá trị chưa làm tròn để phân loại đúng ở các ngưỡng.
  String getResult() {
    if (bmi >= 25) return 'Overweight';
    if (bmi >= 18.5) return 'Normal';
    return 'Underweight';
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return 'BMI cao hơn khoảng tham khảo. Hãy duy trì vận động phù hợp, ăn uống cân đối và trao đổi với chuyên gia nếu cần.';
    }
    if (bmi >= 18.5) {
      return 'BMI trong khoảng tham khảo. Hãy tiếp tục duy trì chế độ ăn cân đối và thói quen vận động đều đặn.';
    }
    return 'BMI thấp hơn khoảng tham khảo. Hãy chú ý dinh dưỡng đầy đủ và trao đổi với chuyên gia nếu cần.';
  }
}
