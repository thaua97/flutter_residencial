import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Residencial Avenida', 
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Residencial Avenida'),
      ),
      body: _body(context),
    );
  }

  Column _body(BuildContext context) {
    return Column(
      children: <Widget>[
        _title(),
        _pictures(),
        _buttons(context)
      ],
    );
  }

  Container _title() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Center(
        child: Text(
          'Visita online',
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Container _pictures() {
    return Container(
        padding: EdgeInsets.all(16),
        height: 300,
        child: PageView(
          children: <Widget>[
            _picture('https://images.pexels.com/photos/356807/pexels-photo-356807.jpeg?crop=entropy&cs=srgb&dl=pexels-daniel-frank-356807.jpg&fit=crop&fm=jpg&h=426&w=640'),
            _picture('https://images.pexels.com/photos/356807/pexels-photo-356807.jpeg?crop=entropy&cs=srgb&dl=pexels-daniel-frank-356807.jpg&fit=crop&fm=jpg&h=426&w=640'),
          ],
        ));
  }

  Image _picture(String path) {
    return Image.network(
      path,
      fit: BoxFit.contain,
    );
  }

  _buttons(BuildContext context){
    return Column(
      children: <Widget> [
        _button('Casas com 2 ou 3 dorm.', _goPlants, context),
        _button('Mostra planos.', _goServices, context),
        _button('Registrar interesses.', _register, context),
      ],
    );
  }

  _button(String txt, Function screen, BuildContext context) {
    return Container(
      width: 380,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          txt,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold
          )
        ),
        onPressed: () => screen(context),
      ),
    );
  }

  _goPlants(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlantsView()),
    );
  }

  _goServices(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ServicesView()),
    );
  }

  _register(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterView()),
    );
  }
}

class PlantsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Casas com 2 ou 3 dorm.'),
      ),
      body: _content(context)
    );
  }

  _content(BuildContext context) {
    return Column(
      children: <Widget>[
        _housesCorosel(context),
        _routeBack(context)
      ],
    );
  }

  _housesCorosel(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 600,
      child: PageView(
        children: <Widget>[
          _house('https://plantasdecasas.com/storage/2016/09/Projetos-de-casas-315-1300-front-1-1-500x300.jpg', 'Parte frontal'),
          _house('https://i.pinimg.com/originals/58/ef/de/58efde7321623cf50e7cb6f6ae8c5bb6.jpg', 'Planta da casa de 2 dormitorios'),
          _house('https://www.plantapronta.com.br/projetos/129/01.jpg', 'Frente da casa'),
          _house('https://arkpad.com.br/wp-content/uploads/2020/06/planta-3-quatos-5.jpg', 'Planta da casa de 3 dormitorios'),
        ],
      )
    );
  }

  _house(img, txt) {
    return Column(
      children: <Widget>[
        _img(img),
        _desc(txt)
      ],
    );
  }
  _img(String path) {
    return Image.network(
      path,
      fit: BoxFit.contain,
    );
  }

  _desc(String text) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _routeBack(BuildContext context) {
    return RaisedButton(
      child: Text('Voltar'),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

class ServicesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planos estabelecidos'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Voltar'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar interesse'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Voltar'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}