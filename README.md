# BMI Calculator

Ứng dụng tính chỉ số khối cơ thể với màn hình nhập liệu và kết quả.

Dự án Flutter độc lập, dùng Flutter 3.38.6 / Dart 3.10.7.

## Chức năng

- Chọn giới tính, điều chỉnh chiều cao từ 120 đến 220 cm.
- Tăng/giảm cân nặng và tuổi bằng các nút riêng.
- CalculatorBrain tính BMI, phân loại và đưa ra lời khuyên.
- Có ReusableCard, BottomButton, IconContent và RoundIconButton.
- Dùng Navigator.push()/pop() để xem kết quả và tính lại.

## Chạy và kiểm tra

```powershell
flutter pub get
flutter analyze
flutter test
flutter devices
flutter run
```

Tài nguyên cần thiết đã có sẵn trong dự án. Đã kiểm tra bằng analyze, unit/widget test.

## Nền tảng chạy

Dự án chỉ giữ nền tảng Android. Mở máy ảo Android, chạy `flutter devices` để kiểm tra kết nối, sau đó chạy `flutter run` và chọn thiết bị Android. Các thư mục nền tảng khác đã được loại bỏ.
