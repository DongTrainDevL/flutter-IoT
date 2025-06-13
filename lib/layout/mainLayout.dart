import 'package:flutter/material.dart';
import './../Pages/AccountLIst.dart';
import './../Pages/Admin.dart';
import './../Pages/branch.dart';
import './../Pages/ChangePassword.dart';
import './../Pages/ConfigurationParamatersPage.dart';
import './../Pages/CreateAccount.dart';
import './../Pages/Dashboard.dart';
import './../Pages/DashboardManage.dart';
import './../Pages/DeviceManage.dart';
import './../Pages/EditProfile.dart';
import './../Pages/GroupManage.dart';
import './../Pages/[TEST]SimulatePushDATAByHardware.dart';
import './../Pages/ManageBranch.dart';

class MainLayoutPage extends StatefulWidget {
  const MainLayoutPage({super.key});

  @override
  State<MainLayoutPage> createState() => _MainLayoutPageState();
}

class _MainLayoutPageState extends State<MainLayoutPage> {
  int _selectedIndex = 0;

  // รายการหน้าทั้งหมด
  final List<Widget> _pages = [
    const Dashboard(),                    // index 0
    const ManageBranch(),                // index 1
     GroupManagePage(),             // index 2
    const DeviceManagePage(),            // index 3
    const ConfigurationParameterPage(),  // index 4
    const DashboardManagePage(),         // index 5
    const CreatedAccountPage(),          // index 6
    const AccountListPage(),             // index 7
    const ChangePasswordPage(),          // index 8
    const EditedProfilePage(),           // index 9
    const AdminPage(),                   // index 10
    const BranchPage(),                  // index 11
    const SimulatePushDATAByHardware(),  // index 12
  ];

  // ชื่อเมนูตรงกับแต่ละหน้า
  final List<String> _menuTitles = [
    'ใช้ icon แทน',
    'Manage Branch',
    'GroupManagePage',
    'Device Manage',
    'Configuration Parameters',
    'Dashboard Manage',
    'Create Account',
    'Account List',
    'Change Password',
    'Edit Profile',
    'Admin',
    'Branch',
    '[TEST] Simulate Push DATA',
  ];

  // เมื่อเลือกเมนูจาก Drawer
  void _onSelectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // ปิด Drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_menuTitles[_selectedIndex]),
      ),
      drawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        decoration: BoxDecoration(color: Colors.indigo[900]),
        child: Row (
        crossAxisAlignment: CrossAxisAlignment.center,
        // children5
        children: [
          Image.asset( 
            'assets/icons/logo-flid-tech.png',
            width: 40,
            height: 40,
          ),
          SizedBox(width: 12,),
          const Text(
            'Hello SuperAdmin',style:TextStyle(  
              color : Colors.white , fontSize: 18
            )
          ) ,

        ],
      ),
        // child: Text(
        //   'Hi, Super Admin\nBranch: HQ',
        //   style: TextStyle(color: Colors.white, fontSize: 18),
        // ),
      ),
      ListTile(
        leading: const Icon(Icons.dashboard),
        title: const Text('Dashboard'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard()));
        },
      ),
      ListTile( 
        leading: const Icon(Icons.account_tree) , 
        title: const Text("Branch") , 
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const BranchPage())) ;
        }
      ),
      ListTile(
        leading: const Icon(Icons.account_tree),
        title: const Text('Manage Branch'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ManageBranch()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Configuration Parameters'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ConfigurationParameterPage()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.group),
        title: const Text('GroupManagePage'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => GroupManagePage()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.devices),
        title: const Text('Device Manage'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DeviceManagePage()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.sim_card),
        title: const Text('[TEST] Simulate Push DATA'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SimulatePushDATAByHardware()));
        },
      ),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.create),
        title: const Text('Create Account'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatedAccountPage()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.list),
        title: const Text('Account List'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountListPage()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.lock),
        title: const Text('Change Password'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePasswordPage()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.edit),
        title: const Text('Edit Profile'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const EditedProfilePage ()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.logout),
        title: const Text('Logout'),
        onTap: () {
          // ทำ logout หรือกลับหน้าล็อกอิน
        },
      ),
    ],
  ),
),

      body: _pages[_selectedIndex],
    );
  }
}
