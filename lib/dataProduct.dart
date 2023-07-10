import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application/Product.dart';

class DataProductPage extends StatefulWidget {
  const DataProductPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<DataProductPage> createState() => _DataProductState();
}

class _DataProductState extends State<DataProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(widget.product.codice,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontStyle: FontStyle.italic)),
                  ),
                  Text(widget.product.descrizione),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 110,
                            width: 50,
                            child: Text(
                              widget.product.ordinato.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            padding: const EdgeInsets.all(20),
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12))),
                            child: Text("Giacenza",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            padding: const EdgeInsets.only(left: 40, top: 10),
                          )
                        ],
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 110,
                            width: 50,
                            child: Text(
                              widget.product.ordinato.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            padding: const EdgeInsets.all(20),
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            decoration: const BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12))),
                            child: Text("Impegnato",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            padding: const EdgeInsets.only(left: 35, top: 10),
                          )
                        ],
                      ),
                    )),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 110,
                            width: 50,
                            child: Text(
                              widget.product.ordinato.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            padding: const EdgeInsets.all(20),
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12))),
                            child: Text("Disponibilità",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            padding: const EdgeInsets.only(left: 30, top: 10),
                          )
                        ],
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 110,
                            width: 50,
                            child: Text(
                              widget.product.ordinato.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            padding: const EdgeInsets.all(20),
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            decoration: const BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12))),
                            child: Text("Ordinato",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            padding: const EdgeInsets.only(left: 40, top: 10),
                          )
                        ],
                      ),
                    ))
              ])
            ],
          ),
        )

        // Column(
        //   children: <Widget>[
        //     Container(padding: EdgeInsets.only(right: 160),height: 30.0, child: Text(widget.product.codice,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25,fontStyle: FontStyle.italic))),
        //     Container(height: 40.0, child: Text(widget.product.descrizione)),
        //     Card(
        // color:Colors.red,
        // elevation: 15,

        // child: Container(
        //   padding: EdgeInsets.only(top: 15),
        //   width: 100,
        //   height: 100,
        //   child: Column(
        //     children: <Widget>[
        //       Text(widget.product.giacenza.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,fontStyle: FontStyle.italic)),
        //       const Text('Giacenza',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,fontStyle: FontStyle.italic))
        //     ],
        //   )

        //       )
        //     )
        //   ],
        // ),

        // child: Table(
        //   border: TableBorder.all(color: Colors.black),
        //   children: [
        //     TableRow(children: [
        //       const Text('Codice',style: TextStyle(fontWeight: FontWeight.bold),),
        //       Text(widget.product.codice),
        //     ]),
        //     TableRow(children: [
        //       const Text('Descrizione',style: TextStyle(fontWeight: FontWeight.bold),),
        //       Text(widget.product.descrizione),
        //     ]),
        //     TableRow(children: [
        //       const Text('Giacenza',style: TextStyle(fontWeight: FontWeight.bold),),
        //       Text(widget.product.giacenza.toString(),
        //       style: TextStyle(color: (widget.product.giacenza < 5) ? Colors.red : Colors.green)),
        //     ],),
        //     TableRow(children: [
        //       const Text('Impegnato',style: TextStyle(fontWeight: FontWeight.bold),),
        //       Text(widget.product.impegnato.toString(),
        //       style: TextStyle(color: (widget.product.giacenza < 5) ? Colors.red : Colors.green)),
        //     ],),
        //      TableRow(children: [
        //       const Text('Disponibilità',style: TextStyle(fontWeight: FontWeight.bold),),
        //       Text(widget.product.disponibilita.toString(),
        //       style: TextStyle(color: (widget.product.giacenza < 5) ? Colors.red : Colors.green)),
        //     ],),
        //      TableRow(children: [
        //       const Text('Ordinato',style: TextStyle(fontWeight: FontWeight.bold),),
        //       Text(widget.product.ordinato.toString(),
        //       style: TextStyle(color: (widget.product.giacenza < 5) ? Colors.red : Colors.green)),
        //     ],),
        //   ],
        // ),

        );
  }
}
