import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  var _product;
  ProductDetails(this._product);

  // const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Future addToCart() async{
    final FirebaseAuth _auth=FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _cullectionRef=FirebaseFirestore.instance.collection("users-cart-items");
    return _cullectionRef.doc(currentUser!.email).collection("items").doc().set(
        {
          "name":widget._product["product-name"],
          "price":widget._product["product-price"],
          "images":widget._product["product-img"],

        }).then((value) => print("Added to Cart"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.pink,
            child: IconButton(onPressed: ()=>Navigator.pop(context),icon: Icon(Icons.arrow_back,color: Colors.white,),),
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.pink,
            child: IconButton(onPressed: ()=>Navigator.pop(context),icon: Icon(Icons.fifteen_mp,color: Colors.white,),),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 13,right: 13,top: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                  aspectRatio: 3.5,
                  child: CarouselSlider(
                    items: widget._product['product-img']
                        .map<Widget>((item) => Padding(
                      padding: const EdgeInsets.only(left: 3, right: 3),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(item),
                              fit: BoxFit.fitWidth),
                        ),
                      ),
                    ))
                        .toList(),
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (val, carouselPageChangeReaon) {
                          setState(() {
                            // _dotPosition = val;
                          });
                        }),
                  )),
              Text(widget._product['product-name']),
              Text(widget._product['product-description']),
              Text(widget._product['product-price']),
              SizedBox(
                width: 1.sw,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: (){
                    addToCart();

                  },
                  child: Text('Add to Card',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),

                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
