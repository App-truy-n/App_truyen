# do_an_truyen

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Comic App (MVVM)

Ứng dụng đọc truyện tranh sử dụng SQLite và mô hình MVVM.


## Cấu trúc thư mục
- `lib/models/`: Chứa các mô hình dữ liệu (Comic, Chapter, User).
- `lib/services/`: Chứa các dịch vụ (DatabaseHelper, FileHelper).
- `lib/viewmodels/`: Chứa các ViewModel.
- `lib/views/`: Chứa các màn hình giao diện (View).
- `lib/widgets/`: Chứa các widget tái sử dụng.
- `assets/`: Chứa file tĩnh (ảnh bìa, file PDF).

## Cách chạy
1. Thêm file ảnh bìa và PDF vào `assets/thumbnails/` và `assets/chapters/`.
2. Chạy lệnh:flutter pub get
             flutter run
3. ## Thêm truyện mới
- Thêm file ảnh bìa và PDF vào thư mục `assets/`.
- Cập nhật hàm `_addSampleData()` trong `main.dart` để thêm truyện mới
