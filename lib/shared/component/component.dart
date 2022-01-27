import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter/widgets.dart";
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/modules/webview/web_view_screen.dart';
import "package:flutter/painting.dart";
import 'package:news_app/shared/appcubit/appcubit.dart';

Widget ArticleItem(article, context) => InkWell(
      onTap: () {
        navigatoTo(context, WebViewScreen("${article['url']}"));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage("${article['urlToImage']}"),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text("${article['title']}",
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      "${article['publishedAt']}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget myDivider() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );

Widget ListArticleItems(list, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => ArticleItem(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length),
      fallback: (context) => isSearch
          ? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                    height: 5.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.teal),
                  ),
                 const   SizedBox(height: 30.0),
                    Container(
                      height: 4.0,
                      width: 120.0,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey),
                    ),
                    const   SizedBox(height: 30.0),
                    Container(
                      height: 4.0,
                      width: 120.0,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey),
                    ),
                ]))
          : const Center(child: CircularProgressIndicator()),
    );

void navigatoTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Widget defaultTextFormField({
  required context,
  required TextEditingController controller,
  required TextInputType type,
  String? Function(String? val)? onsubmit,
  String? Function(String val)? onchange,
  bool isPassword = false,
  required String? Function(String? val)? validate,
  required String label,
  // required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  // Function? ontap,
  // bool ?autofocus,
}) {
  bool dark = AppCubit.get(context).isDark;
  return TextFormField(
    // autofocus: true,
    controller: controller,
    obscureText: isPassword,
    keyboardType: type,
    onFieldSubmitted: onsubmit,
    onChanged: onchange,
    validator: validate,
    /*   onTap: () {
        ontap!();
      },*/
    style: Theme.of(context).textTheme.bodyText2,
    decoration: InputDecoration(
      filled: true,
      fillColor: dark ? Colors.white : Colors.grey[100],
      hintText: label,
      hintStyle: Theme.of(context).textTheme.bodyText2,
      enabledBorder: dark
          ? OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.0))
          : OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.0)),

      focusedBorder: dark
          ? OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            )
          : OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white54, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),

    ),
  );
}
