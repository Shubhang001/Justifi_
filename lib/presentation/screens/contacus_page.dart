import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/issue_chat.dart';
import 'package:jusitfi_admin/presentation/widgets/profile_appbar.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(
      initialIndex: 0,
      vsync: this,
      length: 2,
    );
    return Scaffold(
      body: Column(
        children: [
          const ProfileNavBar(),
          Container(
            width: double.infinity,
            color: const Color.fromRGBO(222, 226, 230, 1),
            height: 60,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.all(20),
                  child: const Icon(Icons.contact_page_rounded)),
              const Text("Contact Us")
            ],
          ),
          Expanded(child: Body(tabController: _tabController)),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
    required TabController? tabController,
  }) : _tabController = tabController;

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 1,
            horizontal: 10,
          ),
          child: TabBar(
            indicator: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                )),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(
              color: Colors.white,
              // decorationStyle: TextDecorationStyle.solid,
            ),
            tabs: const [
              Tab(text: "New"),
              Tab(text: "Existing"),
            ],
            controller: _tabController,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              NewIssue(),
              ExistingIssue(),
            ],
          ),
        ),
      ],
    );
  }
}

class ExistingIssue extends StatelessWidget {
  const ExistingIssue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        IssueTile(
          title: "Criminal Cases",
          icon: Icons.class_rounded,
          issue: "Not reciving update from Advocate",
          orderId: "30 March 2023",
          status: "Active",
          tickeId: "XT182",
        ),
        IssueTile(
          title: "Video Call",
          icon: Icons.video_call_sharp,
          issue: "Advocate did not pick up the call",
          orderId: "22 Feb 2023",
          status: "Completed",
          tickeId: "XT182",
        ),
      ],
    );
  }
}

class IssueTile extends StatelessWidget {
  const IssueTile({
    super.key,
    required this.title,
    required this.status,
    required this.tickeId,
    required this.orderId,
    required this.issue,
    required this.icon,
  });

  final String title;
  final IconData icon;
  final String status;
  final String tickeId;
  final String orderId;
  final String issue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(),
          BoxShadow(),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Icon(icon),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(title)),
                ],
              ),
              Text("Status : $status"),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text("Ticket ID : $tickeId"),
                const SizedBox(height: 10),
                Text("Ordered on : $orderId"),
                const SizedBox(height: 15),
                const Text("Profile hiring"),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Text("Issue : "),
                    Text(
                      issue,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IssueChat(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25),
                        ),
                        border: Border.all(
                          color: Colors.black,
                        )),
                    padding: const EdgeInsets.all(5),
                    child: const Text("Chat with Us"),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewIssue extends StatelessWidget {
  const NewIssue({
    super.key,
  });

  static List title = [
    "Order Type : ",
    "Select Order : ",
    "Order issue : ",
    "Description : ",
  ];

  static List hinttitle = [
    "Select Order Type",
    "Select Order",
    "Select Order issue",
    "Description ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const DatePciker(
            hintText: "Select Order Date",
            issueTitle: "Order Date",
          ),
          Expanded(
              child: ListView.builder(
            itemCount: hinttitle.length,
            itemBuilder: (context, index) {
              return IssueWidget(
                hintText: hinttitle[index],
                issueTitle: title[index],
              );
            },
          )),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black),
              ),
              onPressed: () {
                ashowAlertDialog(BuildContext context) {
                  Widget okButton = TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                    },
                  );
                  AlertDialog alert = AlertDialog(
                    title: const Center(child: Text("Thanks for reaching out")),
                    content: const Text(
                        "Your ticket has been initiated . You will receive an  update from our executive in 3 - 5 working days .\n\nTicket ID : XT182"),
                    actions: [
                      okButton,
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                }

                ashowAlertDialog(context);
              },
              child: const Text("Submit"),
            ),
          )
        ],
      ),
    );
  }
}

class IssueWidget extends StatelessWidget {
  const IssueWidget({
    super.key,
    required this.hintText,
    required this.issueTitle,
  });

  final String hintText;
  final String issueTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          Text(issueTitle),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now(),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                margin: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    hintText: hintText,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DatePciker extends StatelessWidget {
  const DatePciker({
    super.key,
    required this.hintText,
    required this.issueTitle,
  });

  final String hintText;
  final String issueTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          Text(issueTitle),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(), //get today's date
                  firstDate: DateTime(
                      2000), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                margin: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
                child: const SizedBox(
                  height: 50,
                  child: Center(child: Text("Select Order Date")),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
