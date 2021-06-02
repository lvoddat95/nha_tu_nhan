import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nha_tu_nhan/View/CustomWidget/HoTenWidget.dart';
import 'package:nha_tu_nhan/View/CustomWidget/MaSoHopDongWidget.dart';
import 'package:nha_tu_nhan/View/NhaTuNhan/ThongTinTraCuu.dart';

class TraCuu extends StatefulWidget {
  const TraCuu({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TraCuuState createState() => _TraCuuState();
}

class _TraCuuState extends State<TraCuu> {
  bool _showPhuongThucTraCuu = true;
  bool _showTraCuuBangMaHopDong = true;

  String _maSoHopDongErrorText = "\u26A0 Thông tin bắt buộc.";
  String _hoTenErrorText = "\u26A0 Thông tin bắt buộc.";

  TextEditingController maSoHopDongController = TextEditingController();
  TextEditingController hoTenController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.indigo[700],
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[300],
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Colors.grey[300], width: 4))),
                      child: Container(
                        padding: EdgeInsets.all(24),
                        color: Colors.white,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tra cứu giấy chứng nhận",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.w500),
                            ),
                            Divider(
                              color: Colors.grey[300],
                              thickness: 2,
                            ),
                            Text(
                              "Vui lòng nhập các thông tin sau để tiến hành tra cứu giấy chứng nhận bảo hiểm",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[700]),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Loại hình bảo hiểm",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 32,
                                    child: RaisedButton(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        side: BorderSide(color: Colors.grey),
                                      ),
                                      elevation: 0,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween, // Center the Widgets.
                                        mainAxisSize: MainAxisSize
                                            .max, // Use all of width in RaisedButton.
                                        children: [
                                          Text(
                                            "Chọn loại hình bảo hiểm",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey[700],
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        showSelectDialogLoaiHinh(context);
                                      },

                                      /// For enabling the button
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: _showPhuongThucTraCuu,
                              child: Padding(
                                padding: EdgeInsets.only(top: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Phương thức tra cứu",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      height: 32,
                                      child: RaisedButton(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(color: Colors.grey),
                                        ),
                                        elevation: 0,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween, // Center the Widgets.
                                          mainAxisSize: MainAxisSize
                                              .max, // Use all of width in RaisedButton.
                                          children: <Widget>[
                                            Text(
                                              "Chọn phương thức tra cứu",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[500],
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey[700],
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          showDialogPhuongThuc(context);
                                        },

                                        /// For enabling the button
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                                visible: _showTraCuuBangMaHopDong,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 24),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Mã số hợp đồng",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          MaSoHopDongWidget(errorText: _maSoHopDongErrorText)
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 24),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Họ và tên chủ hợp đồng",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          HoTenWidget(errorText: _hoTenErrorText),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
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
                            validateForm();

                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => ThongTinTraCuu(),
                            // ));
                          },
                          // bac: Colors.grey[300],
                          child: Text('XÁC NHẬN'),
                          textColor: Colors.grey[500],
                          color: Colors.grey[300],
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
      ),
    );
  }

  void validateForm() {
    if (_formKey.currentState.validate()) {
      print(_formKey.currentState.validate());
    } else {
      print('Form is valid');
    }
  }

  void showPhuongThucTraCuu() {
    setState(() {
      _showPhuongThucTraCuu = true;
    });
  }

  void showTraCuuBangMaHD() {
    setState(() {
      _showTraCuuBangMaHopDong = true;
    });
  }

  showSelectDialogLoaiHinh(BuildContext context) {
    // List options
    Widget optionOne = SimpleDialogOption(
      child: const Text('TNDS bắt buộc ô tô'),
      onPressed: () {},
    );
    Widget optionTwo = SimpleDialogOption(
      child: const Text('TNDS bắt buộc xe máy / xe điện'),
      onPressed: () {},
    );
    Widget optionThree = SimpleDialogOption(
      child: const Text('Bảo hiểm nhà tư nhân'),
      onPressed: () {
        showPhuongThucTraCuu();
        Navigator.of(context).pop();
        print('opt3');
      },
    );

    // SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      title: const Text('Chọn loại hình bảo hiểm'),
      children: <Widget>[
        optionOne,
        optionTwo,
        optionThree,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  showDialogPhuongThuc(BuildContext context) {
    // List options
    Widget optionOne = SimpleDialogOption(
      child: const Text('Tra cứu bằng Mã số hợp đồng'),
      onPressed: () {
        showTraCuuBangMaHD();
        print('opt1');
        Navigator.of(context).pop();
      },
    );
    Widget optionTwo = SimpleDialogOption(
      child: const Text('Tra cứu bằng QR Code'),
      onPressed: () {
        print('opt2');
        Navigator.of(context).pop();
      },
    );

    // SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      title: const Text('Chọn phương thức tra cứu'),
      children: <Widget>[
        optionOne,
        optionTwo,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}




