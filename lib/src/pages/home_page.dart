import 'package:buss_app/src/pages/page_one.dart';
import 'package:buss_app/src/pages/page_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModelo(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModelo = Provider.of<_NavegacionModelo>(context);
    return PageView(
      controller: navegacionModelo.pageController,
      //physics: NeverScrollableScrollPhysics(),
      physics: BouncingScrollPhysics(),
      children: [PageOne(), PageTwo()],
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModelo = Provider.of<_NavegacionModelo>(context);
    return BottomNavigationBar(
        currentIndex: navegacionModelo.paginaActual,
        onTap: (indice) => {
              navegacionModelo.paginaActual = indice,
              print('$indice'),
            },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), label: 'otra pagina'),
        ]);
  }
}

class _NavegacionModelo with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;
  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
