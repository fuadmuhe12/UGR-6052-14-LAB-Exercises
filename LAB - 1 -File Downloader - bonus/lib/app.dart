import 'package:dio/dio.dart';
import 'package:async/async.dart';


Future<void> downloadFile(String url, String savePath) async {
  final dio = Dio();
  try {
    final response = await dio.download(
      url,
      savePath,
      onReceiveProgress: (received, total) {
        final progress = (received / total) * 100;
        print('Downloading $url: $progress%');
      },
    );
    print('Downloaded $url to $savePath');
  } on DioError catch (e) {
    print('Error downloading $url: ${e.message}');
  }
}


Future<void> downloadFiles(List<String> urls, String saveDir) async {
  final futures = urls.map((url) => downloadFile(url, '$saveDir/${Uri.parse(url).pathSegments.last}'));
  await Future.wait(futures);
}


void main() async {
  final urls = ['https://files-go.en.uptodown.com/android/download', 'https://ncert.nic.in/textbook/pdf/kech101.pdf'];
  final saveDir = '.download';
  await downloadFiles(urls, saveDir);

  print("`````````````````  the Downlads are are found in .Download folder ``````````````````````");
}


