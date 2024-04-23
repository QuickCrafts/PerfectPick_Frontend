import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:perfectpick_wa/presentation/colors.dart";
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";
import 'package:perfectpick_wa/presentation/widgets/cards/card_media.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class MediaList extends StatelessWidget {
  final AuthRepository authRepository;

  const MediaList({required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 830) {
          return DesktopMediaList(authRepository: authRepository);
        } else {
          return MobileMediaList(authRepository: authRepository);
        }
      },
    );
  }
}

class MobileMediaList extends StatelessWidget {
  final AuthRepository authRepository;

  const MobileMediaList({Key? key, required this.authRepository})
      : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      height: 752,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(),
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'chevron-left',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(230, 37, 167, 1),
                                          fontFamily: 'Font Awesome 6 Free',
                                          fontSize: 24,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Movies',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(230, 37, 167, 1),
                                          fontFamily: 'Noto Sans SC',
                                          fontSize: 24,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                        color: Color.fromRGBO(38, 6, 41, 1),
                                        border: Border.all(
                                          color:
                                              Color.fromRGBO(230, 37, 167, 1),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DesktopMediaList extends StatefulWidget  {
  final AuthRepository authRepository;

  DesktopMediaList({Key? key, required this.authRepository})
      : super(key: key);

  @override
  _DesktopMediaListState createState() => _DesktopMediaListState();
}
class _DesktopMediaListState extends State<DesktopMediaList> {

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - MediaQuery.of(context).size.width/2,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + MediaQuery.of(context).size.width/2,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  final ScrollController _scrollController = ScrollController();
  Widget build(context) {
    // final listBooks = mediaRepository.getBooks();
    const quantity = 10;
    const padding = 60.0;
    const booksList = [
      [
        {
          "id_book": "ET9kAAAAMAAJ",
          "author": "Marcos Roda, Roberto Rubiano Vargas, Taller La Huella",
          "genres": "Colombia",
          "pages": 120,
          "rating": null,
          "title": "Crónica de la fotografía en Colombia, 1841-1948",
          "year": 1983
        },
        {
          "id_book": "MV8_AAAAIAAJ",
          "author": "Luis Tejada",
          "genres": "null",
          "pages": 184,
          "rating": null,
          "title": "Libro de crónicas",
          "year": 1961
        },
        {
          "id_book": "HdYj2RqeGnoC",
          "author": "Darío Jaramillo Agudelo",
          "genres": "Language Arts & Disciplines",
          "pages": 642,
          "rating": null,
          "title": "Antología de crónica latinoamericana actual",
          "year": 2012
        },
        {
          "id_book": "shKIEAAAQBAJ",
          "author":
              "Juan Villoro, Leila Guerriero, Sabrina Duque, Jordi Costa, Alberto Fuguet, Alberto Salcedo Ramos, Eileen Truax, Juan Pablo Meneses, Juanita León, Cristian Alarcón, Marcela Turati, Edgardo Cozarinsky, Maye Primera, María Moreno, Julio Villanueva Chang, Juan Gabriel Vásquez, Fabrizio Mejía Madrid, Cristina Rivera Garza, Jaime Bedoya, Rodrigo Fresán, Mónica Baró, Guillem Martínez, Gabriela Wiener, Edgardo Rodríguez Juliá, Martín Caparrós",
          "genres": "Language Arts & Disciplines",
          "pages": 548,
          "rating": null,
          "title": "Mejor que ficción",
          "year": 2022
        },
        {
          "id_book": "j10vXjCK5v0C",
          "author": "Jesús Ferro Bayona, Jacques Gilard, Teresa de Cepeda",
          "genres": "Colombian literature",
          "pages": 411,
          "rating": null,
          "title": "Crónica",
          "year": 2010
        },
        {
          "id_book": "wqHeAAAACAAJ",
          "author": "Plaza & Janes Editories, S.A.",
          "genres": "null",
          "pages": 432,
          "rating": null,
          "title": "Cronica Siglo Xx",
          "year": 1990
        },
        {
          "id_book": "r89sAAAAMAAJ",
          "author": "Aníbal Noguera Mendoza",
          "genres": "Colombia",
          "pages": 542,
          "rating": null,
          "title": "Crónica grande del Río de la Magdalena",
          "year": 1980
        },
        {
          "id_book": "nlGjswEACAAJ",
          "author": "Manuel Bernal Rodríguez",
          "genres": "null",
          "pages": 174,
          "rating": null,
          "title": "La crónica periodística",
          "year": 1997
        },
        {
          "id_book": "LfYgOwAACAAJ",
          "author": "Rubén Darío",
          "genres": "Literary Collections",
          "pages": 252,
          "rating": null,
          "title": "Va a arder París--?",
          "year": 2008
        },
        {
          "id_book": "7L-5VO_kwWAC",
          "author": "Clarice Lispector",
          "genres": "Fiction",
          "pages": 228,
          "rating": null,
          "title": "Selected Cronicas",
          "year": 1996
        },
        {
          "id_book": "i0UAA5aV-4oC",
          "author": "Rosa Montero",
          "genres": "Fiction",
          "pages": 185,
          "rating": null,
          "title": "Crónica del desamor",
          "year": 2012
        },
        {
          "id_book": "qCDlswEACAAJ",
          "author": "null",
          "genres": "null",
          "pages": 1493,
          "rating": null,
          "title": "Crónica del siglo XX.",
          "year": 1994
        },
        {
          "id_book": "lUteAAAAcAAJ",
          "author": "Aníbal González",
          "genres": "Modernism (Literature)",
          "pages": 252,
          "rating": null,
          "title": "La crónica modernista hispanoamericana",
          "year": 1983
        },
        {
          "id_book": "SJouAAAAYAAJ",
          "author": "Mary Luz Vallejo Mejía",
          "genres": "Press",
          "pages": 456,
          "rating": null,
          "title": "A plomo herido",
          "year": 2006
        },
        {
          "id_book": "oY96AAAAMAAJ",
          "author": "Ignacio Arellano, Fermín del Pino",
          "genres": "History",
          "pages": 514,
          "rating": null,
          "title": "Lecturas y ediciones de crónicas de Indias",
          "year": 2004
        },
        {
          "id_book": "948RmsRxGxYC",
          "author": "Carlos Caballero Argáez",
          "genres": "Apertura economica - Colombia",
          "pages": 365,
          "rating": null,
          "title": "Memorias incompletas",
          "year": 2007
        },
        {
          "id_book": "fC5XPQAACAAJ",
          "author": "null",
          "genres": "History, Modern",
          "pages": 1455,
          "rating": null,
          "title": "Crónica del Siglo XX",
          "year": 1992
        },
        {
          "id_book": "ZECKzQEACAAJ",
          "author": "Enrique Posada Restrepo",
          "genres": "null",
          "pages": 252,
          "rating": null,
          "title": "Las Quebradas de Medellín",
          "year": 2020
        },
        {
          "id_book": "4_FcmwEACAAJ",
          "author": "Juan Manuel",
          "genres": "null",
          "pages": 256,
          "rating": null,
          "title": "Cronica Abreviada",
          "year": 2013
        },
        {
          "id_book": "gTHmAAAAMAAJ",
          "author": "Juan García Ponce",
          "genres": "Mexican literature",
          "pages": 556,
          "rating": null,
          "title": "Crónica de la intervención",
          "year": 1982
        },
        {
          "id_book": "J-9eAAAAMAAJ",
          "author": "Heriberto Fiorillo",
          "genres": "Authors, Colombian",
          "pages": 296,
          "rating": "5",
          "title": "La Cueva",
          "year": 2002
        },
        {
          "id_book": "Zx51AAAAMAAJ",
          "author": "Simón Valcárcel Martínez",
          "genres": "America",
          "pages": 556,
          "rating": null,
          "title":
              "Las crónicas de Indias como expresión y configuración de la mentalidad renacentista",
          "year": 1997
        },
        {
          "id_book": "Fqd6AAAAMAAJ",
          "author": "Carmelo Sáenz de Santa María",
          "genres": "Guatemala",
          "pages": 256,
          "rating": null,
          "title": "Historia de una historia",
          "year": 1984
        },
        {
          "id_book": "E0stAAAAYAAJ",
          "author": "Donaldo Alonso Donado Viloria",
          "genres": "Colombian newspapers",
          "pages": 204,
          "rating": null,
          "title": "Crónica anacrónica",
          "year": 2003
        },
        {
          "id_book": "n1ZkbkpI4N4C",
          "author": "José María Delgado Troya",
          "genres": "Indians of South America",
          "pages": 174,
          "rating": null,
          "title": "Crónica de los pastos",
          "year": 2004
        },
        {
          "id_book": "ItYSAQAAIAAJ",
          "author": "Juan Gossain",
          "genres": "Fiction",
          "pages": 454,
          "rating": null,
          "title": "Crónica del día",
          "year": 2003
        },
        {
          "id_book": "F-0QEAAAQBAJ",
          "author": "Javier Franco Altamar",
          "genres": "Language Arts & Disciplines",
          "pages": 231,
          "rating": null,
          "title": "El camino de la crónica",
          "year": 2020
        },
        {
          "id_book": "kbpFAAAAcAAJ",
          "author": "Florián de Ocampo",
          "genres": "Spain",
          "pages": 700,
          "rating": null,
          "title": "Los Çinco Libros Primeros dela Cronica general de España",
          "year": 1553
        },
        {
          "id_book": "rC91MwEACAAJ",
          "author": "null",
          "genres": "null",
          "pages": "null",
          "rating": null,
          "title": "Cronica de la medicina",
          "year": 1993
        },
        {
          "id_book": "cquhM0au3_QC",
          "author": "Roberto Sepa Flórez",
          "genres": "null",
          "pages": 100,
          "rating": null,
          "title":
              "Progenitores. Crónica de una familia e historia de una Nación",
          "year": 2005
        },
        {
          "id_book": "Pjs48djLX7MC",
          "author": "José Alejandro Castaño Hoyos",
          "genres": "Medellín (Colombia)",
          "pages": 127,
          "rating": "5",
          "title":
              "La isla de Morgan ; una crónica desde Las Cuevas de Medellin",
          "year": 2005
        },
        {
          "id_book": "bQ8_ckZEYDkC",
          "author": "Gabriel Garca̕ Mr̀quez",
          "genres": "null",
          "pages": 112,
          "rating": "4",
          "title": "Cronica de una muerte anunciada - Tapa dura",
          "year": 2005
        },
        {
          "id_book": "xzJjBgAAQBAJ",
          "author": "Gabriel García Márquez",
          "genres": "Fiction",
          "pages": 85,
          "rating": "3.5",
          "title": "Crónica de una muerte anunciada",
          "year": 2015
        },
        {
          "id_book": "cxgvAAAAYAAJ",
          "author": "Carlos Monsiváis",
          "genres": "Literary Collections",
          "pages": 564,
          "rating": null,
          "title": "A ustedes les consta",
          "year": 2006
        },
        {
          "id_book": "AYhxAQHUdCYC",
          "author": "Manuel Alvar Ezquerra",
          "genres": "America",
          "pages": 444,
          "rating": null,
          "title": "Vocabulario de indigenismos en las Crónicas de Indias",
          "year": 1997
        },
        {
          "id_book": "2Lc0AAAACAAJ",
          "author": "Plaza & Janés Editories, S.A.",
          "genres": "null",
          "pages": 2192,
          "rating": null,
          "title": "Cronica de la Humanidad",
          "year": 1990
        },
        {
          "id_book": "fyPsAAAAMAAJ",
          "author": "Concejo de Medellín",
          "genres": "Medellín (Colombia)",
          "pages": 422,
          "rating": null,
          "title": "Crónica municipal: Medellín",
          "year": 1966
        },
        {
          "id_book": "zSpSuwEACAAJ",
          "author": "Óscar Bustos",
          "genres": "Colombia",
          "pages": 219,
          "rating": null,
          "title": "Colombia crónica",
          "year": 2013
        },
        {
          "id_book": "kCKaAAAAIAAJ",
          "author": "Carolina Molina",
          "genres": "Narration (Rhetoric)",
          "pages": 268,
          "rating": null,
          "title": "Gabriel García Márquez",
          "year": 2006
        },
        {
          "id_book": "NUgYAAAAYAAJ",
          "author": "Carlos Lleras Restrepo",
          "genres": "Colombia",
          "pages": 504,
          "rating": null,
          "title": "Crónica de mi propia vida",
          "year": 1983
        }
      ]
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color:
            Color.fromRGBO(38, 6, 41, 0.5), // Updated color to match the image
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Tell us what you like ...',
                      style: TextStyle(
                          color: secondaryMain,
                          fontFamily: 'Noto Sans SC',
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Like or dislike at least three elements of each list. If you want, you can save them to your wishlist.",
                      style: TextStyle(
                          color: textInsideFieldColor,
                          fontFamily: 'Noto Sans SC',
                          fontSize: 20),
                      textAlign: TextAlign.left,
                    )
                  ],
                )),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Movies',
                        style: TextStyle(
                            color: activeColor,
                            fontFamily: 'Noto Sans SC',
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          IconButton(
                          onPressed: _scrollLeft,
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: primaryLight,
                            ),
                          padding: EdgeInsets.zero,
                        ),
                          SizedBox(
                            height: 300,
                            width: MediaQuery.of(context).size.width - 270,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              controller: _scrollController,
                              itemCount: quantity,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: CardMedia(
                                    userID: 1,
                                    mediaType: 'MOV',
                                    name:
                                        booksList[0][index]["title"] as String,
                                    genre:
                                        booksList[0][index]["genres"] as String,
                                    author:
                                        booksList[0][index]["author"] as String,
                                    mediaID: booksList[0][index]["id_book"]
                                        as String,
                                  ),
                                );
                              },
                            ),
                          ),
                          IconButton(
                          onPressed: _scrollRight,
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: primaryLight,
                            ),
                          padding: EdgeInsets.zero,
                        ),
                        ],
                      ),

                      Text(
                        'Songs',
                        style: TextStyle(
                            color: activeColor,
                            fontFamily: 'Noto Sans SC',
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: quantity,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: CardMedia(
                                userID: 1,
                                mediaType: 'SON',
                                name: "Title",
                                genre: "Genre",
                                author: "Author",
                                mediaID: "a",
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        'Books',
                        style: TextStyle(
                            color: activeColor,
                            fontFamily: 'Noto Sans SC',
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: quantity,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: CardMedia(
                                userID: 1,
                                mediaType: 'BOO',
                                name: "Title",
                                genre: "Genre",
                                author: "Author",
                                mediaID: "a",
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ]),
    );
  }
}
