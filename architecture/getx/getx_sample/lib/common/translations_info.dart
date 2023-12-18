import 'package:get/get.dart';

class TranslationsInfo extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'ko': ko,
  };

  final Map<String, String> enUS = {
    'title': 'Flutter GetX',
    'title.post': 'Post',
    'title.post.detail': 'Post Detail',
    'title.photo': 'Photo',
    'error.title': 'Error',
    'error.info': 'Info',
    'error.try': 'Please try again',
    'navBar.home' : 'Home',
    'navBar.post' : 'Post',
    'navBar.photo' : 'Photo',
    'home.card.1' : 'Build apps for any screen',
    'home.card.2' : 'Build and iterate quickly with Hot Reload. Update code and see changes almost instantly, without losing state.',
    'home.card.3' : 'Control every pixel to create customized, adaptive designs that look and feel great on any screen.',
    'btn.close' : 'Close',
    'drawer.head' : 'Flutter',
    'drawer.profile' : 'Profile',
    'drawer.message' : 'Messages',
    'drawer.setting' : 'Settings',
    'drawer.login' : 'Sign in',
  };

  final Map<String, String> ko = {
    'title': '플러터 GetX',
    'title.post': '포스트',
    'title.post.detail': '포스트 상세보기',
    'title.photo': '사진',
    'error.title': '에러',
    'error.info': '안내',
    'error.try': '다시 시도해 주세요',
    'navBar.home' : '홈',
    'navBar.post' : '포스트',
    'navBar.photo' : '사진',
    'home.card.1' : 'Build apps for any screen',
    'home.card.2' : 'Build and iterate quickly with Hot Reload. Update code and see changes almost instantly, without losing state.',
    'home.card.3' : 'Control every pixel to create customized, adaptive designs that look and feel great on any screen.',
    'btn.close' : '닫기',
    'drawer.head' : '플러',
    'drawer.profile' : '프로필',
    'drawer.message' : '메세지',
    'drawer.setting' : '설정',
    'drawer.login' : '로그인',
  };
}