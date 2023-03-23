import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../components/custom_title.dart';
import '../model/article_model.dart';
import 'dart:convert';

import 'package:http/http.dart';

import '../model/article_model.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller=ScrollController();
  ApiService client = ApiService();
  int page=0;
@override

void initState(){
  super.initState();
  controller.addListener(() {
    
  });
  setState(() {
      page++;
    });
}

@override
void dispose(){
  controller.dispose();
  super.dispose();
  
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),


      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
         
          if (snapshot.hasData) {
         
            List<Article>? articles = snapshot.data;
            return ListView.builder(
             
              itemCount: articles?.length,
              itemBuilder: (context, index) =>
                  customListTile(articles![index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

 
}

 class ApiService {
  static const limit=20;
  final endPointUrl =Uri.parse("http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5970f8946c434733b2382424c1ea3411?_limit=$limit&_page=$page");
  
  static get page => null;
      
  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
  
 }