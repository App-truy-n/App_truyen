import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/database_helper.dart';
import 'services/file_helper.dart';
import 'viewmodels/comic_list_viewmodel.dart';
import 'viewmodels/comic_detail_viewmodel.dart';
import 'viewmodels/pdf_viewer_viewmodel.dart';
import 'viewmodels/favorite_viewmodel.dart';
import 'viewmodels/auth_viewmodel.dart';
import 'viewmodels/profile_viewmodel.dart';
import 'views/login_screen.dart';
import 'utils/sample_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FileHelper.initializeDirectories();

  const bool resetSampleData = false; //  Đổi thành true khi muốn reset dữ liệu mẫu

  if (resetSampleData) {
    await DatabaseHelper.instance.deleteAllData(); //  Xoá dữ liệu cũ
    await SampleData.addSampleData(); //  Thêm dữ liệu mẫu mới
  } else {
    final comics = await DatabaseHelper.instance.getComics();
    final users = await DatabaseHelper.instance.getUserByEmail("example@example.com");

    if (comics.isEmpty && users == null) {
      await SampleData.addSampleData();
    }
  }

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ComicListViewModel()),
        ChangeNotifierProvider(create: (_) => ComicDetailViewModel()),
        ChangeNotifierProvider(create: (_) => PDFViewerViewModel()),
        ChangeNotifierProvider(create: (_) => FavoriteViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProxyProvider<AuthViewModel, ProfileViewModel>(
          create: (context) => ProfileViewModel(Provider.of<AuthViewModel>(context, listen: false)),
          update: (context, authViewModel, profileViewModel) =>
          profileViewModel ?? ProfileViewModel(authViewModel),
        ),
      ],
      child: MaterialApp(
        title: 'Comic App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginScreen(),
      ),
    );
  }
}
