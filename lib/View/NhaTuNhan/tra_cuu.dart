import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nha_tu_nhan/Helper/Utility.dart';
import 'package:nha_tu_nhan/View/CustomWidget/alert_dialog_selected_widget.dart';
import 'package:nha_tu_nhan/ViewModel/NhaTuNhan/ho_ten_widget.dart';
import 'package:nha_tu_nhan/ViewModel/NhaTuNhan/ma_so_hop_dong_widget.dart';
import 'package:nha_tu_nhan/View/NhaTuNhan/thong_tin_tra_cuu.dart';
import 'package:nha_tu_nhan/ViewModel/NhaTuNhan/tra_cuu_viewmodel.dart';
import 'package:provider/provider.dart';

class TraCuu extends StatefulWidget {
  const TraCuu({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TraCuuState createState() => _TraCuuState();
}

class _TraCuuState extends State<TraCuu> {
  bool _showPhuongThucTraCuu = true;
  bool _showTraCuuBangMaHopDong = true;

  bool _maSoHoDongInvalid = false;
  bool _hoTenInvalid = false;
  String _maSoHopDongErrorText = "\u26A0 Thông tin bắt buộc.";
  String _hoTenErrorText = "\u26A0 Thông tin bắt buộc.";
  String _loaiHinhBaoHiemLabel = "Chọn loại hình bảo hiểm";
  int _loaiHinhBaoHiemIndex = 0;
  final _data = [
    'TNDS bắt buộc ô tô',
    'TNDS bắt buộc xe máy / xe điện',
    'Bảo hiểm nhà tư nhân'
  ];

  @override
  Widget build(BuildContext context) {
    final traCuuModel = Provider.of<TraCuuViewModel>(context);

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
          key: traCuuModel.formKey,
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
                            AlertDialogSlected(
                              label: "Loại hình bảo hiểm",
                              placeholder: "Chọn",
                              data: _data,
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(top: 24),
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         "Loại hình bảo hiểm",
                            //         style: TextStyle(
                            //             fontSize: 14,
                            //             color: Colors.grey[700],
                            //             fontWeight: FontWeight.w500),
                            //       ),
                            //       SizedBox(
                            //         height: 5,
                            //       ),
                            //       SizedBox(
                            //         height: 32,
                            //         child: RaisedButton(
                            //           color: Colors.white,
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(4),
                            //             side: BorderSide(color: Colors.grey),
                            //           ),
                            //           elevation: 0,
                            //           padding: EdgeInsets.all(8.0),
                            //           child: Row(
                            //             mainAxisAlignment: MainAxisAlignment
                            //                 .spaceBetween, // Center the Widgets.
                            //             mainAxisSize: MainAxisSize
                            //                 .max, // Use all of width in RaisedButton.
                            //             children: [
                            //               Text(
                            //                 _loaiHinhBaoHiemLabel,
                            //                 style: TextStyle(
                            //                   fontSize: 12,
                            //                   color: Colors.grey[500],
                            //                 ),
                            //               ),
                            //               Icon(
                            //                 Icons.arrow_drop_down,
                            //                 color: Colors.grey[700],
                            //                 size: 18,
                            //               ),
                            //             ],
                            //           ),
                            //           onPressed: () {
                            //             showAlertDialog(context);
                            //           },
                            //
                            //           /// For enabling the button
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
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
                                        padding: EdgeInsets.all(8.0),
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
                                          MaSoHopDongWidget(
                                            errorText: _maSoHopDongErrorText,
                                            controller: traCuuModel
                                                .maSoHopDongController,
                                          )
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
                                          HoTenWidget(
                                            errorText: _hoTenErrorText,
                                            controller:
                                                traCuuModel.hoTenController,
                                          ),
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
                        child: Consumer<TraCuuViewModel>(
                          builder: (context, value, child) {
                            return RaisedButton(
                              onPressed: () {
                                traCuuModel.validateForm();
                              },
                              // bac: Colors.grey[300],
                              child: Text('XÁC NHẬN'),
                              textColor: Colors.grey[500],
                              color: Colors.grey[300],
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            );
                          },
                          // child: ,
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

  void showAlertDialog(BuildContext context) {
    // set up the buttons

    final data = [
      'TNDS bắt buộc ô tô',
      'TNDS bắt buộc xe máy / xe điện',
      'Bảo hiểm nhà tư nhân'
    ];

    AlertDialog alertDialog = AlertDialog(
      contentPadding: EdgeInsets.all(0.0),
      scrollable: false,
      title: Text('Chọn loại hình bảo hiểmss'),
      content: Container(
        width: double.maxFinite,
        height: (16 + 50 * data.length).toDouble(),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Divider(
                          color: Colors.grey[300],
                          height: 1,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                        FlatButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: AutoSizeText(
                                    data[index],
                                    maxLines: 3,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .apply(color: Colors.grey[700]),
                                  ),
                                ),
                              ),
                              (_loaiHinhBaoHiemIndex == index)
                                  ? Icon(
                                      Icons.radio_button_checked_rounded,
                                      color: ConvertHexColor('00819D'),
                                      size: 20,
                                    )
                                  : Icon(
                                      Icons.radio_button_unchecked_rounded,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                            ],
                          ),
                          onPressed: () {
                            print(context);
                            Navigator.pop(context, index);
                            setState(() {
                              _loaiHinhBaoHiemLabel = data[index];
                              _loaiHinhBaoHiemIndex = index;
                            });
                            // return data[index];
                            print(_loaiHinhBaoHiemIndex);
                          },
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
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
