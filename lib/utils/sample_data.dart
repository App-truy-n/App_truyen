import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import '../models/comic.dart';
import '../models/chapter.dart';
import '../services/database_helper.dart';
import '../services/file_helper.dart';

class SampleData {
  static Future<void> addSampleData() async {
    final dbHelper = DatabaseHelper.instance;

    //thêm dữ liệu mẫu vào cơ sở dữ liệu

    //thumbnails
    final thumbnail1Path = await _copyAssetToStorage('assets/thumbnails/one_piece.jpg', 'thumbnails');
    final thumbnail2Path = await _copyAssetToStorage('assets/thumbnails/naruto.jpg', 'thumbnails');
    final thumbnail3Path = await _copyAssetToStorage('assets/thumbnails/aot.jpg', 'thumbnails');
    final thumbnail4Path = await _copyAssetToStorage('assets/thumbnails/demon_slayer.jpg', 'thumbnails');
    final thumbnail5Path = await _copyAssetToStorage('assets/thumbnails/overlord.jpg', 'thumbnails');
    final thumbnail6Path = await _copyAssetToStorage('assets/thumbnails/boruto.jpg', 'thumbnails');
    final thumbnail7Path = await _copyAssetToStorage('assets/thumbnails/charlotte.jpg', 'thumbnails');
    final thumbnail8Path = await _copyAssetToStorage('assets/thumbnails/cs_lieu.jpg', 'thumbnails');
    final thumbnail9Path = await _copyAssetToStorage('assets/thumbnails/my_cute_deskmate.jpg', 'thumbnails');
    final thumbnail10Path = await _copyAssetToStorage('assets/thumbnails/st_hoc_vien.jpg', 'thumbnails');

    //chapters
    //one piece
    final chapter1Comic1Path = await _copyAssetToStorage('assets/chapters/one_piece_ch1.pdf', 'chapters');
    final chapter2Comic1Path = await _copyAssetToStorage('assets/chapters/one_piece_ch2.pdf', 'chapters');
    final chapter3Comic1Path = await _copyAssetToStorage('assets/chapters/one_piece_ch3.pdf', 'chapters');
    final chapter4Comic1Path = await _copyAssetToStorage('assets/chapters/one_piece_ch4.pdf', 'chapters');
    final chapter5Comic1Path = await _copyAssetToStorage('assets/chapters/one_piece_ch5.pdf', 'chapters');

    //naruto
    final chapter1Comic2Path = await _copyAssetToStorage('assets/chapters/naruto_ch1.pdf', 'chapters');
    final chapter2Comic2Path = await _copyAssetToStorage('assets/chapters/naruto_ch2.pdf', 'chapters');
    final chapter3Comic2Path = await _copyAssetToStorage('assets/chapters/naruto_ch3.pdf', 'chapters');
    final chapter4Comic2Path = await _copyAssetToStorage('assets/chapters/naruto_ch4.pdf', 'chapters');
    final chapter5Comic2Path = await _copyAssetToStorage('assets/chapters/naruto_ch5.pdf', 'chapters');

    //attack on titan
    final chapter1Comic3Path = await _copyAssetToStorage('assets/chapters/aot_ch1.pdf', 'chapters');
    final chapter2Comic3Path = await _copyAssetToStorage('assets/chapters/aot_ch2.pdf', 'chapters');
    final chapter3Comic3Path = await _copyAssetToStorage('assets/chapters/aot_ch3.pdf', 'chapters');

    //demon slayer
    final chapter1Comic4Path = await _copyAssetToStorage('assets/chapters/demon_slayer_ch1.pdf', 'chapters');
    final chapter2Comic4Path = await _copyAssetToStorage('assets/chapters/demon_slayer_ch2.pdf', 'chapters');
    final chapter3Comic4Path = await _copyAssetToStorage('assets/chapters/demon_slayer_ch3.pdf', 'chapters');

    //overlord
    final chapter1Comic5Path = await _copyAssetToStorage('assets/chapters/overlord_ch1.pdf', 'chapters');
    final chapter2Comic5Path = await _copyAssetToStorage('assets/chapters/overlord_ch2.pdf', 'chapters');
    final chapter3Comic5Path = await _copyAssetToStorage('assets/chapters/overlord_ch3.pdf', 'chapters');

    //boruto
    final chapter1Comic6Path = await _copyAssetToStorage('assets/chapters/boruto_ch1.pdf', 'chapters');
    final chapter2Comic6Path = await _copyAssetToStorage('assets/chapters/boruto_ch2.pdf', 'chapters');
    final chapter3Comic6Path = await _copyAssetToStorage('assets/chapters/boruto_ch3.pdf', 'chapters');

    //charlottes
    final chapter1Comic7Path = await _copyAssetToStorage('assets/chapters/charlotte_ch1.pdf', 'chapters');
    final chapter2Comic7Path = await _copyAssetToStorage('assets/chapters/charlotte_ch2.pdf', 'chapters');
    final chapter3Comic7Path = await _copyAssetToStorage('assets/chapters/charlotte_ch3.pdf', 'chapters');

    //cs_lieu
    final chapter1Comic8Path = await _copyAssetToStorage('assets/chapters/cs_lieu_ch1.pdf', 'chapters');
    final chapter2Comic8Path = await _copyAssetToStorage('assets/chapters/cs_lieu_ch2.pdf', 'chapters');
    final chapter3Comic8Path = await _copyAssetToStorage('assets/chapters/cs_lieu_ch3.pdf', 'chapters');

    //my_cute_deskmate
    final chapter1Comic9Path = await _copyAssetToStorage('assets/chapters/my_cute_deskmate_ch1.pdf', 'chapters');
    final chapter2Comic9Path = await _copyAssetToStorage('assets/chapters/my_cute_deskmate_ch2.pdf', 'chapters');
    final chapter3Comic9Path = await _copyAssetToStorage('assets/chapters/my_cute_deskmate_ch3.pdf', 'chapters');

    //st_hoc_vien
    final chapter1Comic10Path = await _copyAssetToStorage('assets/chapters/st_hoc_vien_ch1.pdf', 'chapters');
    final chapter2Comic10Path = await _copyAssetToStorage('assets/chapters/st_hoc_vien_ch2.pdf', 'chapters');
    final chapter3Comic10Path = await _copyAssetToStorage('assets/chapters/st_hoc_vien_ch3.pdf', 'chapters');



  //thêm dữ liệu mẫu vào bảng
    int comic1Id = await dbHelper.insertComic(Comic(
      id: 0,
      title: "One Piece",
      thumbnailPath: thumbnail1Path,
      category: "Hành động",
      isFavorite: true,
    ));

    int comic2Id = await dbHelper.insertComic(Comic(
      id: 1,
      title: "Naruto",
      thumbnailPath: thumbnail2Path,
      category: "Phiêu lưu"
    ));

    int comic3Id = await dbHelper.insertComic(Comic(
      id: 2,
      title: "Attack on Titan",
      thumbnailPath: thumbnail3Path,
      category: "Kinh dị",
      isFavorite: true,
    ));

    int comic4Id = await dbHelper.insertComic(Comic(
      id: 3,
      title: "Demon Slayer",
      thumbnailPath: thumbnail4Path,
      category: "Hành động",
    ));

    int comic5Id = await dbHelper.insertComic(Comic(
      id: 4,
      title: "Overlord",
      thumbnailPath: thumbnail5Path,
      category: "Phiêu lưu",
    ));

    int comic6Id = await dbHelper.insertComic(Comic(
      id: 5,
      title: "Boruto",
      thumbnailPath: thumbnail6Path,
      category: "Hành động",
    ));

    int comic7Id = await dbHelper.insertComic(Comic(
      id: 6,
      title: "Charlotte",
      thumbnailPath: thumbnail7Path,
      category: "hành động",
    ));

    int comic8Id = await dbHelper.insertComic(Comic(
      id: 7,
      title: "Chuyển Sinh Thành Liễu Đột Biến",
      thumbnailPath: thumbnail8Path,
      category: "Phiêu lưu",
    ));

    int comic9Id = await dbHelper.insertComic(Comic(
      id: 8,
      title: "My Cute Deskmate",
      thumbnailPath: thumbnail9Path,
      category: "Phiêu lưu",
    ));

    int comic10Id = await dbHelper.insertComic(Comic(
      id: 9,
      title: "Hướng dẫn sinh tồn trong học viện",
      thumbnailPath: thumbnail10Path,
      category: "hành động",
    ));


    //thêm dữ liệu mẫu vào bảng chapters
    //one piece
    await dbHelper.insertChapter(Chapter(id: 0, comicId: comic1Id, chapterNumber: 1, chapterPath: chapter1Comic1Path));
    await dbHelper.insertChapter(Chapter(id: 1, comicId: comic1Id, chapterNumber: 2, chapterPath: chapter2Comic1Path));
    await dbHelper.insertChapter(Chapter(id: 2, comicId: comic1Id, chapterNumber: 3, chapterPath: chapter3Comic1Path));
    await dbHelper.insertChapter(Chapter(id: 3, comicId: comic1Id, chapterNumber: 4, chapterPath: chapter4Comic1Path));
    await dbHelper.insertChapter(Chapter(id: 4, comicId: comic1Id, chapterNumber: 5, chapterPath: chapter5Comic1Path));

    //naruto
    await dbHelper.insertChapter(Chapter(id: 5, comicId: comic2Id, chapterNumber: 1, chapterPath: chapter1Comic2Path));
    await dbHelper.insertChapter(Chapter(id: 6, comicId: comic2Id, chapterNumber: 2, chapterPath: chapter2Comic2Path));
    await dbHelper.insertChapter(Chapter(id: 7, comicId: comic2Id, chapterNumber: 3, chapterPath: chapter3Comic2Path));
    await dbHelper.insertChapter(Chapter(id: 8, comicId: comic2Id, chapterNumber: 4, chapterPath: chapter4Comic2Path));
    await dbHelper.insertChapter(Chapter(id: 9, comicId: comic2Id, chapterNumber: 5, chapterPath: chapter5Comic2Path));

    //attack on titan
    await dbHelper.insertChapter(Chapter(id: 10, comicId: comic3Id, chapterNumber: 1, chapterPath: chapter1Comic3Path));
    await dbHelper.insertChapter(Chapter(id: 11, comicId: comic3Id, chapterNumber: 2, chapterPath: chapter2Comic3Path));
    await dbHelper.insertChapter(Chapter(id: 12, comicId: comic3Id, chapterNumber: 3, chapterPath: chapter3Comic3Path));

    //demon slayer
    await dbHelper.insertChapter(Chapter(id: 13, comicId: comic4Id, chapterNumber: 1, chapterPath: chapter1Comic4Path));
    await dbHelper.insertChapter(Chapter(id: 14, comicId: comic4Id, chapterNumber: 2, chapterPath: chapter2Comic4Path));
    await dbHelper.insertChapter(Chapter(id: 15, comicId: comic4Id, chapterNumber: 3, chapterPath: chapter3Comic4Path));

    //overlord
    await dbHelper.insertChapter(Chapter(id: 16, comicId: comic5Id, chapterNumber: 1, chapterPath: chapter1Comic5Path));
    await dbHelper.insertChapter(Chapter(id: 17, comicId: comic5Id, chapterNumber: 2, chapterPath: chapter2Comic5Path));
    await dbHelper.insertChapter(Chapter(id: 18, comicId: comic5Id, chapterNumber: 3, chapterPath: chapter3Comic5Path));

    //boruto
    await dbHelper.insertChapter(Chapter(id: 19, comicId: comic6Id, chapterNumber: 1, chapterPath: chapter1Comic6Path));
    await dbHelper.insertChapter(Chapter(id: 20, comicId: comic6Id, chapterNumber: 2, chapterPath: chapter2Comic6Path));
    await dbHelper.insertChapter(Chapter(id: 21, comicId: comic6Id, chapterNumber: 3, chapterPath: chapter3Comic6Path));

    //charlotte
    await dbHelper.insertChapter(Chapter(id: 22, comicId: comic7Id, chapterNumber: 1, chapterPath: chapter1Comic7Path));
    await dbHelper.insertChapter(Chapter(id: 23, comicId: comic7Id, chapterNumber: 2, chapterPath: chapter2Comic7Path));
    await dbHelper.insertChapter(Chapter(id: 24, comicId: comic7Id, chapterNumber: 3, chapterPath: chapter3Comic7Path));

    //cs_lieu
    await dbHelper.insertChapter(Chapter(id: 25, comicId: comic8Id, chapterNumber: 1, chapterPath: chapter1Comic8Path));
    await dbHelper.insertChapter(Chapter(id: 26, comicId: comic8Id, chapterNumber: 2, chapterPath: chapter2Comic8Path));
    await dbHelper.insertChapter(Chapter(id: 27, comicId: comic8Id, chapterNumber: 3, chapterPath: chapter3Comic8Path));

    //my_cute_deskmate
    await dbHelper.insertChapter(Chapter(id: 28, comicId: comic9Id, chapterNumber: 1, chapterPath: chapter1Comic9Path));
    await dbHelper.insertChapter(Chapter(id: 29, comicId: comic9Id, chapterNumber: 2, chapterPath: chapter2Comic9Path));
    await dbHelper.insertChapter(Chapter(id: 30, comicId: comic9Id, chapterNumber: 3, chapterPath: chapter3Comic9Path));

    //st_hoc_vien
    await dbHelper.insertChapter(Chapter(id: 31, comicId: comic10Id, chapterNumber: 1, chapterPath: chapter1Comic10Path));
    await dbHelper.insertChapter(Chapter(id: 32, comicId: comic10Id, chapterNumber: 2, chapterPath: chapter2Comic10Path));
    await dbHelper.insertChapter(Chapter(id: 33, comicId: comic10Id, chapterNumber: 3, chapterPath: chapter3Comic10Path));
  }

  // Hàm copy asset vào thư mục
  static Future<String> _copyAssetToStorage(String assetPath, String destinationFolder) async {
    try {
      final byteData = await rootBundle.load(assetPath);
      final bytes = byteData.buffer.asUint8List();
      final fileName = path.basename(assetPath);
      return await FileHelper.saveFile(bytes, destinationFolder, fileName);
    } catch (e) {
      print('Error copying asset $assetPath: $e');
      return '';
    }
  }
}
