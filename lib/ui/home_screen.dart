import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView( //nge custom scroll view nya mw gmn sii
            scrollDirection: Axis.horizontal,
            slivers: [
              SliverToBoxAdapter( //jembatan antar widget yg biasa ama yg luar biasahh trus digabung, inituh biar bisa di gerakin yagasi
                  child: Container( //nah ini widget biasa nihh, biar bisa berguna buat di skrol2 makanya masuk ke sliver to box adapter
                width: 50,
                height: 50,
                color: Colors.amber,
              )),
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                  child: Container(
                width: 50,
                height: 50,
                color: Colors.pink,
              )),
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
              ),
              
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
              ),
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Container(
                width: 50,
                height: 50,
                color: Colors.indigo,
              ),
              ),
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Container(
                width: 50,
                height: 50,
                color: Colors.indigo,
              ),
              ),
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Container(
                width: 50,
                height: 50,
                color: Colors.black,
              ),
              ),
            ],
          ),
      ),
    );
  }
}