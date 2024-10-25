import 'package:bcnet/pages/home/home_page.dart';
import 'package:bcnet/pages/wifi/wifi_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ble/ble_page.dart';
import 'mine/profile_page.dart';

class MainIndex extends StatefulWidget {
  const MainIndex({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainIndex> {
  int _selectedIndex = 0; // 当前选中的索引
  final List<Widget> _pages = [
    HomePage(),
    UserProfilePage(),
    BluetoothPage(),
    WifiPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // 更新选中的索引
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: _pages[_selectedIndex],
      ), // 显示选中页面的内容
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bluetooth),
            label: 'Ble',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wifi),
            label: 'WiFi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mine',
          ),
        ],
        currentIndex: _selectedIndex, // 当前选中的索引
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped, // 点击事件
      ),
    );
  }
}