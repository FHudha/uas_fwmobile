
//import material dan font
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import constans dan class jobs
import 'package:fhudha_mobile/constants.dart';
import 'package:fhudha_mobile/jobs.dart';

//main classs
void main() {
  runApp(MyApp());
}

//membuat class Myapp menggunakan widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobs Finder',
      theme: ThemeData.light(),
      home: LoginPage(),
    );
  }
}

//membuat class untuk halaman login
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

//membuat classs untuk membuat input name di halaman login
class _LoginPageState extends State<LoginPage> {
  final textController = TextEditingController();
  String displayName;

  //membuat tampilan untuk halaman login menggunakan container
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(kSafePadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Jobs',
                      style: GoogleFonts.poppins(
                        color: kBlack,
                        fontSize: 48.0,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                    Text(
                      ' Finder',
                      style: GoogleFonts.poppins(
                        color: kGreen,
                        fontSize: 48.0,
                        fontWeight: FontWeight.w800
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height: 2*kSafePadding),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Masukkan Nama Anda',
                      style: GoogleFonts.poppins(
                        color: kBlack,
                        fontWeight: FontWeight.w500
                      )
                    ),
                    SizedBox(height: 2*kBasePadding),
                    Container(
                      height: 12*kBasePadding,
                      padding: EdgeInsets.symmetric(horizontal: kSafePadding),
                      decoration: BoxDecoration(
                        color: kWhite,
                        border: Border.all(
                          color: kLightGrey
                        ),
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nama'
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 2*kSafePadding),
              //membuat button yang akan diarahkan ke hompage
              FlatButton(
                color: kGreen,
                onPressed: () {
                  setState(() {
                    displayName = textController.text;
                  });

                  if(displayName != '') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return HomePage(displayName: displayName);
                    }));
                  } else {
                    return null;
                  }
                  
                },
                child: Text(
                  'SELANJUTNYA',
                  style: GoogleFonts.lato(
                    color: kWhite,
                    fontWeight: FontWeight.w500
                  )
                )
              )
            ],
          )
        ),
      ),
    );
  }
}

//membuat class hompage
class HomePage extends StatefulWidget {
  final String displayName;

  HomePage({ this.displayName });

  @override
  _HomePageState createState() => _HomePageState();
}

//membuat class HompageState untuk membuat jobs (rekomendasi dan terbaru)
class _HomePageState extends State<HomePage> {
  List<Jobs> recommendedJobs = [
    Jobs(
      jobPosition: 'Product Designer',
      companyName: 'Google',
      location: 'Jakarta, Indonesia',
      salaryRange: '\Rp 9 jt - \Rp 13 jt',
      logoName: 'google.png',
      savedJob: false
    ),
    Jobs(
      jobPosition: 'Frontliners',
      companyName: 'Bank BNI',
      location: 'Surabaya, Indonesia',
      salaryRange: '\Rp 5 jt - \Rp 8 jt',
      logoName: 'bni.png',
      savedJob: false
    ),
    Jobs(
      jobPosition: 'UX Designer',
      companyName: 'Gojek',
      location: 'Jakarta, Indonesia',
      salaryRange: '\Rp 7 jt - \Rp 10 jt',
      logoName: 'gojek.png',
      savedJob: false
    )
  ];

  List<Jobs> recentJobs = [
    Jobs(
      jobPosition: 'Senior Teknisi',
      companyName: 'KAI',
      location: 'Yogyakarta, Indonesia',
      salaryRange: '\Rp 4 jt - \Rp 6 jt',
      logoName: 'kai.png',
      savedJob: true
    ),
    Jobs(
      jobPosition: 'Software Engineer - Web',
      companyName: 'Gojek',
      location: 'Jakarta, Indonesia',
      salaryRange: '\Rp 7 jt - \Rp 10 jt',
      logoName: 'gojek.png',
      savedJob: false
    ),
    Jobs(
        jobPosition: 'Kurir',
        companyName: 'POS Indonesia',
        location: 'Semarang, Indonesia',
        salaryRange: '\Rp 4 jt - \Rp 5 jt',
        logoName: 'pos.png',
        savedJob: true
    ),
    Jobs(
        jobPosition: 'Data Analysts',
        companyName: 'Indofood',
        location: 'Surabaya, Indonesia',
        salaryRange: '\Rp 4 jt - \Rp 7 jt',
        logoName: 'indofood.png',
        savedJob: false
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //membuat wording Jobs Finder dan icon logout pada appbar
      appBar: AppBar(
        backgroundColor: kLightGrey,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: 'Jobs',
            style: GoogleFonts.poppins(
              color: kBlack,
              fontSize: 20.0,
              fontWeight: FontWeight.w800
            ),
            children: <TextSpan> [
              TextSpan(
                text: ' Finder',
                style: GoogleFonts.poppins(
                  color: kGreen,
                  fontWeight: FontWeight.w800
                )
              )
            ]
          )
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: kDarkGrey,
            ),
            onPressed: () {
              Navigator.pop(context);
            }
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //membuat wording pada header
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(kSafePadding, 2*kSafePadding, kSafePadding, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang ${widget.displayName},',
                    style: GoogleFonts.lato(
                      color: kDarkGrey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500
                    )
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    'Temukan Pekerjaan Impianmu',
                    style: GoogleFonts.poppins(
                      color: kOrange,
                      fontSize: 23.0,
                      fontWeight: FontWeight.w800
                    )
                  )
                ],
              ),
            ),
            //membuat rekomendasi pekerjaan
            SizedBox(height: 1.5*kSafePadding),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kSafePadding),
                    child: Text(
                      'Rekomendasi Pekerjaan',
                      style: GoogleFonts.poppins(
                        color: kBlack,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  SizedBox(height: 2*kBasePadding),
                  Container(
                    height: 12*kSafePadding,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: recommendedJobs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return JobsDetail(
                                jobPosition: recommendedJobs[index].jobPosition,
                                companyName: recommendedJobs[index].companyName,
                                location: recommendedJobs[index].location,
                                salaryRange: recommendedJobs[index].salaryRange,
                                logoName: recommendedJobs[index].logoName,
                              );
                            }));
                          },
                          child: Container(
                            width: 10*kSafePadding,
                            margin: index != recommendedJobs.length-1 ? EdgeInsets.only(left: kSafePadding) : EdgeInsets.symmetric(horizontal: kSafePadding),
                            padding: EdgeInsets.symmetric(
                              vertical: kSafePadding,
                              horizontal: 2*kBasePadding
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kLightGrey
                              )
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/${recommendedJobs[index].logoName}',
                                  scale: 2.0,
                                ),
                                SizedBox(height: kSafePadding),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      recommendedJobs[index].jobPosition,
                                      style: GoogleFonts.lato(
                                        color: kBlack,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700
                                      )
                                    ),
                                    SizedBox(height: 2.0),
                                    Text(
                                      recommendedJobs[index].companyName,
                                      style: GoogleFonts.lato(
                                        color: kDarkGrey,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700
                                      )
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      recommendedJobs[index].location,
                                      style: GoogleFonts.lato(
                                        color: kDarkGrey,
                                      )
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      recommendedJobs[index].salaryRange,
                                      style: GoogleFonts.lato(
                                        color: kDarkGrey,
                                        fontWeight: FontWeight.w600
                                      )
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            //membuat lowongan terbaru
            SizedBox(height: 1.5*kSafePadding),
            Container(
              padding: EdgeInsets.symmetric(horizontal: kSafePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lowongann Terbaru',
                    style: GoogleFonts.poppins(
                      color: kBlack,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 2*kBasePadding),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: recentJobs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return JobsDetail(
                              jobPosition: recentJobs[index].jobPosition,
                              companyName: recentJobs[index].companyName,
                              location: recentJobs[index].location,
                              salaryRange: recentJobs[index].salaryRange,
                              logoName: recentJobs[index].logoName,
                            );
                          }));
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: kSafePadding),
                          padding: EdgeInsets.all(kSafePadding),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kLightGrey
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/${recentJobs[index].logoName}',
                                      scale: 2.0,
                                    ),
                                    SizedBox(width: kSafePadding),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          recentJobs[index].jobPosition,
                                          style: GoogleFonts.lato(
                                            color: kBlack,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700
                                          )
                                        ),
                                        SizedBox(height: 2.0),
                                        Text(
                                          recentJobs[index].companyName,
                                          style: GoogleFonts.lato(
                                            color: kDarkGrey,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700
                                          )
                                        ),
                                        SizedBox(height: 4.0),
                                        Text(
                                          recentJobs[index].location,
                                          style: GoogleFonts.lato(
                                            color: kDarkGrey,
                                          )
                                        ),
                                        SizedBox(height: 4.0),
                                        Text(
                                          recentJobs[index].salaryRange,
                                          style: GoogleFonts.lato(
                                            color: kDarkGrey,
                                            fontWeight: FontWeight.w600
                                          )
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              //membuat flag bookmark untuk lowongan terbaru
                              IconButton(
                                icon: recentJobs[index].savedJob == true ? Icon(Icons.bookmark, color: kGreen) : Icon(Icons.bookmark_border, color: kDarkGrey),
                                onPressed: () {
                                  setState(() {
                                    recentJobs[index].savedJob = !recentJobs[index].savedJob;
                                  });
                                }
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
//membuat class JobsDetail untuk menampilkan detail lowongan
class JobsDetail extends StatelessWidget {
  final String jobPosition;
  final String companyName;
  final String location;
  final String salaryRange;
  final String logoName;
  
  JobsDetail({ this.jobPosition, this.companyName, this.location, this.salaryRange, this.logoName });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //membuat appbar untuk menampilkan button arrow (kembali) dan tittle(nama perusahaan)
      appBar: AppBar(
        backgroundColor: kLightGrey,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kOrange
          ),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
        centerTitle: true,
        title: Text(
          companyName,
          style: GoogleFonts.poppins(
            color: kBlack,
            fontSize: 16.0,
            fontWeight: FontWeight.w600
          )
        )
      ),
      body: SingleChildScrollView(
        //membuat tampilan informasi lowongan menggunakan container
        child: SafeArea(
          minimum: EdgeInsets.all(kSafePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(top: kSafePadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/$logoName',
                      scale: 1.5,
                    ),
                    SizedBox(width: kSafePadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          jobPosition,
                          style: GoogleFonts.lato(
                            color: kBlack,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700
                          )
                        ),
                        Text(
                          companyName,
                          style: GoogleFonts.lato(
                            color: kDarkGrey,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700
                          )
                        ),
                        Text(
                          location,
                          style: GoogleFonts.lato(
                            color: kDarkGrey,
                            fontSize: 16.0
                          )
                        ),
                        Text(
                          salaryRange,
                          style: GoogleFonts.lato(
                            color: kDarkGrey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600
                          )
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 1.5*kSafePadding),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //membuat tampilan informasi pekerjaan
                    Text(
                      'Deskripsi Pekerjaan',
                      style: GoogleFonts.poppins(
                        color: kBlack,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700
                      )
                    ),
                    SizedBox(height: kBasePadding),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.lato(
                        color: kBlack,
                        fontSize: 16.0
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 1.5*kSafePadding),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //membuat tampilan informasi kualifikasi
                    Text(
                      'Kualifikasi',
                      style: GoogleFonts.poppins(
                        color: kBlack,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700
                      )
                    ),
                    SizedBox(height: kBasePadding),
                    Text(
                      '•\tWarga negara Indonesia (WNI)',
                      style: GoogleFonts.lato(
                        color: kBlack,
                        fontSize: 16.0
                      )
                    ),
                    Text(
                      '•\tPria atau Wanita min 20 tahun',
                      style: GoogleFonts.lato(
                        color: kBlack,
                        fontSize: 16.0
                      )
                    ),
                    Text(
                      '•\tMenguasai bahasa Inggris',
                      style: GoogleFonts.lato(
                        color: kBlack,
                        fontSize: 16.0
                      )
                    ),
                  ],
                ),
              ),
              //membuat tampilan dekorasi box
              SizedBox(height: 1.5*kSafePadding),
              Container(
                padding: EdgeInsets.all(2*kSafePadding),
                decoration: BoxDecoration(
                  color: kLightGrey,
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  //membuat tampilan informasi kebutuhan
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.people_outline,
                          color: kOrange,
                          size: 28.0,
                        ),
                        SizedBox(width: 1.5*kSafePadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kebutuhan',
                              style: GoogleFonts.lato(
                                color: kBlack,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500
                              )
                            ),
                            SizedBox(height: kBasePadding),
                            Text(
                              '3 Orang',
                              style: GoogleFonts.lato(
                                color: kBlack,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700
                              )
                            )
                          ],
                        )
                      ],
                    ),
                    //membuat tampilan informasi deadline
                    SizedBox(height: kSafePadding),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: kOrange,
                          size: 28.0,
                        ),
                        SizedBox(width: 1.5*kSafePadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deadline',
                              style: GoogleFonts.lato(
                                color: kBlack,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500
                              )
                            ),
                            SizedBox(height: kBasePadding),
                            Text(
                              '03 April 2021',
                              style: GoogleFonts.lato(
                                color: kBlack,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700
                              )
                            )
                          ],
                        )
                      ],
                    ),
                    //membuat tampilan informasi kategori
                    SizedBox(height: kSafePadding),
                    Row(
                      children: [
                        Icon(
                          Icons.picture_in_picture_alt,
                          color: kOrange,
                          size: 28.0,
                        ),
                        SizedBox(width: 1.5*kSafePadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kategori',
                              style: GoogleFonts.lato(
                                color: kBlack,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500
                              )
                            ),
                            SizedBox(height: kBasePadding),
                            Text(
                              'Full Time',
                              style: GoogleFonts.lato(
                                color: kBlack,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700
                              )
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}