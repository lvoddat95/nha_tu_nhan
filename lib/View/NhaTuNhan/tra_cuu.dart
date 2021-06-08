import 'package:flutter/material.dart';
import 'package:nha_tu_nhan/View/CustomWidget/vni_alert_dialog_selected.dart';
import 'package:nha_tu_nhan/View/CustomWidget/vni_text_form_field.dart';
import 'package:nha_tu_nhan/ViewModel/NhaTuNhan/tra_cuu_viewmodel.dart';
import 'package:provider/provider.dart';

class TraCuu extends StatefulWidget {
  const TraCuu({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TraCuuState createState() => _TraCuuState();
}

class _TraCuuState extends State<TraCuu> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TraCuuViewModel>(context);

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
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          key: provider.formKey,
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
                            VniAlertDialogSlected(
                              label: "Loại hình bảo hiểm",
                              hintText: provider.loaiHinhBaoHiemHintext,
                              onPress: () => provider.showAlertDialogLoaiHinhBaoHiem(),
                              indexSelected: provider.loaiHinhBaoHiemIndex,
                            ),
                            Visibility(
                              visible: provider.showPhuongThucTraCuu,
                              child: VniAlertDialogSlected(
                                label: "Phương thức tra cứu",
                                hintText: provider.phuongThucTraCuuHintText,
                                onPress: () => provider.showAlertDialogPhuongThucTraCuu(),
                                indexSelected: provider.phuongThucTraCuuIndex,
                              ),
                            ),
                            Visibility(
                                visible: provider.showTraCuuBangMaHopDong,
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
                                          VniTextFormField(
                                            controller: provider.maSoHopDongController,
                                            validator: provider.validateMaSoHopDong,
                                            hintText: provider.maSoHopDongHintText,
                                            maxLength: 200,
                                            counterText: '',
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

                                          VniTextFormField(
                                            controller:provider.hoTenController,
                                            validator: provider.validateHoTen,
                                            hintText: provider.hoTenHintText,
                                            maxLength: 20,
                                            textCapitalization: TextCapitalization.characters,
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
                              onPressed:  () {
                                  provider.validateForm();
                              },
                              // bac: Colors.grey[300],
                              child: Text('XÁC NHẬN'),
                              // textColor: Colors.white,
                              // color: Color.fromRGBO(0, 129, 157, 1),
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
}
