import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/category_model.dart';
import '../models/user_model.dart';
import '../services/firebase_service.dart';

class CategoryRepository{
  CollectionReference<CategoryModel> categoryRef = FirebaseService.db.collection("categories")
      .withConverter<CategoryModel>(
    fromFirestore: (snapshot, _) {
      return CategoryModel.fromFirebaseSnapshot(snapshot);
    },
    toFirestore: (model, _) => model.toJson(),
  );
    Future<List<QueryDocumentSnapshot<CategoryModel>>> getCategories() async {
    try {
      var data = await categoryRef.get();
      bool hasData = data.docs.isNotEmpty;
      if(!hasData){
        makeCategory().forEach((element) async {
          await categoryRef.add(element);
        });
      }
      final response = await categoryRef.get();
      var category = response.docs;
      return category;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  List<CategoryModel> makeCategory(){
      return [
        CategoryModel(categoryName: "Phones & iPhone", status: "active", imageUrl:
        "https://imgs.search.brave.com/J854tfOUz26itnedzZ2W_FxAjVtG7g_o1Stw6mRzgiA/rs:fit:1200:867:1/g:ce/aHR0cHM6Ly9jZG4u/d2NjZnRlY2guY29t/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDIx/LzA0L2lQaG9uZS0x/My1Qcm8tMS5qcGc.jpg"),
        CategoryModel(categoryName: "Cameras", status: "active", imageUrl:
        "https://imgs.search.brave.com/V582_Lr3e_cwT2Sr__cn8m0xLLWQ8CLNRtxbqfOF4B0/rs:fit:1200:1000:1/g:ce/aHR0cHM6Ly9zdGF0/aWMwLmNicmltYWdl/cy5jb20vd29yZHBy/ZXNzL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDIxLzAxL0Jlc3Qt/Tmlrb24tQ2FtZXJh/LWUxNjA5ODA0NDIw/NzI0LmpwZw.jpg"),
        CategoryModel(categoryName: "Laptops & Desktops", status: "active",
            imageUrl:"https://imgs.search.brave.com/xp9PlUYjBeHvnaze3pHy8WzciNBmg_M2GasWMBDEzV8/rs:fit:1021:580:1/g:ce/aHR0cDovL21hY3dh/eS5jby56YS93cC1j/b250ZW50L3VwbG9h/ZHMvMjAyMC8wMy9i/MWM5ZjRfZWE0MDUy/ZTY1ZGMyNGJlYmEy/ZDdiMzEyY2FmYWIy/N2VfbXYyLmpwZw.jpg"),
        CategoryModel(categoryName: "Apple", status: "active", imageUrl:
        "https://imgs.search.brave.com/v4r7rzpkVt8EVIsgxkRnOvnCl3CbJN8rNre_f_va2sQ/rs:fit:772:422:1/g:ce/aHR0cHM6Ly93d3cu/aG93dG9pc29sdmUu/Y29tL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDE2LzA3LzItQXBw/bGUtRGV2aWNlcy1m/b3ItQnV5LW9uLVBy/aW1lLWRheS5qcGc.jpg"),
            CategoryModel(categoryName: "Sound System", status: "active", imageUrl:
        "https://imgs.search.brave.com/5MeAppY13bF7-POPmQNhtThAPTGbh_UDga0z8TToTog/rs:fit:860:534:1/g:ce/aHR0cHM6Ly93d3cu/YWNxdWlyZW1hZy5j/b20vLmltYWdlL2Nf/bGltaXQlMkNjc19z/cmdiJTJDZmxfcHJv/Z3Jlc3NpdmUlMkNx/X2F1dG86Z29vZCUy/Q3dfODYwL01UYzRN/VGt6TmpVd01UQTVN/emt5TkRrei90Y2wy/MDIxdHYuanBn.jpg"),
        CategoryModel(categoryName: "Games & Accessories", status: "active", imageUrl:
        "https://imgs.search.brave.com/b9I5JpNwgL9j4NWYMhZ0-cImHrzL0uFTKDAZV5ewxnI/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93d3cu/dGVjaHNjb3B5LmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAx/OS8wMy9sYXRlc3Qt/Z2FkZ2V0cy0xLmpw/ZWc.jpg"),
      ];
  }


}