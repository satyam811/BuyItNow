
import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.item});
  final Product item;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List size = ['XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL'];

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.5,
            child: Stack(
              children: [
                Image.network(
                  item.image,
                  height: height * .6,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: height * 0.04,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(42),
                          topRight: Radius.circular(42),
                        ),
                        color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40.0, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.favorite))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
                Text(
                  item.price.toString(),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              item.description,
              style: const TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: const Text(
              'Choose size',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: height * 0.07,
            child: StatefulBuilder(builder: (context, setState) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: size.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    // splashColor: Colors.black
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                      print('product Size: ${size[index]}');
                    },
                    child: Container(
                      height: height * 0.15,
                      width: width * 0.15,
                      margin: const EdgeInsets.only(right: 10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Colors.transparent
                              : const Color(0xffe7e7e7),
                          border: currentIndex == index
                              ? Border.all(
                                  width: 2.0,
                                  color: Colors.black.withOpacity(0.4))
                              : null,
                          borderRadius: BorderRadius.circular(60)),
                      child: Text(
                        size[index],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          SizedBox(
            height: height * 0.08,
          ),
          Center(
            child: InkWell(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const BasketScreen()));
              },
              child: Container(
                width: width * 0.5,
                height: height * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff23272c)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    Text(
                      'Add To Basket',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}



// Container(
//             padding: const EdgeInsets.only(left: 30),
//             height: 80,
//             width: double.infinity,
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: size.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 20.0),
//                     child: SizedBox(
//                       height: 500,
//                       child: Container(
//                           height: 65,
//                           width: 65,
//                           decoration: const BoxDecoration(
//                             color: Color(0xffe7e7e7),
//                             shape: BoxShape.circle,
//                           ),
//                           child: Center(
//                               child: Text(
//                             size[index],
//                             style: const TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ))),
//                     ),
//                   );
//                 }),
//           ),