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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [IconButton( onPressed: () {


                  Navigator.of(context).pop();
                }, icon:Icon(Icons.arrow_back,color:Colors.white),)],),),
            SizedBox(
              height: 10,
            ),
            Expanded(child: Column(children: [
              Image.asset('assets/images/login1.png', height: 160,),
              SizedBox(height: 10,),
              Padding(
                
                padding: EdgeInsets.all(30.0),
                child: Container(
                  padding: EdgeInsets.all(15.0),

                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Email",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)),
                      SizedBox(height: 5,),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("justifi@gmail.com",style: TextStyle(color: Colors.white,),)),
                      SizedBox(height: 15,),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Website",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)),
                      SizedBox(height: 5,),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("www.justifi.com",style: TextStyle(color: Colors.white,),)),
                      SizedBox(height: 15,),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Location",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)),
                      SizedBox(height: 5,),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("K.G. road, K.V.K Complex Near",style: TextStyle(color: Colors.white),)),
                      SizedBox(height: 5,),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("K.K Nagar Delhi-6846789, India",style: TextStyle(color: Colors.white,),)),

                ],),),
              )
            ],)),
          ],
        ),
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
    return Scaffold();
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
                        builder: (context) => IssueChat(),
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
  ];

  static List hinttitle = [
    "Select Order Type",
    "Select Order Id",
    "Select Order issue",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DatePciker(
              hintText: "Select Order Date",
              issueTitle: "Order Date",
            ),
            for (int i = 0; i < title.length; i++)
              IssueWidget(
                hintText: hinttitle[i],
                issueTitle: title[i],
              ),

            const AddDescription(),

            //gi
            Container(
              margin: const EdgeInsets.only(
                top: 30,
                bottom: 20,
              ),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                ),
                onPressed: () {
                  ashowAlertDialog(BuildContext context) {
                    Widget okButton = TextButton(
                      child: const Text("OK"),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                      },
                    );
                    AlertDialog alert = AlertDialog(
                      title:
                          const Center(child: Text("Thanks for reaching out")),
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
      ),
    );
  }
}

class AddDescription extends StatelessWidget {
  const AddDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Description"),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              margin: const EdgeInsets.only(left: 20, right: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: const TextField(
                maxLength: null,
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Description",
                ),
              ),
            ),
          ),
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
      margin: const EdgeInsets.only(
        top: 25,
        bottom: 20,
        left: 10,
        right: 20,
      ),
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
      margin: const EdgeInsets.only(
        top: 20,
        left: 10,
        right: 20,
      ),
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
