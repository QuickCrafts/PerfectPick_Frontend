import 'dart:async';

import 'package:flutter/material.dart';
import 'package:perfectpick_wa/data/data_providers/client_declarator.dart';
import 'package:perfectpick_wa/data/models/media/media_models.dart';
import "package:perfectpick_wa/presentation/colors.dart";
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";
import 'package:perfectpick_wa/data/repositories/media/media_repository.dart';
import 'package:perfectpick_wa/presentation/widgets/cards/card_media.dart';

class MediaList extends StatelessWidget {
  final AuthRepository authRepository;
  final MediaRepository mediaRepository =
      MediaRepository(client: graphqlClient.value);

  MediaList({Key? key, required this.authRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (MediaQuery.of(context).size.width > 1000) {
          return DesktopMediaList(
              authRepository: authRepository, mediaRepository: mediaRepository);
        } else {
          return MobileMediaList(
              authRepository: authRepository, mediaRepository: mediaRepository);
        }
      },
    );
  }
}

const quantity = 10;
const paddingMovil = 15.0;
const paddingDesktop = 40.0;
const distance = 5.0;

class MobileMediaList extends StatefulWidget {
  final AuthRepository authRepository;
  final MediaRepository mediaRepository;

  MobileMediaList(
      {Key? key, required this.authRepository, required this.mediaRepository})
      : super(key: key);
  @override
  MobileMediaListState createState() =>
      MobileMediaListState(authRepository, mediaRepository);
}

class MobileMediaListState extends State<MobileMediaList> {
  final AuthRepository authRepository;
  final MediaRepository mediaRepository;

  MobileMediaListState(this.authRepository, this.mediaRepository);
  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.symmetric(horizontal: paddingMovil),
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
                  padding: EdgeInsets.symmetric(horizontal: paddingMovil),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
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
                      FutureBuilder<List<BooksModel>>(
                          future: _fetchDataBooks(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else {
                              return Row(
                                children: [
                                  IconButton(
                                    onPressed: _scrollLeftBooks,
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: primaryLight,
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                  SizedBox(
                                    height: 300,
                                    width:
                                        MediaQuery.of(context).size.width - (80+paddingMovil*2),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      controller: _scrollControllerBooks,
                                      itemCount: quantity,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: distance),
                                          child: CardMedia(
                                            userID: 1,
                                            mediaType: "BOO",
                                            name: snapshot.data?[index].title ??
                                                "Null",
                                            genre:
                                                snapshot.data?[index].genres ??
                                                    "Null",
                                            author:
                                                snapshot.data?[index].author ??
                                                    "Null",
                                            mediaID:
                                                snapshot.data?[index].id_book ??
                                                    "Null",
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: _scrollRightBooks,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: primaryLight,
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                ],
                              );
                            }
                          }),
                      SizedBox(height: 30),
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
                      FutureBuilder<List<SongsModel>>(
                          future: _fetchDataSongs(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else {
                              return Row(
                                children: [
                                  IconButton(
                                    onPressed: _scrollLeftSongs,
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: primaryLight,
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                  SizedBox(
                                    height: 300,
                                    width:
                                        MediaQuery.of(context).size.width - (80+paddingMovil*2),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      controller: _scrollControllerSongs,
                                      itemCount: quantity,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: distance),
                                          child: CardMedia(
                                            userID: 1,
                                            mediaType: "SON",
                                            name: snapshot.data?[index].title ??
                                                "Null",
                                            genre:
                                                snapshot.data?[index].genres ??
                                                    "Null",
                                            author:
                                                snapshot.data?[index].artist ??
                                                    "Null",
                                            mediaID:
                                                snapshot.data?[index].idSong ??
                                                    "Null",
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: _scrollRightSongs,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: primaryLight,
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                ],
                              );
                            }
                          }),
                      SizedBox(height: 30),
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
                      FutureBuilder<List<MoviesModel>>(
                          future: _fetchDataMovies(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else {
                              return Row(
                                children: [
                                  IconButton(
                                    onPressed: _scrollLeftMovies,
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: primaryLight,
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                  SizedBox(
                                    height: 300,
                                    width:
                                        MediaQuery.of(context).size.width - (80+paddingMovil*2),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      controller: _scrollControllerMovies,
                                      itemCount: quantity,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: distance),
                                          child: CardMedia(
                                            userID: 1,
                                            mediaType: snapshot
                                                    .data?[index].typename ??
                                                "Null",
                                            name: snapshot.data?[index].title ??
                                                "Null",
                                            genre:
                                                snapshot.data?[index].genre ??
                                                    "Null",
                                            author:
                                                snapshot.data?[index].writers ??
                                                    "Null",
                                            mediaID:
                                                snapshot.data?[index].idMovie ??
                                                    "Null",
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: _scrollRightMovies,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: primaryLight,
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                ],
                              );
                            }
                          }),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Future<List<BooksModel>> _fetchDataBooks() async {
    Future<List<BooksModel>> listBooksAsync = mediaRepository.getBooks();
    List<BooksModel> listBooks = await listBooksAsync;
    return listBooks;
  }

  Future<List<SongsModel>> _fetchDataSongs() async {
    Future<List<SongsModel>> listSongsAsync = mediaRepository.getSongs();
    List<SongsModel> listSongs = await listSongsAsync;
    return listSongs;
  }

  Future<List<MoviesModel>> _fetchDataMovies() async {
    Future<List<MoviesModel>> listMoviesAsync = mediaRepository.getMovies();
    List<MoviesModel> listMovies = await listMoviesAsync;
    return listMovies;
  }

  final ScrollController _scrollControllerBooks = ScrollController();
  final ScrollController _scrollControllerSongs = ScrollController();
  final ScrollController _scrollControllerMovies = ScrollController();

  void _scrollLeftBooks() {
    _scrollControllerBooks.animateTo(
      _scrollControllerBooks.offset - MediaQuery.of(context).size.width / 2,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollRightBooks() {
    _scrollControllerBooks.animateTo(
      _scrollControllerBooks.offset + MediaQuery.of(context).size.width / 2,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollLeftSongs() {
    _scrollControllerSongs.animateTo(
      _scrollControllerSongs.offset - MediaQuery.of(context).size.width / 2,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollRightSongs() {
    _scrollControllerSongs.animateTo(
      _scrollControllerSongs.offset + MediaQuery.of(context).size.width / 2,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollLeftMovies() {
    _scrollControllerMovies.animateTo(
      _scrollControllerMovies.offset - MediaQuery.of(context).size.width / 2,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollRightMovies() {
    _scrollControllerMovies.animateTo(
      _scrollControllerMovies.offset + MediaQuery.of(context).size.width / 2,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}

class DesktopMediaList extends StatefulWidget {
  final AuthRepository authRepository;
  final MediaRepository mediaRepository;

  DesktopMediaList(
      {Key? key, required this.authRepository, required this.mediaRepository})
      : super(key: key);
  @override
  DesktopMediaListState createState() =>
      DesktopMediaListState(authRepository, mediaRepository);
}

class DesktopMediaListState extends State<DesktopMediaList> {
  final AuthRepository authRepository;
  final MediaRepository mediaRepository;

  DesktopMediaListState(this.authRepository, this.mediaRepository);

  @override
  Widget build(context) {
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
              padding: EdgeInsets.symmetric(horizontal: paddingDesktop),
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
                  padding: EdgeInsets.symmetric(horizontal: paddingDesktop),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
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
                      FutureBuilder<List<BooksModel>>(
                          future: _fetchDataBooks(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else {
                              return Row(
                                children: [
                                  IconButton(
                                    onPressed: _scrollLeftBooks,
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: primaryLight,
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                  SizedBox(
                                    height: 300,
                                    width:
                                        MediaQuery.of(context).size.width - (480+paddingDesktop*2),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      controller: _scrollControllerBooks,
                                      itemCount: quantity,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: distance),
                                          child: CardMedia(
                                            userID: 1,
                                            mediaType: "BOO",
                                            name: snapshot.data?[index].title ??
                                                "Null",
                                            genre:
                                                snapshot.data?[index].genres ??
                                                    "Null",
                                            author:
                                                snapshot.data?[index].author ??
                                                    "Null",
                                            mediaID:
                                                snapshot.data?[index].id_book ??
                                                    "Null",
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: _scrollRightBooks,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: primaryLight,
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                ],
                              );
                            }
                          }),
                      SizedBox(height: 30),
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
                      FutureBuilder<List<SongsModel>>(
                          future: _fetchDataSongs(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else {
                              return Row(
                                children: [
                                  IconButton(
                                    onPressed: _scrollLeftSongs,
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: primaryLight,
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                  SizedBox(
                                    height: 300,
                                    width:
                                        MediaQuery.of(context).size.width - (480+paddingDesktop*2),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      controller: _scrollControllerSongs,
                                      itemCount: quantity,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: distance),
                                          child: CardMedia(
                                            userID: 1,
                                            mediaType: "SON",
                                            name: snapshot.data?[index].title ??
                                                "Null",
                                            genre:
                                                snapshot.data?[index].genres ??
                                                    "Null",
                                            author:
                                                snapshot.data?[index].artist ??
                                                    "Null",
                                            mediaID:
                                                snapshot.data?[index].idSong ??
                                                    "Null",
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: _scrollRightSongs,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: primaryLight,
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                ],
                              );
                            }
                          }),
                      SizedBox(height: 30),
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
                      FutureBuilder<List<MoviesModel>>(
                          future: _fetchDataMovies(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else {
                              return Row(
                                children: [
                                  IconButton(
                                    onPressed: _scrollLeftMovies,
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: primaryLight,
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                  SizedBox(
                                    height: 300,
                                    width:
                                        MediaQuery.of(context).size.width - (480+paddingDesktop*2),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      controller: _scrollControllerMovies,
                                      itemCount: quantity,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: distance),
                                          child: CardMedia(
                                            userID: 1,
                                            mediaType: snapshot
                                                    .data?[index].typename ??
                                                "Null",
                                            name: snapshot.data?[index].title ??
                                                "Null",
                                            genre:
                                                snapshot.data?[index].genre ??
                                                    "Null",
                                            author:
                                                snapshot.data?[index].writers ??
                                                    "Null",
                                            mediaID:
                                                snapshot.data?[index].idMovie ??
                                                    "Null",
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: _scrollRightMovies,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: primaryLight,
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                ],
                              );
                            }
                          }),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Future<List<BooksModel>> _fetchDataBooks() async {
    Future<List<BooksModel>> listBooksAsync = mediaRepository.getBooks();
    List<BooksModel> listBooks = await listBooksAsync;
    return listBooks;
  }

  Future<List<SongsModel>> _fetchDataSongs() async {
    Future<List<SongsModel>> listSongsAsync = mediaRepository.getSongs();
    List<SongsModel> listSongs = await listSongsAsync;
    return listSongs;
  }

  Future<List<MoviesModel>> _fetchDataMovies() async {
    Future<List<MoviesModel>> listMoviesAsync = mediaRepository.getMovies();
    List<MoviesModel> listMovies = await listMoviesAsync;
    return listMovies;
  }

  final ScrollController _scrollControllerBooks = ScrollController();
  final ScrollController _scrollControllerSongs = ScrollController();
  final ScrollController _scrollControllerMovies = ScrollController();

  void _scrollLeftBooks() {
    _scrollControllerBooks.animateTo(
      _scrollControllerBooks.offset - MediaQuery.of(context).size.width / 2,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollRightBooks() {
    _scrollControllerBooks.animateTo(
      _scrollControllerBooks.offset + MediaQuery.of(context).size.width / 2,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollLeftSongs() {
    _scrollControllerSongs.animateTo(
      _scrollControllerSongs.offset - MediaQuery.of(context).size.width / 2,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollRightSongs() {
    _scrollControllerSongs.animateTo(
      _scrollControllerSongs.offset + MediaQuery.of(context).size.width / 2,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollLeftMovies() {
    _scrollControllerMovies.animateTo(
      _scrollControllerMovies.offset - MediaQuery.of(context).size.width / 2,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollRightMovies() {
    _scrollControllerMovies.animateTo(
      _scrollControllerMovies.offset + MediaQuery.of(context).size.width / 2,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
