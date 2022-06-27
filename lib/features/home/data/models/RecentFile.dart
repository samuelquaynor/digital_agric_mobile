class RecentFile {
  RecentFile({this.icon, this.title, this.date, this.size});
  final String? icon, title, date, size;
}

List<RecentFile> demoRecentFiles = [
  RecentFile(
    icon: 'assets/svg/xd_file.svg',
    title: 'Accra',
    date: '01-03-2021',
    size: '31°C',
  ),
  RecentFile(
    icon: 'assets/svg/Figma_file.svg',
    title: 'Kumasi',
    date: '27-02-2021',
    size: '31.5°C',
  ),
  RecentFile(
    icon: 'assets/svg/doc_file.svg',
    title: 'Obuasi',
    date: '23-02-2021',
    size: '32°C',
  ),
  RecentFile(
    icon: 'assets/svg/sound_file.svg',
    title: 'Tamale',
    date: '21-02-2021',
    size: '33°C',
  ),
  RecentFile(
    icon: 'assets/svg/media_file.svg',
    title: 'CapeCoast',
    date: '23-02-2021',
    size: '29°C',
  ),
  RecentFile(
    icon: 'assets/svg/pdf_file.svg',
    title: 'Takoradi',
    date: '25-02-2021',
    size: '31°C',
  ),
  RecentFile(
    icon: 'assets/svg/excle_file.svg',
    title: 'Sunyani',
    date: '25-02-2021',
    size: '30°C',
  ),
];
