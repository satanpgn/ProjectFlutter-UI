import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:n_baz/screens/account/account_screen.dart';
import 'package:n_baz/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/auth_viewmodel.dart';
import '../../viewmodels/category_viewmodel.dart';
import '../../viewmodels/global_ui_viewmodel.dart';
import '../../viewmodels/product_viewmodel.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  PageController pageController = PageController();
  int selectedIndex = 0;
  _onPageChanged(int index) {
    // onTap
    setState(() {
      selectedIndex = index;

    });
  }

  _itemTapped(int selectedIndex) {
    pageController.jumpToPage(selectedIndex);
    setState(() {
      this.selectedIndex = selectedIndex;
    });
  }


  late GlobalUIViewModel _ui;
  late AuthViewModel _authViewModel;
  late CategoryViewModel _categoryViewModel;
  late ProductViewModel _productViewModel;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
      _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      _categoryViewModel = Provider.of<CategoryViewModel>(context, listen: false);
      _productViewModel = Provider.of<ProductViewModel>(context, listen: false);
      getInit();
    });
    super.initState();
  }

  void getInit() {
    _categoryViewModel.getCategories();
    _productViewModel.getProducts();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: <Widget>[HomeScreen(), Container(), AccountScreen()],
          onPageChanged: _onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.brown,
        selectedLabelStyle: TextStyle(color: Colors.redAccent),
        unselectedLabelStyle: TextStyle(color: Colors.yellow),
        type: BottomNavigationBarType.fixed,
        onTap: _itemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label:"Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label:"Favorite"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label:"Account"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label:"Contacts"
          ),
        ],
      ),
    );
  }

}
