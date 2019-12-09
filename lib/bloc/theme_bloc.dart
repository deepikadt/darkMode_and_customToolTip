import 'dart:async';

class ThemeBloc 
{
  StreamController<bool> _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;

  void dispose(){

  }
}