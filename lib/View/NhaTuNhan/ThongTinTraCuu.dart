import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThongTinTraCuu extends StatefulWidget {
  const ThongTinTraCuu({Key? key}) : super(key: key);

  @override
  _ThongTinTraCuuState createState() => _ThongTinTraCuuState();
}

class _ThongTinTraCuuState extends State<ThongTinTraCuu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin hợp đồng BH"),
        centerTitle: true,
        backgroundColor: Colors.indigo[700],
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[300],
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(top: BorderSide(color: (Colors.grey[300])!, width: 4))
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            margin: const EdgeInsets.only(right: 16, bottom: 16),
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.indigo[500],
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(40),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Thông tin hợp đồng',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/images/icon_logo.png',
                                    height: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Mã số hợp đồng', style: Theme.of(context).textTheme.caption),
                              Text('#Masohopdong', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                          child: Divider(
                            thickness: 1,
                            height: 1,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Loại hình bảo hiểm', style: Theme.of(context).textTheme.caption),
                              Text('Bảo hiểm nhà tư nhân', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                          child: Divider(
                            thickness: 1,
                            height: 1,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Bảo hiểm từ ngày', style: Theme.of(context).textTheme.caption),
                              Text('#Ngayhieuluc', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                          child: Divider(
                            thickness: 1,
                            height: 1,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Đến ngày', style: Theme.of(context).textTheme.caption),
                              Text('#Ngayhethieuluc', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                          child: Divider(
                            thickness: 1,
                            height: 1,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Trạng thái', style: Theme.of(context).textTheme.caption),
                              Text('#Trangthai', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                          child: Divider(
                            thickness: 1,
                            height: 1,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Bảo hiểm tài sản', style: Theme.of(context).textTheme.caption),
                              Text('#ThongtinBHtaisan', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                          child: Divider(
                            thickness: 1,
                            height: 1,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('MHạng mục rủi ro bắt buộc', style: Theme.of(context).textTheme.caption),
                              Text('#Hangmucruirobatbuoc', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                          child: Divider(
                            thickness: 1,
                            height: 1,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Hạng mục rủi ro mở rộng', style: Theme.of(context).textTheme.caption),
                              Text('#Hangmucruiromorong', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: Divider(
                            thickness: 1,
                            height: 1,
                          ),
                        ),

                        Container(
                          color: Colors.grey[100],
                          child: Column(
                            children: [
                              Divider(
                                thickness: 1,
                                height: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Phạm vi bảo hiểm", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: Colors.grey[700]),),
                                    Image.asset(
                                      'assets/images/icon_more.png',
                                      height: 24,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                height: 1,
                              ),
                            ],
                          ),
                        ),

                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Divider(
                                thickness: 1,
                                height: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Quyền lợi bảo hiểm", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: Colors.grey[700]),),
                                    Image.asset(
                                      'assets/images/icon_more.png',
                                      height: 24,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                height: 1,
                              ),
                            ],
                          ),
                        ),

                        Container(
                          color: Colors.grey[100],
                          child: Column(
                            children: [
                              Divider(
                                thickness: 1,
                                height: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Quy tắc áp dụng", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: Colors.grey[700]),),
                                    Image.asset(
                                      'assets/images/icon_more.png',
                                      height: 24,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                height: 1,
                              ),
                            ],
                          ),
                        ),

                        Container(
                          child: Column(
                            children: [
                              Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Divider(
                                      thickness: 1,
                                      height: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Ấn chỉ điện tử", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: Colors.grey[700]),),
                                          Image.asset(
                                            'assets/images/icon_more.png',
                                            height: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(top: BorderSide(color: (Colors.grey[300])!, width: 4))
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(left: 16, right: 16),
                                  margin: const EdgeInsets.only(right: 16, bottom: 16),
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo[500],
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(40),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Thông tin người tham gia BH',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          'assets/images/icon_logo.png',
                                          height: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Họ và Tên', style: Theme.of(context).textTheme.caption),
                                    Text('##Hovatenguoithamgiabh', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                                child: Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Số điện thoại', style: Theme.of(context).textTheme.caption),
                                    Text('*** *** 0000', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                                child: Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Địa chỉ', style: Theme.of(context).textTheme.caption),
                                    Text('*** - Quan/huyen- Tinh/Thanhpho', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                                child: Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                              ),
                              SizedBox(height: 7,),
                            ],
                          ),
                        ),

                        Container(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(top: BorderSide(color: (Colors.grey[300])!, width: 4))
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(left: 16, right: 16),
                                  margin: const EdgeInsets.only(right: 16, bottom: 16),
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo[500],
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(40),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Đối tượng bảo hiểm',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          'assets/images/icon_logo.png',
                                          height: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Loại tài sản', style: Theme.of(context).textTheme.caption),
                                    Text('#Loaitaisan', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                                child: Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Thời gian sử dụng', style: Theme.of(context).textTheme.caption),
                                    Text('#Thoigiansudung', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                                child: Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Số tiền bảo hiểm căn nhà', style: Theme.of(context).textTheme.caption),
                                    Text('#Sotienbaohiem', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                                child: Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Địa chỉ', style: Theme.of(context).textTheme.caption),
                                    Text('#Diachichitiet', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                                child: Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                              ),
                              SizedBox(height: 7,),
                            ],
                          ),
                        ),

                        Container(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(top: BorderSide(color: (Colors.grey[300])!, width: 4))
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(left: 16, right: 16),
                                  margin: const EdgeInsets.only(right: 16, bottom: 16),
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo[500],
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(40),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Chi nhánh phát hành',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          'assets/images/icon_logo.png',
                                          height: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Tên chi nhánh', style: Theme.of(context).textTheme.caption),
                                    Text('#Tenchinhanh', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                                child: Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Địa chỉ', style: Theme.of(context).textTheme.caption),
                                    Text('#Diachi', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                                child: Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Hotline liên hệ', style: Theme.of(context).textTheme.caption),
                                    Text('#Hotlinelienhe', style: TextStyle(fontSize: 12, color: Colors.grey[900])),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                                child: Divider(
                                  thickness: 1,
                                  height: 1,
                                ),
                              ),
                              SizedBox(height: 7,),
                            ],
                          ),
                        ),






                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(24, 8, 24, 16),
                    color: Colors.white,
                    child: SizedBox(
                      height: 32,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ThongTinTraCuu(),
                          ));
                        },
                        // bac: Colors.grey[300],
                        child: Text('XÁC NHẬN'),
                        textColor: Colors.white,
                        color: Color.fromRGBO(0, 129, 157, 1),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
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
