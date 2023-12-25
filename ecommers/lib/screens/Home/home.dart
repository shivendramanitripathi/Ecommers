import 'package:ecommers/firebase_firestore_helper/FireStore_Helper.dart';
import 'package:ecommers/screens/addtocart/add_to_cart.dart';
import 'package:ecommers/widget/top_titles.dart';
import 'package:flutter/material.dart';
import '../../constants/routes.dart';
import '../../models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> productList = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  void getProductList() async {
    setState(() {
      isLoading = true;
    });
    productList = await FireStoreHelper.instance.getProduct();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TopTitles(
                          heading: 'Home', tittle: 'E-commerce App'),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.search_sharp,
                          ),
                          hintText: 'Search....',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        child: Text(
                          'Categories',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: productList
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Image.network(e.image,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      const Text(
                        'Best Product',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          itemCount: bestProduct.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            ProductModel productModel = bestProduct[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Routes.instance.push(
                                        ViewItem(
                                            figure: productModel.image,
                                            des: productModel.description,
                                            price: productModel.price,
                                            id: productModel.id),
                                        context,
                                      );
                                    },
                                    child: SizedBox(
                                      height: 70,
                                      width: 120,
                                      child: Image.network(
                                        productModel.image,
                                        scale: 10,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    productModel.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  Text("Price: ₹${productModel.price}"),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade300,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Center(child: Text('Buy')),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}

List<ProductModel> bestProduct = [
  ProductModel(
      image:
          "https://media.istockphoto.com/id/173242750/photo/banana-bunch.jpg?s=2048x2048&w=is&k=20&c=zjbSwVloGR-ZdlXwRfuLZ2mwfk9uKZtDCwR8fMaOt00=",
      id: '1',
      name: "Banana",
      status: "pending",
      price: "19",
      description: "Good For Digestion",
      isFavorite: false),
  ProductModel(
      image:
          "https://media.istockphoto.com/id/185262648/photo/red-apple-with-leaf-isolated-on-white-background.jpg?s=2048x2048&w=is&k=20&c=wWka8QFPvCD0v3NURih3djUNozIec0KvFiPYeIdBv2w=",
      id: '3',
      name: "Apple",
      status: "",
      price: "39",
      description: "Good for Health",
      isFavorite: false),
  ProductModel(
      image:
          "https://as2.ftcdn.net/v2/jpg/05/14/94/51/1000_F_514945133_2Fo0kZwhqh8kqlXeoY7ZShQ6ev123QMx.jpg",
      id: '3',
      name: "Papaya",
      status: "",
      price: "30",
      description: "Good for Skin",
      isFavorite: false),
];
