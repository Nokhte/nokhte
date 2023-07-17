import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RawBeachPaths {
  static Path path1(Size size) {
    Path path_1 = Path();
    path_1.moveTo(size.width * 0.4849246, size.height * 0.7230047);
    path_1.lineTo(size.width * 0.6934673, size.height * 0.7230047);
    path_1.lineTo(size.width * 0.6934673, size.height * 0.7805164);
    path_1.lineTo(size.width * 0.4849246, size.height * 0.7805164);
    path_1.lineTo(size.width * 0.4849246, size.height * 0.7230047);
    path_1.close();
    return path_1;
  }

  static Paint path1Fill(Size size) {
    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffD8B289).withOpacity(1.0);
    return paint1Fill;
  }

  static Path path2(Size size) {
    Path path_2 = Path();
    path_2.moveTo(size.width * 0.6336307, size.height * 0.7306338);
    path_2.cubicTo(
        size.width * 0.6378995,
        size.height * 0.7318075,
        size.width * 0.6389648,
        size.height * 0.7271127,
        size.width * 0.6389648,
        size.height * 0.7276995);
    path_2.cubicTo(
        size.width * 0.6389648,
        size.height * 0.7281690,
        size.width * 0.6411005,
        size.height * 0.7278955,
        size.width * 0.6421683,
        size.height * 0.7276995);
    path_2.lineTo(size.width * 1.005025, size.height * 0.7077465);
    path_2.lineTo(size.width * 1.005025, size.height * 0.7992958);
    path_2.lineTo(size.width * 0.7766382, size.height * 0.7992958);
    path_2.lineTo(size.width * 0.6763191, size.height * 0.7693662);
    path_2.cubicTo(
        size.width * 0.6737588,
        size.height * 0.7754695,
        size.width * 0.5927814,
        size.height * 0.7623239,
        size.width * 0.5689472,
        size.height * 0.7529343);
    path_2.cubicTo(
        size.width * 0.5663869,
        size.height * 0.7548122,
        size.width * 0.5365980,
        size.height * 0.7441315,
        size.width * 0.5255704,
        size.height * 0.7376761);
    path_2.cubicTo(
        size.width * 0.5287714,
        size.height * 0.7374800,
        size.width * 0.5463392,
        size.height * 0.7335681,
        size.width * 0.5678417,
        size.height * 0.7335681);
    path_2.cubicTo(
        size.width * 0.5728668,
        size.height * 0.7335681,
        size.width * 0.5799121,
        size.height * 0.7339589,
        size.width * 0.5824020,
        size.height * 0.7347418);
    path_2.cubicTo(
        size.width * 0.5859598,
        size.height * 0.7347418,
        size.width * 0.5935025,
        size.height * 0.7348592,
        size.width * 0.5952085,
        size.height * 0.7353286);
    path_2.cubicTo(
        size.width * 0.5969171,
        size.height * 0.7357981,
        size.width * 0.6001910,
        size.height * 0.7343509,
        size.width * 0.6016131,
        size.height * 0.7335681);
    path_2.lineTo(size.width * 0.6122839, size.height * 0.7335681);
    path_2.cubicTo(
        size.width * 0.6139925,
        size.height * 0.7345070,
        size.width * 0.6158417,
        size.height * 0.7327852,
        size.width * 0.6165528,
        size.height * 0.7318075);
    path_2.cubicTo(
        size.width * 0.6165528,
        size.height * 0.7327465,
        size.width * 0.6215352,
        size.height * 0.7329812,
        size.width * 0.6240251,
        size.height * 0.7329812);
    path_2.cubicTo(
        size.width * 0.6248794,
        size.height * 0.7343897,
        size.width * 0.6307839,
        size.height * 0.7320035,
        size.width * 0.6336307,
        size.height * 0.7306338);
    path_2.close();

    return path_2;
  }

  static Paint path2Fill(Size size) {
    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.shader =
        ui.Gradient.radial(const Offset(0, 0), size.width * 0.002512563, [
      const Color(0xffE1C2A7).withOpacity(1),
      const Color(0xffEED0B7).withOpacity(1),
      const Color(0xffEED0B7).withOpacity(1),
      const Color(0xffD8B289).withOpacity(1),
      const Color(0xffD8B289).withOpacity(1),
      const Color(0xffE1C2A7).withOpacity(1),
      const Color(0xffE1C2A7).withOpacity(1)
    ], [
      0.0682691,
      0.204055,
      0.249485,
      0.367655,
      0.659269,
      0.726339,
      0.957582
    ]);
    return paint2Fill;
  }

  static Path path3(Size size) {
    Path path_3 = Path();
    path_3.moveTo(size.width * 1.035176, size.height * 0.6954554);
    path_3.lineTo(size.width * 1.035176, size.height * 0.5928040);
    path_3.lineTo(size.width * 1.029146, size.height * 0.5922183);
    path_3.cubicTo(
        size.width * 1.028141,
        size.height * 0.5918275,
        size.width * 1.026131,
        size.height * 0.5912793,
        size.width * 1.026131,
        size.height * 0.5922183);
    path_3.cubicTo(
        size.width * 1.026131,
        size.height * 0.5931561,
        size.width * 1.023116,
        size.height * 0.5918275,
        size.width * 1.021608,
        size.height * 0.5910446);
    path_3.lineTo(size.width * 1.020101, size.height * 0.5916315);
    path_3.cubicTo(
        size.width * 1.018593,
        size.height * 0.5920223,
        size.width * 1.015276,
        size.height * 0.5925704,
        size.width * 1.014070,
        size.height * 0.5916315);
    path_3.cubicTo(
        size.width * 1.012864,
        size.height * 0.5906925,
        size.width * 1.010553,
        size.height * 0.5920223,
        size.width * 1.009548,
        size.height * 0.5928052);
    path_3.cubicTo(
        size.width * 1.008040,
        size.height * 0.5926092,
        size.width * 1.005025,
        size.height * 0.5919836,
        size.width * 1.005025,
        size.height * 0.5910446);
    path_3.cubicTo(
        size.width * 1.005025,
        size.height * 0.5901068,
        size.width * 0.9979899,
        size.height * 0.5902629,
        size.width * 0.9944724,
        size.height * 0.5904589);
    path_3.cubicTo(
        size.width * 0.9939698,
        size.height * 0.5904589,
        size.width * 0.9929648,
        size.height * 0.5906925,
        size.width * 0.9929648,
        size.height * 0.5916315);
    path_3.cubicTo(
        size.width * 0.9929648,
        size.height * 0.5925704,
        size.width * 0.9788945,
        size.height * 0.5896761,
        size.width * 0.9718593,
        size.height * 0.5881115);
    path_3.cubicTo(
        size.width * 0.9748744,
        size.height * 0.5892852,
        size.width * 0.9597990,
        size.height * 0.5922183,
        size.width * 0.9643216,
        size.height * 0.5910446);
    path_3.cubicTo(
        size.width * 0.9688442,
        size.height * 0.5898721,
        size.width * 0.9522613,
        size.height * 0.5851796,
        size.width * 0.9507538,
        size.height * 0.5857653);
    path_3.cubicTo(
        size.width * 0.9492462,
        size.height * 0.5863521,
        size.width * 0.9371859,
        size.height * 0.5793134,
        size.width * 0.9371859,
        size.height * 0.5799002);
    path_3.cubicTo(
        size.width * 0.9371859,
        size.height * 0.5804871,
        size.width * 0.9115578,
        size.height * 0.5781408,
        size.width * 0.9100503,
        size.height * 0.5775540);
    path_3.cubicTo(
        size.width * 0.9088442,
        size.height * 0.5770845,
        size.width * 0.9065327,
        size.height * 0.5777488,
        size.width * 0.9055276,
        size.height * 0.5781408);
    path_3.cubicTo(
        size.width * 0.9015075,
        size.height * 0.5777488,
        size.width * 0.8937688,
        size.height * 0.5767324,
        size.width * 0.8949749,
        size.height * 0.5757934);
    path_3.cubicTo(
        size.width * 0.8964824,
        size.height * 0.5746209,
        size.width * 0.8844221,
        size.height * 0.5722746,
        size.width * 0.8829146,
        size.height * 0.5716878);
    path_3.cubicTo(
        size.width * 0.8817085,
        size.height * 0.5712183,
        size.width * 0.8783920,
        size.height * 0.5726655,
        size.width * 0.8768844,
        size.height * 0.5734484);
    path_3.cubicTo(
        size.width * 0.8743719,
        size.height * 0.5732523,
        size.width * 0.8696482,
        size.height * 0.5729789,
        size.width * 0.8708543,
        size.height * 0.5734484);
    path_3.cubicTo(
        size.width * 0.8720603,
        size.height * 0.5739167,
        size.width * 0.8703518,
        size.height * 0.5744249,
        size.width * 0.8693467,
        size.height * 0.5746209);
    path_3.cubicTo(
        size.width * 0.8673367,
        size.height * 0.5746209,
        size.width * 0.8636181,
        size.height * 0.5748556,
        size.width * 0.8648241,
        size.height * 0.5757946);
    path_3.cubicTo(
        size.width * 0.8663317,
        size.height * 0.5769671,
        size.width * 0.8587940,
        size.height * 0.5769671,
        size.width * 0.8587940,
        size.height * 0.5775540);
    path_3.cubicTo(
        size.width * 0.8587940,
        size.height * 0.5780235,
        size.width * 0.8557789,
        size.height * 0.5785317,
        size.width * 0.8542714,
        size.height * 0.5787265);
    path_3.lineTo(size.width * 0.8542714, size.height * 0.5799002);
    path_3.cubicTo(
        size.width * 0.8522613,
        size.height * 0.5804871,
        size.width * 0.8476382,
        size.height * 0.5815423,
        size.width * 0.8452261,
        size.height * 0.5810728);
    path_3.cubicTo(
        size.width * 0.8422111,
        size.height * 0.5804859,
        size.width * 0.8407035,
        size.height * 0.5816596,
        size.width * 0.8391960,
        size.height * 0.5822465);
    path_3.cubicTo(
        size.width * 0.8379899,
        size.height * 0.5827148,
        size.width * 0.8336683,
        size.height * 0.5816596,
        size.width * 0.8316583,
        size.height * 0.5810728);
    path_3.lineTo(size.width * 0.8301508, size.height * 0.5822465);
    path_3.cubicTo(
        size.width * 0.8291457,
        size.height * 0.5826373,
        size.width * 0.8268342,
        size.height * 0.5834190,
        size.width * 0.8256281,
        size.height * 0.5834190);
    path_3.cubicTo(
        size.width * 0.8244221,
        size.height * 0.5834190,
        size.width * 0.8221106,
        size.height * 0.5849836,
        size.width * 0.8211055,
        size.height * 0.5857653);
    path_3.cubicTo(
        size.width * 0.8175879,
        size.height * 0.5857653,
        size.width * 0.8108543,
        size.height * 0.5858826,
        size.width * 0.8120603,
        size.height * 0.5863521);
    path_3.cubicTo(
        size.width * 0.8132663,
        size.height * 0.5868216,
        size.width * 0.8065327,
        size.height * 0.5881115,
        size.width * 0.8030151,
        size.height * 0.5886984);
    path_3.cubicTo(
        size.width * 0.8010050,
        size.height * 0.5888944,
        size.width * 0.7969849,
        size.height * 0.5895200,
        size.width * 0.7969849,
        size.height * 0.5904577);
    path_3.cubicTo(
        size.width * 0.7969849,
        size.height * 0.5913967,
        size.width * 0.7909548,
        size.height * 0.5916315,
        size.width * 0.7879397,
        size.height * 0.5916315);
    path_3.cubicTo(
        size.width * 0.7869347,
        size.height * 0.5918263,
        size.width * 0.7849246,
        size.height * 0.5923345,
        size.width * 0.7849246,
        size.height * 0.5928040);
    path_3.cubicTo(
        size.width * 0.7849246,
        size.height * 0.5932735,
        size.width * 0.7768844,
        size.height * 0.5933908,
        size.width * 0.7728643,
        size.height * 0.5933908);
    path_3.cubicTo(
        size.width * 0.7718593,
        size.height * 0.5939777,
        size.width * 0.7698492,
        size.height * 0.5953850,
        size.width * 0.7698492,
        size.height * 0.5963239);
    path_3.cubicTo(
        size.width * 0.7698492,
        size.height * 0.5972617,
        size.width * 0.7648241,
        size.height * 0.5974965,
        size.width * 0.7623116,
        size.height * 0.5974965);
    path_3.cubicTo(
        size.width * 0.7613065,
        size.height * 0.5974965,
        size.width * 0.7595980,
        size.height * 0.5977312,
        size.width * 0.7608040,
        size.height * 0.5986702);
    path_3.cubicTo(
        size.width * 0.7623116,
        size.height * 0.5998427,
        size.width * 0.7336683,
        size.height * 0.6057089,
        size.width * 0.7321608,
        size.height * 0.6057089);
    path_3.cubicTo(
        size.width * 0.7306533,
        size.height * 0.6057089,
        size.width * 0.7246231,
        size.height * 0.6104014,
        size.width * 0.7246231,
        size.height * 0.6115751);
    path_3.cubicTo(
        size.width * 0.7246231,
        size.height * 0.6127477,
        size.width * 0.7065327,
        size.height * 0.6133345,
        size.width * 0.7065327,
        size.height * 0.6139214);
    path_3.cubicTo(
        size.width * 0.7065327,
        size.height * 0.6143908,
        size.width * 0.6954774,
        size.height * 0.6164624,
        size.width * 0.6899497,
        size.height * 0.6174401);
    path_3.cubicTo(
        size.width * 0.6864322,
        size.height * 0.6193955,
        size.width * 0.6790955,
        size.height * 0.6233063,
        size.width * 0.6778894,
        size.height * 0.6233063);
    path_3.cubicTo(
        size.width * 0.6763819,
        size.height * 0.6233063,
        size.width * 0.6748744,
        size.height * 0.6297582,
        size.width * 0.6733668,
        size.height * 0.6303451);
    path_3.cubicTo(
        size.width * 0.6718593,
        size.height * 0.6309319,
        size.width * 0.6628141,
        size.height * 0.6338650,
        size.width * 0.6643216,
        size.height * 0.6350376);
    path_3.cubicTo(
        size.width * 0.6655276,
        size.height * 0.6359765,
        size.width * 0.6507538,
        size.height * 0.6416854,
        size.width * 0.6432161,
        size.height * 0.6444237);
    path_3.cubicTo(
        size.width * 0.6432161,
        size.height * 0.6467700,
        size.width * 0.6100503,
        size.height * 0.6526350,
        size.width * 0.6100503,
        size.height * 0.6532218);
    path_3.cubicTo(
        size.width * 0.6100503,
        size.height * 0.6538087,
        size.width * 0.6045226,
        size.height * 0.6572770,
        size.width * 0.6030151,
        size.height * 0.6566901);
    path_3.cubicTo(
        size.width * 0.6015075,
        size.height * 0.6561033,
        size.width * 0.5919598,
        size.height * 0.6602606,
        size.width * 0.5934673,
        size.height * 0.6602606);
    path_3.cubicTo(
        size.width * 0.5949749,
        size.height * 0.6602606,
        size.width * 0.5919598,
        size.height * 0.6643674,
        size.width * 0.5919598,
        size.height * 0.6649531);
    path_3.cubicTo(
        size.width * 0.5919598,
        size.height * 0.6654225,
        size.width * 0.5839196,
        size.height * 0.6659308,
        size.width * 0.5798995,
        size.height * 0.6661268);
    path_3.cubicTo(
        size.width * 0.5798995,
        size.height * 0.6665962,
        size.width * 0.5738693,
        size.height * 0.6678862,
        size.width * 0.5708543,
        size.height * 0.6684730);
    path_3.cubicTo(
        size.width * 0.5668342,
        size.height * 0.6704284,
        size.width * 0.5581910,
        size.height * 0.6742218,
        size.width * 0.5557789,
        size.height * 0.6737523);
    path_3.cubicTo(
        size.width * 0.5533668,
        size.height * 0.6732829,
        size.width * 0.5505025,
        size.height * 0.6787958,
        size.width * 0.5464824,
        size.height * 0.6813380);
    path_3.lineTo(size.width * 0.5427136, size.height * 0.6854460);
    path_3.lineTo(size.width * 0.5407035, size.height * 0.6877934);
    path_3.lineTo(size.width * 0.5402010, size.height * 0.6901408);
    path_3.lineTo(size.width * 0.5407035, size.height * 0.6919014);
    path_3.cubicTo(
        size.width * 0.5437186,
        size.height * 0.6928791,
        size.width * 0.5394975,
        size.height * 0.6936620,
        size.width * 0.5407035,
        size.height * 0.6936620);
    path_3.cubicTo(
        size.width * 0.5419095,
        size.height * 0.6936620,
        size.width * 0.5369347,
        size.height * 0.6946408,
        size.width * 0.5364322,
        size.height * 0.6960094);
    path_3.lineTo(size.width * 0.5351759, size.height * 0.6977700);
    path_3.cubicTo(
        size.width * 0.5336683,
        size.height * 0.6987477,
        size.width * 0.5351256,
        size.height * 0.6995305,
        size.width * 0.5339196,
        size.height * 0.6995305);
    path_3.cubicTo(
        size.width * 0.5327136,
        size.height * 0.6995305,
        size.width * 0.5271357,
        size.height * 0.7024648,
        size.width * 0.5276382,
        size.height * 0.7036385);
    path_3.cubicTo(
        size.width * 0.5266332,
        size.height * 0.7038345,
        size.width * 0.5163819,
        size.height * 0.7084507,
        size.width * 0.5175879,
        size.height * 0.7089202);
    path_3.cubicTo(
        size.width * 0.5187940,
        size.height * 0.7093897,
        size.width * 0.4957286,
        size.height * 0.7181150,
        size.width * 0.4962312,
        size.height * 0.7188967);
    path_3.cubicTo(
        size.width * 0.4998492,
        size.height * 0.7203040,
        size.width * 0.4595477,
        size.height * 0.7284824,
        size.width * 0.4535176,
        size.height * 0.7294601);
    path_3.cubicTo(
        size.width * 0.4535176,
        size.height * 0.7313369,
        size.width * 0.5939698,
        size.height * 0.7210692,
        size.width * 0.6296482,
        size.height * 0.7241972);
    path_3.cubicTo(
        size.width * 0.6392965,
        size.height * 0.7349906,
        size.width * 0.7080402,
        size.height * 0.7341690,
        size.width * 0.7412060,
        size.height * 0.7324096);
    path_3.cubicTo(
        size.width * 0.7472362,
        size.height * 0.7366326,
        size.width * 0.8030151,
        size.height * 0.7341690,
        size.width * 0.8301508,
        size.height * 0.7324096);
    path_3.cubicTo(
        size.width * 0.8325628,
        size.height * 0.7352254,
        size.width * 0.8763819,
        size.height * 0.7335833,
        size.width * 0.8979899,
        size.height * 0.7324096);
    path_3.cubicTo(
        size.width * 0.9004020,
        size.height * 0.7347559,
        size.width * 0.9432161,
        size.height * 0.7251749,
        size.width * 0.9643216,
        size.height * 0.7200915);
    path_3.cubicTo(
        size.width * 0.9715578,
        size.height * 0.7224378,
        size.width * 1.014573,
        size.height * 0.7046455,
        size.width * 1.035176,
        size.height * 0.6954554);
    path_3.close();
    return path_3;
  }

  static Paint path3Fill(Size size) {
    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xffD8B289).withOpacity(1.0);
    return paint3Fill;
  }

  static Path path4(Size size) {
    Path path4 = Path();
    path4.moveTo(size.width * 0.05999698, size.height * 0.6003521);
    path4.lineTo(size.width * 0.007537688, size.height * 0.5927230);
    path4.lineTo(size.width * 0.007537688, size.height * 0.6384977);
    path4.lineTo(size.width * 0.1055276, size.height * 0.6384977);
    path4.lineTo(size.width * 0.1055276, size.height * 0.6226526);
    path4.lineTo(size.width * 0.1025583, size.height * 0.6185446);
    path4.cubicTo(
        size.width * 0.1002487,
        size.height * 0.6179577,
        size.width * 0.09543166,
        size.height * 0.6169014,
        size.width * 0.09463995,
        size.height * 0.6173709);
    path4.cubicTo(
        size.width * 0.09384799,
        size.height * 0.6178404,
        size.width * 0.08573166,
        size.height * 0.6152195,
        size.width * 0.08177261,
        size.height * 0.6138498);
    path4.cubicTo(
        size.width * 0.08078266,
        size.height * 0.6116984,
        size.width * 0.07880302,
        size.height * 0.6070423,
        size.width * 0.07880302,
        size.height * 0.6056338);
    path4.cubicTo(
        size.width * 0.07880302,
        size.height * 0.6042254,
        size.width * 0.07484397,
        size.height * 0.6038732,
        size.width * 0.07286432,
        size.height * 0.6038732);
    path4.lineTo(size.width * 0.06890503, size.height * 0.6044601);
    path4.lineTo(size.width * 0.05999698, size.height * 0.6003521);
    path4.close();
    return path4;
  }

  static Paint path4Fill(Size size) {
    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xffD8BBA0).withOpacity(1.0);
    return paint4Fill;
  }

  static Path path5(Size size) {
    Path path5 = Path();
    path5.moveTo(size.width * 0.01005025, size.height * 0.5976772);
    path5.lineTo(size.width * 0.01005025, size.height * 0.5753768);
    path5.cubicTo(
        size.width * 0.01005025,
        size.height * 0.5749073,
        size.width * 0.01172530,
        size.height * 0.5751808,
        size.width * 0.01256281,
        size.height * 0.5753768);
    path5.cubicTo(
        size.width * 0.01055276,
        size.height * 0.5753768,
        size.width * 0.01172530,
        size.height * 0.5792887,
        size.width * 0.01256281,
        size.height * 0.5812453);
    path5.cubicTo(
        size.width * 0.01130653,
        size.height * 0.5830059,
        size.width * 0.01633166,
        size.height * 0.5830059,
        size.width * 0.01633166,
        size.height * 0.5835927);
    path5.cubicTo(
        size.width * 0.01633166,
        size.height * 0.5841796,
        size.width * 0.02386935,
        size.height * 0.5841796,
        size.width * 0.02512563,
        size.height * 0.5841796);
    path5.cubicTo(
        size.width * 0.02613065,
        size.height * 0.5841796,
        size.width * 0.03056960,
        size.height * 0.5837876,
        size.width * 0.03266332,
        size.height * 0.5835927);
    path5.cubicTo(
        size.width * 0.03433844,
        size.height * 0.5835927,
        size.width * 0.03793970,
        size.height * 0.5840622,
        size.width * 0.03894472,
        size.height * 0.5859401);
    path5.cubicTo(
        size.width * 0.03994975,
        size.height * 0.5878181,
        size.width * 0.04773869,
        size.height * 0.5914167,
        size.width * 0.05150754,
        size.height * 0.5929824);
    path5.cubicTo(
        size.width * 0.05050251,
        size.height * 0.5939214,
        size.width * 0.05862638,
        size.height * 0.5961127,
        size.width * 0.06281407,
        size.height * 0.5970904);
    path5.cubicTo(
        size.width * 0.06281407,
        size.height * 0.5984988,
        size.width * 0.07035176,
        size.height * 0.5996338,
        size.width * 0.07412060,
        size.height * 0.6000246);
    path5.cubicTo(
        size.width * 0.07211055,
        size.height * 0.6009636,
        size.width * 0.07663317,
        size.height * 0.6027629,
        size.width * 0.07914573,
        size.height * 0.6035458);
    path5.cubicTo(
        size.width * 0.07814070,
        size.height * 0.6040153,
        size.width * 0.08123945,
        size.height * 0.6053063,
        size.width * 0.08291457,
        size.height * 0.6058932);
    path5.cubicTo(
        size.width * 0.08190955,
        size.height * 0.6063627,
        size.width * 0.08584598,
        size.height * 0.6076538,
        size.width * 0.08793970,
        size.height * 0.6082406);
    path5.cubicTo(
        size.width * 0.08793970,
        size.height * 0.6087101,
        size.width * 0.09128970,
        size.height * 0.6088275,
        size.width * 0.09296482,
        size.height * 0.6088275);
    path5.cubicTo(
        size.width * 0.09296482,
        size.height * 0.6092969,
        size.width * 0.08793970,
        size.height * 0.6101972,
        size.width * 0.08542714,
        size.height * 0.6105880);
    path5.cubicTo(
        size.width * 0.08442211,
        size.height * 0.6110575,
        size.width * 0.08082085,
        size.height * 0.6076538,
        size.width * 0.07914573,
        size.height * 0.6058932);
    path5.cubicTo(
        size.width * 0.07412060,
        size.height * 0.6029589,
        size.width * 0.07160804,
        size.height * 0.6105880,
        size.width * 0.06909548,
        size.height * 0.6105880);
    path5.cubicTo(
        size.width * 0.06708543,
        size.height * 0.6105880,
        size.width * 0.06658291,
        size.height * 0.6094143,
        size.width * 0.06658291,
        size.height * 0.6088275);
    path5.lineTo(size.width * 0.06030151, size.height * 0.6111749);
    path5.cubicTo(
        size.width * 0.05067010,
        size.height * 0.6098052,
        size.width * 0.03140704,
        size.height * 0.6065974,
        size.width * 0.03140704,
        size.height * 0.6047195);
    path5.cubicTo(
        size.width * 0.03140704,
        size.height * 0.6028415,
        size.width * 0.01716917,
        size.height * 0.5992418,
        size.width * 0.01005025,
        size.height * 0.5976772);
    path5.close();
    return path5;
  }

  static Paint path5Fill(Size size) {
    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xffCAAB89).withOpacity(1.0);
    return paint5Fill;
  }

  static Path path6(Size size) {
    Path path6 = Path();
    path6.moveTo(size.width * 0.02009060, size.height * 0.6085775);
    path6.cubicTo(
        size.width * 0.01908658,
        size.height * 0.6081420,
        size.width * 0.01297869,
        size.height * 0.6098474,
        size.width * 0.01005025,
        size.height * 0.6107559);
    path6.lineTo(size.width * 0.01005025, size.height * 0.6842723);
    path6.lineTo(size.width * 0.1556357, size.height * 0.6842723);
    path6.lineTo(size.width * 0.2449749, size.height * 0.6561033);
    path6.lineTo(size.width * 0.1922111, size.height * 0.6464202);
    path6.lineTo(size.width * 0.1721106, size.height * 0.6384977);
    path6.lineTo(size.width * 0.1545226, size.height * 0.6291080);
    path6.cubicTo(
        size.width * 0.1582877,
        size.height * 0.6291080,
        size.width * 0.09045226,
        size.height * 0.6073944,
        size.width * 0.07029246,
        size.height * 0.6025869);
    path6.cubicTo(
        size.width * 0.06326432,
        size.height * 0.5977946,
        size.width * 0.03389623,
        size.height * 0.6045833,
        size.width * 0.02009060,
        size.height * 0.6085775);
    path6.close();
    return path6;
  }

  static Paint path6Fill(Size size) {
    Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.shader = ui.Gradient.linear(
        Offset(size.width * -0.1410221, size.height * 1.055181),
        Offset(size.width * -33.52965, size.height * -17.11866), [
      const Color(0xffE4C2A2).withOpacity(1),
      const Color(0xffD2B08C).withOpacity(1),
      const Color(0xffCAAB89).withOpacity(1)
    ], [
      0.197565,
      0.522581,
      0.802912
    ]);
    return paint6Fill;
  }

  static Path path7(Size size) {
    Path path7 = Path();
    path7.moveTo(size.width * 0.6306533, size.height * 0.7910798);
    path7.lineTo(size.width * 0.01005025, size.height * 0.7910798);
    path7.lineTo(size.width * 0.01005025, size.height * 0.6566901);
    path7.cubicTo(
        size.width * 0.01381910,
        size.height * 0.6553204,
        size.width * 0.02185930,
        size.height * 0.6525822,
        size.width * 0.02386935,
        size.height * 0.6525822);
    path7.cubicTo(
        size.width * 0.02638191,
        size.height * 0.6525822,
        size.width * 0.03266332,
        size.height * 0.6549296,
        size.width * 0.03391960,
        size.height * 0.6555164);
    path7.cubicTo(
        size.width * 0.03517588,
        size.height * 0.6561033,
        size.width * 0.05527638,
        size.height * 0.6478873,
        size.width * 0.05778894,
        size.height * 0.6473005);
    path7.cubicTo(
        size.width * 0.06030151,
        size.height * 0.6467136,
        size.width * 0.06532663,
        size.height * 0.6496479,
        size.width * 0.06658291,
        size.height * 0.6508216);
    path7.cubicTo(
        size.width * 0.06783920,
        size.height * 0.6519953,
        size.width * 0.08040201,
        size.height * 0.6490610,
        size.width * 0.08165829,
        size.height * 0.6484742);
    path7.cubicTo(
        size.width * 0.08291457,
        size.height * 0.6478873,
        size.width * 0.09422111,
        size.height * 0.6514085,
        size.width * 0.09547739,
        size.height * 0.6519953);
    path7.cubicTo(
        size.width * 0.09673367,
        size.height * 0.6525822,
        size.width * 0.1030151,
        size.height * 0.6502347,
        size.width * 0.1067839,
        size.height * 0.6496479);
    path7.cubicTo(
        size.width * 0.1097990,
        size.height * 0.6491784,
        size.width * 0.1147405,
        size.height * 0.6510176,
        size.width * 0.1168342,
        size.height * 0.6519953);
    path7.cubicTo(
        size.width * 0.1222781,
        size.height * 0.6517993,
        size.width * 0.1331658,
        size.height * 0.6516432,
        size.width * 0.1331658,
        size.height * 0.6525822);
    path7.cubicTo(
        size.width * 0.1331658,
        size.height * 0.6535211,
        size.width * 0.1515912,
        size.height * 0.6561033,
        size.width * 0.1608040,
        size.height * 0.6572770);
    path7.cubicTo(
        size.width * 0.1608040,
        size.height * 0.6577465,
        size.width * 0.1733668,
        size.height * 0.6562993,
        size.width * 0.1796482,
        size.height * 0.6555164);
    path7.cubicTo(
        size.width * 0.1786432,
        size.height * 0.6559859,
        size.width * 0.1850922,
        size.height * 0.6572770,
        size.width * 0.1884422,
        size.height * 0.6578638);
    path7.cubicTo(
        size.width * 0.1894472,
        size.height * 0.6583333,
        size.width * 0.1989113,
        size.height * 0.6564941,
        size.width * 0.2035176,
        size.height * 0.6555164);
    path7.cubicTo(
        size.width * 0.2045226,
        size.height * 0.6550469,
        size.width * 0.2123116,
        size.height * 0.6584507,
        size.width * 0.2160804,
        size.height * 0.6602113);
    path7.cubicTo(
        size.width * 0.2160804,
        size.height * 0.6606808,
        size.width * 0.2219430,
        size.height * 0.6596244,
        size.width * 0.2248744,
        size.height * 0.6590376);
    path7.cubicTo(
        size.width * 0.2257118,
        size.height * 0.6580599,
        size.width * 0.2273869,
        size.height * 0.6559859,
        size.width * 0.2273869,
        size.height * 0.6555164);
    path7.cubicTo(
        size.width * 0.2273869,
        size.height * 0.6550469,
        size.width * 0.2332495,
        size.height * 0.6561033,
        size.width * 0.2361809,
        size.height * 0.6566901);
    path7.cubicTo(
        size.width * 0.2361809,
        size.height * 0.6572770,
        size.width * 0.2424623,
        size.height * 0.6561033,
        size.width * 0.2449749,
        size.height * 0.6561033);
    path7.cubicTo(
        size.width * 0.2469849,
        size.height * 0.6561033,
        size.width * 0.2525126,
        size.height * 0.6592336,
        size.width * 0.2550251,
        size.height * 0.6607981);
    path7.cubicTo(
        size.width * 0.2670854,
        size.height * 0.6622066,
        size.width * 0.2851759,
        size.height * 0.6672535,
        size.width * 0.2927136,
        size.height * 0.6696009);
    path7.cubicTo(
        size.width * 0.2927136,
        size.height * 0.6700704,
        size.width * 0.3061131,
        size.height * 0.6756655,
        size.width * 0.3128141,
        size.height * 0.6784038);
    path7.cubicTo(
        size.width * 0.3148241,
        size.height * 0.6793427,
        size.width * 0.3186759,
        size.height * 0.6780129,
        size.width * 0.3203518,
        size.height * 0.6772300);
    path7.cubicTo(
        size.width * 0.3299824,
        size.height * 0.6793815,
        size.width * 0.3487437,
        size.height * 0.6842723,
        size.width * 0.3467337,
        size.height * 0.6866197);
    path7.cubicTo(
        size.width * 0.3447236,
        size.height * 0.6889671,
        size.width * 0.3676709,
        size.height * 0.7020739,
        size.width * 0.3793970,
        size.height * 0.7083333);
    path7.cubicTo(
        size.width * 0.3773869,
        size.height * 0.7097418,
        size.width * 0.4070352,
        size.height * 0.7206573,
        size.width * 0.4221106,
        size.height * 0.7259390);
    path7.cubicTo(
        size.width * 0.4242035,
        size.height * 0.7257430,
        size.width * 0.4281407,
        size.height * 0.7255869,
        size.width * 0.4271357,
        size.height * 0.7265258);
    path7.cubicTo(
        size.width * 0.4261307,
        size.height * 0.7274648,
        size.width * 0.4434673,
        size.height * 0.7280904,
        size.width * 0.4522613,
        size.height * 0.7282864);
    path7.cubicTo(
        size.width * 0.4539372,
        size.height * 0.7276995,
        size.width * 0.4575377,
        size.height * 0.7266432,
        size.width * 0.4585427,
        size.height * 0.7271127);
    path7.cubicTo(
        size.width * 0.4595477,
        size.height * 0.7275822,
        size.width * 0.4656608,
        size.height * 0.7261350,
        size.width * 0.4685930,
        size.height * 0.7253521);
    path7.lineTo(size.width * 0.4723618, size.height * 0.7253521);
    path7.lineTo(size.width * 0.6306533, size.height * 0.7535211);
    path7.lineTo(size.width * 0.6306533, size.height * 0.7910798);
    path7.close();
    return path7;
  }

  static Paint path7Fill(Size size) {
    Paint paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.2038864, size.height * 1.456948),
        Offset(size.width * -176.2558, size.height * 0.2596209), [
      const Color(0xffEED0B7).withOpacity(1),
      const Color(0xffE4C2A2).withOpacity(1),
      const Color(0xffDAB58E).withOpacity(1)
    ], [
      0.215059,
      0.538092,
      0.941587
    ]);
    return paint7Fill;
  }

  static Path path8(Size size) {
    Path path8 = Path();
    path8.moveTo(size.width * 0.2618794, size.height * 0.7758216);
    path8.cubicTo(
        size.width * 0.2618794,
        size.height * 0.7744519,
        size.width * 0.2610678,
        size.height * 0.7714789,
        size.width * 0.2578241,
        size.height * 0.7705399);
    path8.cubicTo(
        size.width * 0.2545804,
        size.height * 0.7696009,
        size.width * 0.2537688,
        size.height * 0.7685833,
        size.width * 0.2537688,
        size.height * 0.7681925);
    path8.cubicTo(
        size.width * 0.2977387,
        size.height * 0.7593897,
        size.width * 0.4009874,
        size.height * 0.7707746,
        size.width * 0.3896307,
        size.height * 0.7646714);
    path8.cubicTo(
        size.width * 0.3782764,
        size.height * 0.7585681,
        size.width * 0.3957136,
        size.height * 0.7613451,
        size.width * 0.4058543,
        size.height * 0.7634977);
    path8.cubicTo(
        size.width * 0.4308618,
        size.height * 0.7648662,
        size.width * 0.4812864,
        size.height * 0.7670188,
        size.width * 0.4829095,
        size.height * 0.7646714);
    path8.cubicTo(
        size.width * 0.5126508,
        size.height * 0.7621279,
        size.width * 0.5717261,
        size.height * 0.7564542,
        size.width * 0.5701055,
        size.height * 0.7541068);
    path8.cubicTo(
        size.width * 0.5684824,
        size.height * 0.7517594,
        size.width * 0.5748367,
        size.height * 0.7519554,
        size.width * 0.5782161,
        size.height * 0.7523462);
    path8.cubicTo(
        size.width * 0.5836231,
        size.height * 0.7535200,
        size.width * 0.5944372,
        size.height * 0.7556338,
        size.width * 0.5944372,
        size.height * 0.7546948);
    path8.cubicTo(
        size.width * 0.6072814,
        size.height * 0.7556725,
        size.width * 0.6333719,
        size.height * 0.7573944,
        size.width * 0.6349950,
        size.height * 0.7564554);
    path8.cubicTo(
        size.width * 0.6701432,
        size.height * 0.7580200,
        size.width * 0.7388166,
        size.height * 0.7593897,
        size.width * 0.7323291,
        size.height * 0.7523474);
    path8.cubicTo(
        size.width * 0.7451709,
        size.height * 0.7505869,
        size.width * 0.7712613,
        size.height * 0.7481221,
        size.width * 0.7728844,
        size.height * 0.7523474);
    path8.cubicTo(
        size.width * 0.7830226,
        size.height * 0.7511725,
        size.width * 0.8041131,
        size.height * 0.7490599,
        size.width * 0.8073568,
        size.height * 0.7499988);
    path8.cubicTo(
        size.width * 0.8168191,
        size.height * 0.7492160,
        size.width * 0.8357462,
        size.height * 0.7481197,
        size.width * 0.8357462,
        size.height * 0.7499988);
    path8.cubicTo(
        size.width * 0.8357462,
        size.height * 0.7522218,
        size.width * 1.002912,
        size.height * 0.7270998,
        size.width * 1.012163,
        size.height * 0.7174413);
    path8.lineTo(size.width * 1.012163, size.height * 0.7159624);
    path8.cubicTo(
        size.width * 1.012706,
        size.height * 0.7164014,
        size.width * 1.012686,
        size.height * 0.7168967,
        size.width * 1.012163,
        size.height * 0.7174413);
    path8.lineTo(size.width * 1.012163, size.height * 0.8438967);
    path8.lineTo(size.width * 0.2618794, size.height * 0.8438967);
    path8.lineTo(size.width * 0.2618794, size.height * 0.7758216);
    path8.close();
    return path8;
  }

  static Paint path8Fill(Size size) {
    Paint paint8Fill = Paint()..style = PaintingStyle.fill;
    paint8Fill.shader =
        ui.Gradient.radial(const Offset(0, 0), size.width * 0.002512563, [
      const Color(0xffE1C2A7).withOpacity(1),
      const Color(0xffF1E1D4).withOpacity(1),
      const Color(0xffF1E1D4).withOpacity(1),
      const Color(0xffF1E1D4).withOpacity(1),
      const Color(0xffEED0B7).withOpacity(1)
    ], [
      0.125459,
      0.32309,
      0.500926,
      0.654283,
      0.717413
    ]);
    return paint8Fill;
  }

  static Path path9(Size size) {
    Path path9 = Path();
    path9.moveTo(size.width * 0.1557789, size.height * 0.7280176);
    path9.cubicTo(
        size.width * 0.1336683,
        size.height * 0.7186279,
        size.width * 0.05025126,
        size.height * 0.7561866,
        size.width * 0.03517588,
        size.height * 0.7673369);
    path9.lineTo(size.width * 0.01005025, size.height * 0.7790739);
    path9.lineTo(size.width * 0.01005025, size.height * 0.8559519);
    path9.lineTo(size.width * 0.9899497, size.height * 0.8559519);
    path9.lineTo(size.width * 0.9899497, size.height * 0.7732054);
    path9.cubicTo(
        size.width * 0.9899497,
        size.height * 0.7737923,
        size.width * 0.9635678,
        size.height * 0.7737923,
        size.width * 0.9497487,
        size.height * 0.7714448);
    path9.cubicTo(
        size.width * 0.9359296,
        size.height * 0.7690974,
        size.width * 0.8932161,
        size.height * 0.7861162,
        size.width * 0.8894472,
        size.height * 0.7884636);
    path9.cubicTo(
        size.width * 0.8856784,
        size.height * 0.7908110,
        size.width * 0.8555276,
        size.height * 0.7820082,
        size.width * 0.8542714,
        size.height * 0.7814214);
    path9.cubicTo(
        size.width * 0.8530151,
        size.height * 0.7808345,
        size.width * 0.7964824,
        size.height * 0.7831819,
        size.width * 0.7964824,
        size.height * 0.7849425);
    path9.cubicTo(
        size.width * 0.7964824,
        size.height * 0.7863509,
        size.width * 0.7747060,
        size.height * 0.7863122,
        size.width * 0.7638191,
        size.height * 0.7861162);
    path9.cubicTo(
        size.width * 0.7546055,
        size.height * 0.7851385,
        size.width * 0.7361809,
        size.height * 0.7835340,
        size.width * 0.7361809,
        size.height * 0.7849425);
    path9.cubicTo(
        size.width * 0.7361809,
        size.height * 0.7863509,
        size.width * 0.7211055,
        size.height * 0.7902242,
        size.width * 0.7135678,
        size.height * 0.7919847);
    path9.cubicTo(
        size.width * 0.7125628,
        size.height * 0.7933932,
        size.width * 0.6846734,
        size.height * 0.7847477,
        size.width * 0.6708543,
        size.height * 0.7802477);
    path9.cubicTo(
        size.width * 0.6708543,
        size.height * 0.7769613,
        size.width * 0.6541030,
        size.height * 0.7749660,
        size.width * 0.6457286,
        size.height * 0.7743791);
    path9.cubicTo(
        size.width * 0.6398668,
        size.height * 0.7732054,
        size.width * 0.6273869,
        size.height * 0.7715622,
        size.width * 0.6243719,
        size.height * 0.7743791);
    path9.cubicTo(
        size.width * 0.6213568,
        size.height * 0.7771960,
        size.width * 0.6088769,
        size.height * 0.7767265,
        size.width * 0.6030151,
        size.height * 0.7761397);
    path9.cubicTo(
        size.width * 0.5950578,
        size.height * 0.7728146,
        size.width * 0.5791457,
        size.height * 0.7675716,
        size.width * 0.5791457,
        size.height * 0.7732054);
    path9.cubicTo(
        size.width * 0.5791457,
        size.height * 0.7802477,
        size.width * 0.4246231,
        size.height * 0.7837688,
        size.width * 0.4221106,
        size.height * 0.7855293);
    path9.cubicTo(
        size.width * 0.4195980,
        size.height * 0.7872899,
        size.width * 0.3944724,
        size.height * 0.7831819,
        size.width * 0.3944724,
        size.height * 0.7837688);
    path9.cubicTo(
        size.width * 0.3944724,
        size.height * 0.7843556,
        size.width * 0.3806533,
        size.height * 0.7825951,
        size.width * 0.3793970,
        size.height * 0.7814214);
    path9.cubicTo(
        size.width * 0.3781407,
        size.height * 0.7802477,
        size.width * 0.3580402,
        size.height * 0.7749660,
        size.width * 0.3567839,
        size.height * 0.7755528);
    path9.cubicTo(
        size.width * 0.3555276,
        size.height * 0.7761397,
        size.width * 0.3454774,
        size.height * 0.7743791,
        size.width * 0.3442211,
        size.height * 0.7743791);
    path9.cubicTo(
        size.width * 0.3432161,
        size.height * 0.7743791,
        size.width * 0.3412889,
        size.height * 0.7735974,
        size.width * 0.3404523,
        size.height * 0.7732054);
    path9.cubicTo(
        size.width * 0.3371030,
        size.height * 0.7732054,
        size.width * 0.3293970,
        size.height * 0.7736749,
        size.width * 0.3253769,
        size.height * 0.7755528);
    path9.cubicTo(
        size.width * 0.3203518,
        size.height * 0.7779002,
        size.width * 0.2738693,
        size.height * 0.7673369,
        size.width * 0.2713568,
        size.height * 0.7661631);
    path9.cubicTo(
        size.width * 0.2688442,
        size.height * 0.7649894,
        size.width * 0.2512563,
        size.height * 0.7685106,
        size.width * 0.2487437,
        size.height * 0.7685106);
    path9.cubicTo(
        size.width * 0.2462312,
        size.height * 0.7685106,
        size.width * 0.2412060,
        size.height * 0.7644026,
        size.width * 0.2386935,
        size.height * 0.7661631);
    path9.cubicTo(
        size.width * 0.2366834,
        size.height * 0.7675716,
        size.width * 0.2294807,
        size.height * 0.7683157,
        size.width * 0.2261307,
        size.height * 0.7685106);
    path9.cubicTo(
        size.width * 0.2231992,
        size.height * 0.7681197,
        size.width * 0.2170854,
        size.height * 0.7671021,
        size.width * 0.2160804,
        size.height * 0.7661631);
    path9.cubicTo(
        size.width * 0.2150754,
        size.height * 0.7652242,
        size.width * 0.2089616,
        size.height * 0.7665552,
        size.width * 0.2060302,
        size.height * 0.7673369);
    path9.cubicTo(
        size.width * 0.1929648,
        size.height * 0.7781350,
        size.width * 0.1670854,
        size.height * 0.7456232,
        size.width * 0.1557789,
        size.height * 0.7280176);
    path9.close();
    return path9;
  }

  static Paint path9Fill(Size size) {
    Paint paint9Fill = Paint()..style = PaintingStyle.fill;
    paint9Fill.shader =
        ui.Gradient.radial(const Offset(0, 0), size.width * 0.002512563, [
      const Color(0xffEED0B7).withOpacity(1),
      const Color(0xffF1E1D4).withOpacity(1),
      const Color(0xffEAD6C5).withOpacity(1)
    ], [
      0.220979,
      0.536975,
      0.999207
    ]);
    return paint9Fill;
  }

  static Path path10(Size size) {
    Path path10 = Path();
    path10.moveTo(size.width * 0.08668342, size.height * 0.7648603);
    path10.cubicTo(
        size.width * 0.06959799,
        size.height * 0.7479026,
        size.width * 0.02889447,
        size.height * 0.7673674,
        size.width * 0.01005025,
        size.height * 0.7792195);
    path10.lineTo(size.width * 0.01005025, size.height * 0.9084507);
    path10.lineTo(size.width * 0.9899497, size.height * 0.9043486);
    path10.lineTo(size.width * 0.9899497, size.height * 0.8277664);
    path10.cubicTo(
        size.width * 0.9849246,
        size.height * 0.8236643,
        size.width * 0.9610553,
        size.height * 0.8393908,
        size.width * 0.9497487,
        size.height * 0.8393908);
    path10.cubicTo(
        size.width * 0.9407035,
        size.height * 0.8393908,
        size.width * 0.9396985,
        size.height * 0.8298181,
        size.width * 0.9321608,
        size.height * 0.8229800);
    path10.cubicTo(
        size.width * 0.9321608,
        size.height * 0.8188779,
        size.width * 0.8816583,
        size.height * 0.8220223,
        size.width * 0.8655779,
        size.height * 0.8181937);
    path10.cubicTo(
        size.width * 0.8454774,
        size.height * 0.8134073,
        size.width * 0.7701005,
        size.height * 0.8434930,
        size.width * 0.7600503,
        size.height * 0.8428087);
    path10.cubicTo(
        size.width * 0.7520101,
        size.height * 0.8422617,
        size.width * 0.7190126,
        size.height * 0.8471397,
        size.width * 0.7035176,
        size.height * 0.8496467);
    path10.cubicTo(
        size.width * 0.6955603,
        size.height * 0.8487347,
        size.width * 0.6796482,
        size.height * 0.8474589,
        size.width * 0.6796482,
        size.height * 0.8496467);
    path10.cubicTo(
        size.width * 0.6796482,
        size.height * 0.8518345,
        size.width * 0.6712739,
        size.height * 0.8487347,
        size.width * 0.6670854,
        size.height * 0.8469120);
    path10.cubicTo(
        size.width * 0.6649925,
        size.height * 0.8471397,
        size.width * 0.6597990,
        size.height * 0.8480059,
        size.width * 0.6557789,
        size.height * 0.8496467);
    path10.cubicTo(
        size.width * 0.6517588,
        size.height * 0.8512876,
        size.width * 0.6348417,
        size.height * 0.8434930,
        size.width * 0.6268844,
        size.height * 0.8393908);
    path10.cubicTo(
        size.width * 0.6072035,
        size.height * 0.8346045,
        size.width * 0.5678392,
        size.height * 0.8246209,
        size.width * 0.5678392,
        size.height * 0.8229800);
    path10.cubicTo(
        size.width * 0.5678392,
        size.height * 0.8209284,
        size.width * 0.5326633,
        size.height * 0.8195610,
        size.width * 0.5326633,
        size.height * 0.8202453);
    path10.cubicTo(
        size.width * 0.5326633,
        size.height * 0.8207923,
        size.width * 0.5259623,
        size.height * 0.8200176,
        size.width * 0.5226131,
        size.height * 0.8195610);
    path10.cubicTo(
        size.width * 0.5216080,
        size.height * 0.8173732,
        size.width * 0.5062814,
        size.height * 0.8191056,
        size.width * 0.4987437,
        size.height * 0.8202453);
    path10.cubicTo(
        size.width * 0.4967337,
        size.height * 0.8196984,
        size.width * 0.4828317,
        size.height * 0.8200176,
        size.width * 0.4761307,
        size.height * 0.8202453);
    path10.cubicTo(
        size.width * 0.4665000,
        size.height * 0.8186491,
        size.width * 0.4467337,
        size.height * 0.8154589,
        size.width * 0.4447236,
        size.height * 0.8154589);
    path10.cubicTo(
        size.width * 0.4422111,
        size.height * 0.8154589,
        size.width * 0.4359296,
        size.height * 0.8188779,
        size.width * 0.4346734,
        size.height * 0.8181937);
    path10.cubicTo(
        size.width * 0.4334171,
        size.height * 0.8175094,
        size.width * 0.4183417,
        size.height * 0.8181937,
        size.width * 0.4170854,
        size.height * 0.8195610);
    path10.cubicTo(
        size.width * 0.4158291,
        size.height * 0.8209284,
        size.width * 0.4032663,
        size.height * 0.8181937,
        size.width * 0.3994975,
        size.height * 0.8181937);
    path10.cubicTo(
        size.width * 0.3957286,
        size.height * 0.8181937,
        size.width * 0.3869347,
        size.height * 0.8209284,
        size.width * 0.3831658,
        size.height * 0.8222958);
    path10.cubicTo(
        size.width * 0.3801508,
        size.height * 0.8233908,
        size.width * 0.3726960,
        size.height * 0.8209284,
        size.width * 0.3693467,
        size.height * 0.8195610);
    path10.cubicTo(
        size.width * 0.3693467,
        size.height * 0.8201080,
        size.width * 0.3609724,
        size.height * 0.8188779,
        size.width * 0.3567839,
        size.height * 0.8181937);
    path10.cubicTo(
        size.width * 0.3551080,
        size.height * 0.8181937,
        size.width * 0.3517588,
        size.height * 0.8183310,
        size.width * 0.3517588,
        size.height * 0.8188779);
    path10.cubicTo(
        size.width * 0.3517588,
        size.height * 0.8194249,
        size.width * 0.3475704,
        size.height * 0.8186491,
        size.width * 0.3454774,
        size.height * 0.8181937);
    path10.cubicTo(
        size.width * 0.3442211,
        size.height * 0.8181937,
        size.width * 0.3407035,
        size.height * 0.8176467,
        size.width * 0.3366834,
        size.height * 0.8154589);
    path10.cubicTo(
        size.width * 0.3316583,
        size.height * 0.8127230,
        size.width * 0.2939698,
        size.height * 0.8154589,
        size.width * 0.2902010,
        size.height * 0.8181937);
    path10.cubicTo(
        size.width * 0.2864322,
        size.height * 0.8209284,
        size.width * 0.2587940,
        size.height * 0.8093052,
        size.width * 0.2512563,
        size.height * 0.8065692);
    path10.cubicTo(
        size.width * 0.2437186,
        size.height * 0.8038345,
        size.width * 0.2336683,
        size.height * 0.8093052,
        size.width * 0.2311558,
        size.height * 0.8120399);
    path10.cubicTo(
        size.width * 0.2286432,
        size.height * 0.8147746,
        size.width * 0.2148241,
        size.height * 0.8079378,
        size.width * 0.2135678,
        size.height * 0.8093052);
    path10.cubicTo(
        size.width * 0.2123116,
        size.height * 0.8106725,
        size.width * 0.1959799,
        size.height * 0.8031514,
        size.width * 0.1959799,
        size.height * 0.8038345);
    path10.cubicTo(
        size.width * 0.1959799,
        size.height * 0.8043815,
        size.width * 0.1926299,
        size.height * 0.8036068,
        size.width * 0.1909548,
        size.height * 0.8031514);
    path10.cubicTo(
        size.width * 0.1889447,
        size.height * 0.8042453,
        size.width * 0.1742043,
        size.height * 0.7935786,
        size.width * 0.1670854,
        size.height * 0.7881080);
    path10.cubicTo(
        size.width * 0.1608040,
        size.height * 0.7901596,
        size.width * 0.1193467,
        size.height * 0.7730657,
        size.width * 0.1105528,
        size.height * 0.7737488);
    path10.cubicTo(
        size.width * 0.1035176,
        size.height * 0.7742958,
        size.width * 0.09170854,
        size.height * 0.7680516,
        size.width * 0.08668342,
        size.height * 0.7648603);
    path10.close();
    return path10;
  }

  static Paint path10Fill(Size size) {
    Paint paint10Fill = Paint()..style = PaintingStyle.fill;
    paint10Fill.shader =
        ui.Gradient.radial(const Offset(0, 0), size.width * 0.002512563, [
      const Color(0xffF2DED0).withOpacity(1),
      const Color(0xffEAD6C5).withOpacity(1),
      const Color(0xffF2DED0).withOpacity(1)
    ], [
      0.271616,
      0.504419,
      0.868173
    ]);
    return paint10Fill;
  }

  static Path path11(Size size) {
    Path path11 = Path();
    path11.moveTo(size.width * 0.01005025, size.height * 0.8450599);
    path11.lineTo(size.width * 0.01507254, size.height * 0.8457700);
    path11.lineTo(size.width * 0.03013945, size.height * 0.8457700);
    path11.lineTo(size.width * 0.03516156, size.height * 0.8454143);
    path11.lineTo(size.width * 0.04018392, size.height * 0.8454143);
    path11.lineTo(size.width * 0.04269497, size.height * 0.8457700);
    path11.lineTo(size.width * 0.05022864, size.height * 0.8450599);
    path11.lineTo(size.width * 0.05273970, size.height * 0.8450599);
    path11.lineTo(size.width * 0.05776181, size.height * 0.8457700);
    path11.lineTo(size.width * 0.06529523, size.height * 0.8457700);
    path11.lineTo(size.width * 0.06780653, size.height * 0.8450599);
    path11.lineTo(size.width * 0.07157312, size.height * 0.8450599);
    path11.lineTo(size.width * 0.07785101, size.height * 0.8447042);
    path11.lineTo(size.width * 0.08287337, size.height * 0.8457700);
    path11.lineTo(size.width * 0.08789573, size.height * 0.8450599);
    path11.lineTo(size.width * 0.09040678, size.height * 0.8443498);
    path11.cubicTo(
        size.width * 0.09208090,
        size.height * 0.8441127,
        size.width * 0.09542915,
        size.height * 0.8437101,
        size.width * 0.09542915,
        size.height * 0.8439941);
    path11.cubicTo(
        size.width * 0.09542915,
        size.height * 0.8443498,
        size.width * 0.1092402,
        size.height * 0.8439941,
        size.width * 0.1092402,
        size.height * 0.8457700);
    path11.cubicTo(
        size.width * 0.1092402,
        size.height * 0.8471890,
        size.width * 0.1243070,
        size.height * 0.8473075,
        size.width * 0.1318405,
        size.height * 0.8471890);
    path11.lineTo(size.width * 0.1368628, size.height * 0.8478991);
    path11.lineTo(size.width * 0.1443962, size.height * 0.8478991);
    path11.cubicTo(
        size.width * 0.1460704,
        size.height * 0.8484906,
        size.width * 0.1496696,
        size.height * 0.8497453,
        size.width * 0.1506741,
        size.height * 0.8500293);
    path11.cubicTo(
        size.width * 0.1516786,
        size.height * 0.8503134,
        size.width * 0.1644854,
        size.height * 0.8510951,
        size.width * 0.1707633,
        size.height * 0.8514495);
    path11.cubicTo(
        size.width * 0.1728558,
        size.height * 0.8520411,
        size.width * 0.1772922,
        size.height * 0.8531538,
        size.width * 0.1782967,
        size.height * 0.8528697);
    path11.cubicTo(
        size.width * 0.1795523,
        size.height * 0.8525141,
        size.width * 0.1808078,
        size.height * 0.8532242,
        size.width * 0.1858302,
        size.height * 0.8525141);
    path11.cubicTo(
        size.width * 0.1908525,
        size.height * 0.8518040,
        size.width * 0.1958746,
        size.height * 0.8532242,
        size.width * 0.1958746,
        size.height * 0.8528697);
    path11.cubicTo(
        size.width * 0.1958746,
        size.height * 0.8525141,
        size.width * 0.2034080,
        size.height * 0.8528697,
        size.width * 0.2034080,
        size.height * 0.8521596);
    path11.cubicTo(
        size.width * 0.2034080,
        size.height * 0.8514495,
        size.width * 0.2059191,
        size.height * 0.8514495,
        size.width * 0.2071749,
        size.height * 0.8514495);
    path11.cubicTo(
        size.width * 0.2081791,
        size.height * 0.8514495,
        size.width * 0.2101045,
        size.height * 0.8512124,
        size.width * 0.2109415,
        size.height * 0.8510951);
    path11.cubicTo(
        size.width * 0.2113601,
        size.height * 0.8512124,
        size.width * 0.2124482,
        size.height * 0.8514495,
        size.width * 0.2134528,
        size.height * 0.8514495);
    path11.lineTo(size.width * 0.2172193, size.height * 0.8514495);
    path11.cubicTo(
        size.width * 0.2192284,
        size.height * 0.8514495,
        size.width * 0.2214045,
        size.height * 0.8509765,
        size.width * 0.2222417,
        size.height * 0.8507394);
    path11.cubicTo(
        size.width * 0.2234972,
        size.height * 0.8506209,
        size.width * 0.2260083,
        size.height * 0.8504554,
        size.width * 0.2260083,
        size.height * 0.8507394);
    path11.cubicTo(
        size.width * 0.2260083,
        size.height * 0.8510235,
        size.width * 0.2293565,
        size.height * 0.8513310,
        size.width * 0.2310307,
        size.height * 0.8514495);
    path11.cubicTo(
        size.width * 0.2347972,
        size.height * 0.8518040,
        size.width * 0.2425819,
        size.height * 0.8524437,
        size.width * 0.2435864,
        size.height * 0.8521596);
    path11.cubicTo(
        size.width * 0.2445907,
        size.height * 0.8518756,
        size.width * 0.2557236,
        size.height * 0.8513310,
        size.width * 0.2611633,
        size.height * 0.8510951);
    path11.cubicTo(
        size.width * 0.2645126,
        size.height * 0.8518040,
        size.width * 0.2712085,
        size.height * 0.8531538,
        size.width * 0.2712085,
        size.height * 0.8528697);
    path11.cubicTo(
        size.width * 0.2712085,
        size.height * 0.8525141,
        size.width * 0.2812538,
        size.height * 0.8528697,
        size.width * 0.2812538,
        size.height * 0.8521596);
    path11.cubicTo(
        size.width * 0.2812538,
        size.height * 0.8515915,
        size.width * 0.2896231,
        size.height * 0.8519225,
        size.width * 0.2938090,
        size.height * 0.8521596);
    path11.cubicTo(
        size.width * 0.2967387,
        size.height * 0.8525141,
        size.width * 0.3028492,
        size.height * 0.8531538,
        size.width * 0.3038543,
        size.height * 0.8528697);
    path11.cubicTo(
        size.width * 0.3050000,
        size.height * 0.8525458,
        size.width * 0.3092864,
        size.height * 0.8537007,
        size.width * 0.3090678,
        size.height * 0.8539038);
    path11.cubicTo(
        size.width * 0.3101935,
        size.height * 0.8538369,
        size.width * 0.3141206,
        size.height * 0.8536725,
        size.width * 0.3164095,
        size.height * 0.8535798);
    path11.cubicTo(
        size.width * 0.3176658,
        size.height * 0.8534613,
        size.width * 0.3204271,
        size.height * 0.8532958,
        size.width * 0.3214322,
        size.height * 0.8535798);
    path11.cubicTo(
        size.width * 0.3224372,
        size.height * 0.8538638,
        size.width * 0.3251985,
        size.height * 0.8541714,
        size.width * 0.3264548,
        size.height * 0.8542899);
    path11.lineTo(size.width * 0.3314774, size.height * 0.8542899);
    path11.cubicTo(
        size.width * 0.3339874,
        size.height * 0.8541714,
        size.width * 0.3390101,
        size.height * 0.8538638,
        size.width * 0.3390101,
        size.height * 0.8535798);
    path11.cubicTo(
        size.width * 0.3390101,
        size.height * 0.8532958,
        size.width * 0.3507286,
        size.height * 0.8534613,
        size.width * 0.3565879,
        size.height * 0.8535798);
    path11.lineTo(size.width * 0.3603543, size.height * 0.8542899);
    path11.lineTo(size.width * 0.3666332, size.height * 0.8550000);
    path11.lineTo(size.width * 0.3716533, size.height * 0.8550000);
    path11.cubicTo(
        size.width * 0.3733291,
        size.height * 0.8552359,
        size.width * 0.3766759,
        size.height * 0.8556385,
        size.width * 0.3766759,
        size.height * 0.8553545);
    path11.cubicTo(
        size.width * 0.3766759,
        size.height * 0.8550704,
        size.width * 0.3816985,
        size.height * 0.8554730,
        size.width * 0.3842111,
        size.height * 0.8557101);
    path11.cubicTo(
        size.width * 0.3863040,
        size.height * 0.8558275,
        size.width * 0.3904874,
        size.height * 0.8559930,
        size.width * 0.3904874,
        size.height * 0.8557101);
    path11.cubicTo(
        size.width * 0.3904874,
        size.height * 0.8554261,
        size.width * 0.3938367,
        size.height * 0.8551174,
        size.width * 0.3955101,
        size.height * 0.8550000);
    path11.cubicTo(
        size.width * 0.4026256,
        size.height * 0.8542899,
        size.width * 0.4171055,
        size.height * 0.8530117,
        size.width * 0.4181106,
        size.height * 0.8535798);
    path11.cubicTo(
        size.width * 0.4193668,
        size.height * 0.8542899,
        size.width * 0.4181106,
        size.height * 0.8532242,
        size.width * 0.4193668,
        size.height * 0.8528697);
    path11.cubicTo(
        size.width * 0.4203719,
        size.height * 0.8525857,
        size.width * 0.4281558,
        size.height * 0.8532242,
        size.width * 0.4319221,
        size.height * 0.8535798);
    path11.cubicTo(
        size.width * 0.4323392,
        size.height * 0.8536984,
        size.width * 0.4341809,
        size.height * 0.8538638,
        size.width * 0.4382010,
        size.height * 0.8535798);
    path11.cubicTo(
        size.width * 0.4432211,
        size.height * 0.8532242,
        size.width * 0.4545226,
        size.height * 0.8514495,
        size.width * 0.4557789,
        size.height * 0.8521596);
    path11.cubicTo(
        size.width * 0.4570327,
        size.height * 0.8528697,
        size.width * 0.4670779,
        size.height * 0.8514495,
        size.width * 0.4695879,
        size.height * 0.8521596);
    path11.lineTo(size.width * 0.4721005, size.height * 0.8521596);
    path11.lineTo(size.width * 0.4846558, size.height * 0.8525141);
    path11.cubicTo(
        size.width * 0.4867487,
        size.height * 0.8531056,
        size.width * 0.4916859,
        size.height * 0.8542899,
        size.width * 0.4947010,
        size.height * 0.8542899);
    path11.cubicTo(
        size.width * 0.4977136,
        size.height * 0.8542899,
        size.width * 0.5018166,
        size.height * 0.8533427,
        size.width * 0.5034899,
        size.height * 0.8528697);
    path11.cubicTo(
        size.width * 0.5051633,
        size.height * 0.8529883,
        size.width * 0.5087638,
        size.height * 0.8531538,
        size.width * 0.5097663,
        size.height * 0.8528697);
    path11.cubicTo(
        size.width * 0.5110226,
        size.height * 0.8525141,
        size.width * 0.5210678,
        size.height * 0.8539343,
        size.width * 0.5210678,
        size.height * 0.8535798);
    path11.cubicTo(
        size.width * 0.5210678,
        size.height * 0.8532242,
        size.width * 0.5348794,
        size.height * 0.8542899,
        size.width * 0.5348794,
        size.height * 0.8532242);
    path11.cubicTo(
        size.width * 0.5348794,
        size.height * 0.8523721,
        size.width * 0.5407387,
        size.height * 0.8528697,
        size.width * 0.5436683,
        size.height * 0.8532242);
    path11.cubicTo(
        size.width * 0.5532940,
        size.height * 0.8544073,
        size.width * 0.5738015,
        size.height * 0.8573427,
        size.width * 0.5788241,
        size.height * 0.8596150);
    path11.lineTo(size.width * 0.5851005, size.height * 0.8599695);
    path11.lineTo(size.width * 0.5926357, size.height * 0.8599695);
    path11.cubicTo(
        size.width * 0.5968191,
        size.height * 0.8605610,
        size.width * 0.6051910,
        size.height * 0.8616737,
        size.width * 0.6051910,
        size.height * 0.8613897);
    path11.cubicTo(
        size.width * 0.6077010,
        size.height * 0.8610340,
        size.width * 0.6127236,
        size.height * 0.8603955,
        size.width * 0.6127236,
        size.height * 0.8606796);
    path11.cubicTo(
        size.width * 0.6127236,
        size.height * 0.8610340,
        size.width * 0.6503920,
        size.height * 0.8681350,
        size.width * 0.6516457,
        size.height * 0.8677793);
    path11.cubicTo(
        size.width * 0.6529020,
        size.height * 0.8674249,
        size.width * 0.6654573,
        size.height * 0.8663592,
        size.width * 0.6667136,
        size.height * 0.8670692);
    path11.cubicTo(
        size.width * 0.6679698,
        size.height * 0.8677793,
        size.width * 0.7043819,
        size.height * 0.8713298,
        size.width * 0.7043819,
        size.height * 0.8702641);
    path11.cubicTo(
        size.width * 0.7127513,
        size.height * 0.8706197,
        size.width * 0.7294925,
        size.height * 0.8711162,
        size.width * 0.7294925,
        size.height * 0.8702641);
    path11.cubicTo(
        size.width * 0.7294925,
        size.height * 0.8694131,
        size.width * 0.7395377,
        size.height * 0.8713298,
        size.width * 0.7445578,
        size.height * 0.8723944);
    path11.cubicTo(
        size.width * 0.7458141,
        size.height * 0.8722758,
        size.width * 0.7488266,
        size.height * 0.8721103,
        size.width * 0.7508367,
        size.height * 0.8723944);
    path11.cubicTo(
        size.width * 0.7533467,
        size.height * 0.8727500,
        size.width * 0.7659045,
        size.height * 0.8745246,
        size.width * 0.7646482,
        size.height * 0.8748791);
    path11.cubicTo(
        size.width * 0.7636432,
        size.height * 0.8751631,
        size.width * 0.7684146,
        size.height * 0.8749977,
        size.width * 0.7709246,
        size.height * 0.8748791);
    path11.cubicTo(
        size.width * 0.7805528,
        size.height * 0.8777195,
        size.width * 0.7998040,
        size.height * 0.8830446,
        size.width * 0.7998040,
        size.height * 0.8816244);
    path11.cubicTo(
        size.width * 0.7998040,
        size.height * 0.8802042,
        size.width * 0.8190553,
        size.height * 0.8831631,
        size.width * 0.8286809,
        size.height * 0.8848192);
    path11.cubicTo(
        size.width * 0.8328668,
        size.height * 0.8850563,
        size.width * 0.8412387,
        size.height * 0.8853873,
        size.width * 0.8412387,
        size.height * 0.8848192);
    path11.cubicTo(
        size.width * 0.8429121,
        size.height * 0.8847019,
        size.width * 0.8467613,
        size.height * 0.8846068,
        size.width * 0.8487714,
        size.height * 0.8851749);
    path11.cubicTo(
        size.width * 0.8507814,
        size.height * 0.8857430,
        size.width * 0.8596533,
        size.height * 0.8854108,
        size.width * 0.8638392,
        size.height * 0.8851749);
    path11.cubicTo(
        size.width * 0.8713719,
        size.height * 0.8849378,
        size.width * 0.8864372,
        size.height * 0.8845352,
        size.width * 0.8864372,
        size.height * 0.8848192);
    path11.cubicTo(
        size.width * 0.8864372,
        size.height * 0.8851033,
        size.width * 0.8981583,
        size.height * 0.8844648,
        size.width * 0.9040176,
        size.height * 0.8841092);
    path11.cubicTo(
        size.width * 0.9102940,
        size.height * 0.8838732,
        size.width * 0.9231005,
        size.height * 0.8835423,
        size.width * 0.9241055,
        size.height * 0.8841092);
    path11.cubicTo(
        size.width * 0.9320578,
        size.height * 0.8843462,
        size.width * 0.9482136,
        size.height * 0.8846772,
        size.width * 0.9492161,
        size.height * 0.8841092);
    path11.cubicTo(
        size.width * 0.9504724,
        size.height * 0.8834002,
        size.width * 0.9642839,
        size.height * 0.8819800,
        size.width * 0.9642839,
        size.height * 0.8830446);
    path11.cubicTo(
        size.width * 0.9642839,
        size.height * 0.8838967,
        size.width * 0.9676332,
        size.height * 0.8836362,
        size.width * 0.9693065,
        size.height * 0.8834002);
    path11.cubicTo(
        size.width * 0.9709799,
        size.height * 0.8831631,
        size.width * 0.9748317,
        size.height * 0.8826901,
        size.width * 0.9768392,
        size.height * 0.8826901);
    path11.cubicTo(
        size.width * 0.9793518,
        size.height * 0.8826901,
        size.width * 0.9881407,
        size.height * 0.8816244,
        size.width * 0.9893945,
        size.height * 0.8819800);
    path11.cubicTo(
        size.width * 0.9903995,
        size.height * 0.8822641,
        size.width * 0.9898141,
        size.height * 0.9545188,
        size.width * 0.9893945,
        size.height * 0.9906103);
    path11.lineTo(size.width * 0.01005025, size.height * 0.9906103);
    path11.lineTo(size.width * 0.01005025, size.height * 0.8450599);
    path11.close();
    return path11;
  }

  static Paint path11Fill(Size size) {
    Paint paint11Fill = Paint()..style = PaintingStyle.fill;
    paint11Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.3172437, size.height * -2.816690),
        Offset(size.width * 0.3172437, size.height * 0.9906103), [
      const Color(0xffF2DED0).withOpacity(1),
      const Color(0xffF9EAE0).withOpacity(1)
    ], [
      0.0406459,
      0.230046
    ]);
    return paint11Fill;
  }

  static Path path12(Size size) {
    Path path12 = Path();
    path12.moveTo(size.width * 0.02135678, size.height * 0.4958920);
    path12.cubicTo(
        size.width * 0.02035176,
        size.height * 0.4968310,
        size.width * 0.01340033,
        size.height * 0.4927617,
        size.width * 0.01005025,
        size.height * 0.4906103);
    path12.lineTo(size.width * 0.01005025, size.height * -0.006716021);
    path12.lineTo(size.width * 0.01005025, size.height * -0.007042254);
    path12.lineTo(size.width * 0.9899497, size.height * -0.007042254);
    path12.lineTo(size.width * 0.9899497, size.height * 0.5093897);
    path12.cubicTo(
        size.width * 0.9878568,
        size.height * 0.5099765,
        size.width * 0.9834171,
        size.height * 0.5111502,
        size.width * 0.9824121,
        size.height * 0.5111502);
    path12.cubicTo(
        size.width * 0.9811558,
        size.height * 0.5111502,
        size.width * 0.9736181,
        size.height * 0.5129108,
        size.width * 0.9685930,
        size.height * 0.5146714);
    path12.cubicTo(
        size.width * 0.9635678,
        size.height * 0.5164319,
        size.width * 0.9623116,
        size.height * 0.5111502,
        size.width * 0.9572864,
        size.height * 0.5099765);
    path12.cubicTo(
        size.width * 0.9539573,
        size.height * 0.5091984,
        size.width * 0.9478719,
        size.height * 0.5135728,
        size.width * 0.9452387,
        size.height * 0.5157606);
    path12.cubicTo(
        size.width * 0.9452337,
        size.height * 0.5159390,
        size.width * 0.9450729,
        size.height * 0.5161608,
        size.width * 0.9447236,
        size.height * 0.5164319);
    path12.cubicTo(
        size.width * 0.9434523,
        size.height * 0.5174225,
        size.width * 0.9438970,
        size.height * 0.5168756,
        size.width * 0.9452387,
        size.height * 0.5157606);
    path12.cubicTo(
        size.width * 0.9452714,
        size.height * 0.5143955,
        size.width * 0.9360905,
        size.height * 0.5155669,
        size.width * 0.9309045,
        size.height * 0.5164319);
    path12.cubicTo(
        size.width * 0.9288116,
        size.height * 0.5176056,
        size.width * 0.9243719,
        size.height * 0.5198357,
        size.width * 0.9233668,
        size.height * 0.5193662);
    path12.cubicTo(
        size.width * 0.9223618,
        size.height * 0.5188967,
        size.width * 0.9137362,
        size.height * 0.5223005,
        size.width * 0.9095477,
        size.height * 0.5240610);
    path12.cubicTo(
        size.width * 0.9011734,
        size.height * 0.5250387,
        size.width * 0.8859296,
        size.height * 0.5261737,
        size.width * 0.8919598,
        size.height * 0.5228873);
    path12.cubicTo(
        size.width * 0.8994975,
        size.height * 0.5187793,
        size.width * 0.8429648,
        size.height * 0.5328638,
        size.width * 0.8492462,
        size.height * 0.5369718);
    path12.cubicTo(
        size.width * 0.8555276,
        size.height * 0.5410798,
        size.width * 0.8203518,
        size.height * 0.5269953,
        size.width * 0.8103015,
        size.height * 0.5269953);
    path12.cubicTo(
        size.width * 0.8002513,
        size.height * 0.5269953,
        size.width * 0.7801508,
        size.height * 0.5322770,
        size.width * 0.7751256,
        size.height * 0.5369718);
    path12.cubicTo(
        size.width * 0.7701005,
        size.height * 0.5416667,
        size.width * 0.7424623,
        size.height * 0.5293427,
        size.width * 0.7374372,
        size.height * 0.5269953);
    path12.cubicTo(
        size.width * 0.7334171,
        size.height * 0.5251174,
        size.width * 0.7198492,
        size.height * 0.5328638,
        size.width * 0.7135678,
        size.height * 0.5369718);
    path12.cubicTo(
        size.width * 0.7072864,
        size.height * 0.5412758,
        size.width * 0.6937186,
        size.height * 0.5496479,
        size.width * 0.6896985,
        size.height * 0.5487089);
    path12.cubicTo(
        size.width * 0.6846734,
        size.height * 0.5475352,
        size.width * 0.6507538,
        size.height * 0.5569249,
        size.width * 0.6557789,
        size.height * 0.5580986);
    path12.cubicTo(
        size.width * 0.6608040,
        size.height * 0.5592723,
        size.width * 0.6306533,
        size.height * 0.5575117,
        size.width * 0.6268844,
        size.height * 0.5569249);
    path12.cubicTo(
        size.width * 0.6231156,
        size.height * 0.5563380,
        size.width * 0.6180905,
        size.height * 0.5592723,
        size.width * 0.6193467,
        size.height * 0.5604460);
    path12.cubicTo(
        size.width * 0.6206030,
        size.height * 0.5616197,
        size.width * 0.6080402,
        size.height * 0.5610329,
        size.width * 0.6055276,
        size.height * 0.5604460);
    path12.cubicTo(
        size.width * 0.6030151,
        size.height * 0.5598592,
        size.width * 0.6067839,
        size.height * 0.5645540,
        size.width * 0.6080402,
        size.height * 0.5669014);
    path12.cubicTo(
        size.width * 0.6090452,
        size.height * 0.5687793,
        size.width * 0.6017588,
        size.height * 0.5672923,
        size.width * 0.5979899,
        size.height * 0.5663146);
    path12.cubicTo(
        size.width * 0.5917085,
        size.height * 0.5698357,
        size.width * 0.5798995,
        size.height * 0.5776995,
        size.width * 0.5829146,
        size.height * 0.5809859);
    path12.cubicTo(
        size.width * 0.5859296,
        size.height * 0.5842723,
        size.width * 0.5573693,
        size.height * 0.5823556,
        size.width * 0.5427136,
        size.height * 0.5809859);
    path12.cubicTo(
        size.width * 0.5330829,
        size.height * 0.5874413,
        size.width * 0.5145729,
        size.height * 0.5988263,
        size.width * 0.5175879,
        size.height * 0.5927230);
    path12.cubicTo(
        size.width * 0.5206030,
        size.height * 0.5866197,
        size.width * 0.4778065,
        size.height * 0.5901796,
        size.width * 0.4560302,
        size.height * 0.5927230);
    path12.cubicTo(
        size.width * 0.4451432,
        size.height * 0.5952664,
        size.width * 0.4218593,
        size.height * 0.6003521,
        size.width * 0.4158291,
        size.height * 0.6003521);
    path12.cubicTo(
        size.width * 0.4082915,
        size.height * 0.6003521,
        size.width * 0.3907035,
        size.height * 0.6138498,
        size.width * 0.3831658,
        size.height * 0.6138498);
    path12.cubicTo(
        size.width * 0.3771357,
        size.height * 0.6138498,
        size.width * 0.3756281,
        size.height * 0.6048509,
        size.width * 0.3756281,
        size.height * 0.6003521);
    path12.cubicTo(
        size.width * 0.3643216,
        size.height * 0.5978087,
        size.width * 0.3412060,
        size.height * 0.5920188,
        size.width * 0.3391960,
        size.height * 0.5892019);
    path12.cubicTo(
        size.width * 0.3366834,
        size.height * 0.5856808,
        size.width * 0.3090452,
        size.height * 0.5845070,
        size.width * 0.3052764,
        size.height * 0.5892019);
    path12.cubicTo(
        size.width * 0.3015075,
        size.height * 0.5938967,
        size.width * 0.2751256,
        size.height * 0.5815728,
        size.width * 0.2650754,
        size.height * 0.5768779);
    path12.cubicTo(
        size.width * 0.2550251,
        size.height * 0.5721831,
        size.width * 0.2286432,
        size.height * 0.5845070,
        size.width * 0.2223618,
        size.height * 0.5845070);
    path12.cubicTo(
        size.width * 0.2173367,
        size.height * 0.5845070,
        size.width * 0.2102178,
        size.height * 0.5794214,
        size.width * 0.2072864,
        size.height * 0.5768779);
    path12.cubicTo(
        size.width * 0.2102178,
        size.height * 0.5682711,
        size.width * 0.2143216,
        size.height * 0.5516432,
        size.width * 0.2072864,
        size.height * 0.5539906);
    path12.cubicTo(
        size.width * 0.1984925,
        size.height * 0.5569249,
        size.width * 0.1658291,
        size.height * 0.5369718,
        size.width * 0.1633166,
        size.height * 0.5363850);
    path12.cubicTo(
        size.width * 0.1608040,
        size.height * 0.5357981,
        size.width * 0.1545226,
        size.height * 0.5346244,
        size.width * 0.1532663,
        size.height * 0.5334507);
    path12.cubicTo(
        size.width * 0.1520101,
        size.height * 0.5322770,
        size.width * 0.1507538,
        size.height * 0.5357981,
        size.width * 0.1482412,
        size.height * 0.5369718);
    path12.cubicTo(
        size.width * 0.1462312,
        size.height * 0.5379108,
        size.width * 0.1407035,
        size.height * 0.5314941,
        size.width * 0.1381910,
        size.height * 0.5281690);
    path12.cubicTo(
        size.width * 0.1306533,
        size.height * 0.5271913,
        size.width * 0.1148241,
        size.height * 0.5258216,
        size.width * 0.1118090,
        size.height * 0.5281690);
    path12.cubicTo(
        size.width * 0.1087940,
        size.height * 0.5305164,
        size.width * 0.1005025,
        size.height * 0.5232782,
        size.width * 0.09673367,
        size.height * 0.5193662);
    path12.cubicTo(
        size.width * 0.09128970,
        size.height * 0.5181925,
        size.width * 0.08040201,
        size.height * 0.5170188,
        size.width * 0.08040201,
        size.height * 0.5217136);
    path12.cubicTo(
        size.width * 0.08040201,
        size.height * 0.5275822,
        size.width * 0.05150754,
        size.height * 0.5052817,
        size.width * 0.05276382,
        size.height * 0.5035211);
    path12.cubicTo(
        size.width * 0.05376884,
        size.height * 0.5021127,
        size.width * 0.04313241,
        size.height * 0.5009777,
        size.width * 0.03768844,
        size.height * 0.5005869);
    path12.cubicTo(
        size.width * 0.03768844,
        size.height * 0.4990223,
        size.width * 0.03668342,
        size.height * 0.4958920,
        size.width * 0.03266332,
        size.height * 0.4958920);
    path12.cubicTo(
        size.width * 0.02763819,
        size.height * 0.4958920,
        size.width * 0.02261307,
        size.height * 0.4947183,
        size.width * 0.02135678,
        size.height * 0.4958920);
    path12.close();
    return path12;
  }

  static Paint path12Fill(Size size) {
    Paint paint12Fill = Paint()..style = PaintingStyle.fill;
    paint12Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.3172437, size.height * -2.816690),
        Offset(size.width * 0.3172437, size.height * 0.9906103), [
      const Color(0xff013137).withOpacity(1),
      const Color(0xff00706C).withOpacity(1),
      const Color(0xff008984).withOpacity(1),
      const Color(0xff008F95).withOpacity(1),
      const Color(0xff12BDAE).withOpacity(1),
      const Color(0xff01B7AB).withOpacity(1),
      const Color(0xffACE1D0).withOpacity(1)
    ], [
      0,
      0.0677083,
      0.182308,
      0.321316,
      0.449832,
      0.709489,
      0.906198
    ]);
    return paint12Fill;
  }

  static Path path13(Size size) {
    Path path13 = Path();
    path13.moveTo(size.width * 0.02135678, size.height * 0.4958920);
    path13.cubicTo(
        size.width * 0.02135678,
        size.height * 0.4973005,
        size.width * 0.01381910,
        size.height * 0.4929577,
        size.width * 0.01005025,
        size.height * 0.4906103);
    path13.lineTo(size.width * 0.01005025, size.height * 0.5751174);
    path13.cubicTo(
        size.width * 0.01005025,
        size.height * 0.5746479,
        size.width * 0.01172530,
        size.height * 0.5749214,
        size.width * 0.01256281,
        size.height * 0.5751174);
    path13.cubicTo(
        size.width * 0.01298158,
        size.height * 0.5753134,
        size.width * 0.01356784,
        size.height * 0.5757042,
        size.width * 0.01256281,
        size.height * 0.5757042);
    path13.cubicTo(
        size.width * 0.01155779,
        size.height * 0.5757042,
        size.width * 0.01214405,
        size.height * 0.5796162,
        size.width * 0.01256281,
        size.height * 0.5815728);
    path13.cubicTo(
        size.width * 0.01155779,
        size.height * 0.5820423,
        size.width * 0.01465661,
        size.height * 0.5829425,
        size.width * 0.01633166,
        size.height * 0.5833333);
    path13.cubicTo(
        size.width * 0.01758794,
        size.height * 0.5845070,
        size.width * 0.02638191,
        size.height * 0.5839202,
        size.width * 0.02763819,
        size.height * 0.5839202);
    path13.cubicTo(
        size.width * 0.02889447,
        size.height * 0.5839202,
        size.width * 0.03643216,
        size.height * 0.5821596,
        size.width * 0.03894472,
        size.height * 0.5856808);
    path13.cubicTo(
        size.width * 0.04095477,
        size.height * 0.5884977,
        size.width * 0.04815754,
        size.height * 0.5915493,
        size.width * 0.05150754,
        size.height * 0.5927230);
    path13.cubicTo(
        size.width * 0.05050251,
        size.height * 0.5936620,
        size.width * 0.05862638,
        size.height * 0.5958533,
        size.width * 0.06281407,
        size.height * 0.5968310);
    path13.cubicTo(
        size.width * 0.06582915,
        size.height * 0.5991784,
        size.width * 0.07160804,
        size.height * 0.5997653,
        size.width * 0.07412060,
        size.height * 0.5997653);
    path13.cubicTo(
        size.width * 0.07286432,
        size.height * 0.6009390,
        size.width * 0.07788945,
        size.height * 0.6032864,
        size.width * 0.07914573,
        size.height * 0.6032864);
    path13.cubicTo(
        size.width * 0.08015075,
        size.height * 0.6032864,
        size.width * 0.07956457,
        size.height * 0.6036772,
        size.width * 0.07914573,
        size.height * 0.6038732);
    path13.cubicTo(
        size.width * 0.07914573,
        size.height * 0.6048122,
        size.width * 0.08668342,
        size.height * 0.6070035,
        size.width * 0.09045226,
        size.height * 0.6079812);
    path13.cubicTo(
        size.width * 0.09045226,
        size.height * 0.6075117,
        size.width * 0.1080402,
        size.height * 0.6132629,
        size.width * 0.1168342,
        size.height * 0.6161972);
    path13.cubicTo(
        size.width * 0.1168342,
        size.height * 0.6157277,
        size.width * 0.1419598,
        size.height * 0.6242171,
        size.width * 0.1545226,
        size.height * 0.6285211);
    path13.cubicTo(
        size.width * 0.1549415,
        size.height * 0.6287171,
        size.width * 0.1555276,
        size.height * 0.6291080,
        size.width * 0.1545226,
        size.height * 0.6291080);
    path13.cubicTo(
        size.width * 0.1535176,
        size.height * 0.6291080,
        size.width * 0.1658291,
        size.height * 0.6353674,
        size.width * 0.1721106,
        size.height * 0.6384977);
    path13.lineTo(size.width * 0.1922111, size.height * 0.6461268);
    path13.lineTo(size.width * 0.2449749, size.height * 0.6561033);
    path13.cubicTo(
        size.width * 0.2469849,
        size.height * 0.6556338,
        size.width * 0.2525126,
        size.height * 0.6590376,
        size.width * 0.2550251,
        size.height * 0.6607981);
    path13.cubicTo(
        size.width * 0.2537688,
        size.height * 0.6596244,
        size.width * 0.2889447,
        size.height * 0.6672535,
        size.width * 0.2927136,
        size.height * 0.6696009);
    path13.cubicTo(
        size.width * 0.2964824,
        size.height * 0.6719484,
        size.width * 0.3115578,
        size.height * 0.6772300,
        size.width * 0.3128141,
        size.height * 0.6784038);
    path13.cubicTo(
        size.width * 0.3138191,
        size.height * 0.6793427,
        size.width * 0.3182588,
        size.height * 0.6780129,
        size.width * 0.3203518,
        size.height * 0.6772300);
    path13.cubicTo(
        size.width * 0.3454774,
        size.height * 0.6830986,
        size.width * 0.3492462,
        size.height * 0.6860329,
        size.width * 0.3467337,
        size.height * 0.6872066);
    path13.cubicTo(
        size.width * 0.3447236,
        size.height * 0.6881455,
        size.width * 0.3676709,
        size.height * 0.7016819,
        size.width * 0.3793970,
        size.height * 0.7083333);
    path13.cubicTo(
        size.width * 0.3763819,
        size.height * 0.7092723,
        size.width * 0.4066156,
        size.height * 0.7204613,
        size.width * 0.4221106,
        size.height * 0.7259390);
    path13.cubicTo(
        size.width * 0.4271357,
        size.height * 0.7254695,
        size.width * 0.4275553,
        size.height * 0.7261350,
        size.width * 0.4271357,
        size.height * 0.7265258);
    path13.cubicTo(
        size.width * 0.4231156,
        size.height * 0.7269953,
        size.width * 0.4422111,
        size.height * 0.7278955,
        size.width * 0.4522613,
        size.height * 0.7282864);
    path13.cubicTo(
        size.width * 0.4562814,
        size.height * 0.7264085,
        size.width * 0.4589623,
        size.height * 0.7267218,
        size.width * 0.4597990,
        size.height * 0.7271127);
    path13.cubicTo(
        size.width * 0.4627312,
        size.height * 0.7267218,
        size.width * 0.4685930,
        size.height * 0.7258216,
        size.width * 0.4685930,
        size.height * 0.7253521);
    path13.cubicTo(
        size.width * 0.4685930,
        size.height * 0.7248826,
        size.width * 0.4719422,
        size.height * 0.7251561,
        size.width * 0.4736181,
        size.height * 0.7253521);
    path13.cubicTo(
        size.width * 0.4907035,
        size.height * 0.7220657,
        size.width * 0.4958116,
        size.height * 0.7196796,
        size.width * 0.4962312,
        size.height * 0.7188967);
    path13.cubicTo(
        size.width * 0.4932161,
        size.height * 0.7198357,
        size.width * 0.5092136,
        size.height * 0.7126373,
        size.width * 0.5175879,
        size.height * 0.7089202);
    path13.cubicTo(
        size.width * 0.5165829,
        size.height * 0.7079812,
        size.width * 0.5238693,
        size.height * 0.7050082,
        size.width * 0.5276382,
        size.height * 0.7036385);
    path13.cubicTo(
        size.width * 0.5266332,
        size.height * 0.7017606,
        size.width * 0.5314070,
        size.height * 0.7001174,
        size.width * 0.5339196,
        size.height * 0.6995305);
    path13.cubicTo(
        size.width * 0.5351759,
        size.height * 0.6948357,
        size.width * 0.5376884,
        size.height * 0.6954225,
        size.width * 0.5402010,
        size.height * 0.6936620);
    path13.cubicTo(
        size.width * 0.5422111,
        size.height * 0.6922535,
        size.width * 0.5410377,
        size.height * 0.6919014,
        size.width * 0.5402010,
        size.height * 0.6919014);
    path13.lineTo(size.width * 0.5402010, size.height * 0.6901408);
    path13.lineTo(size.width * 0.5402010, size.height * 0.6877934);
    path13.lineTo(size.width * 0.5464824, size.height * 0.6813380);
    path13.cubicTo(
        size.width * 0.5469020,
        size.height * 0.6809472,
        size.width * 0.5482412,
        size.height * 0.6795775,
        size.width * 0.5502513,
        size.height * 0.6772300);
    path13.cubicTo(
        size.width * 0.5522613,
        size.height * 0.6748826,
        size.width * 0.5544397,
        size.height * 0.6739049,
        size.width * 0.5552764,
        size.height * 0.6737089);
    path13.cubicTo(
        size.width * 0.5603015,
        size.height * 0.6732394,
        size.width * 0.5674196,
        size.height * 0.6699918,
        size.width * 0.5703518,
        size.height * 0.6684272);
    path13.cubicTo(
        size.width * 0.5783920,
        size.height * 0.6670188,
        size.width * 0.5795653,
        size.height * 0.6662758,
        size.width * 0.5791457,
        size.height * 0.6660798);
    path13.cubicTo(
        size.width * 0.5891960,
        size.height * 0.6656103,
        size.width * 0.5917085,
        size.height * 0.6651021,
        size.width * 0.5917085,
        size.height * 0.6649061);
    path13.cubicTo(
        size.width * 0.5947236,
        size.height * 0.6606808,
        size.width * 0.5938015,
        size.height * 0.6600153,
        size.width * 0.5929648,
        size.height * 0.6602113);
    path13.cubicTo(
        size.width * 0.5989950,
        size.height * 0.6564554,
        size.width * 0.6030151,
        size.height * 0.6562993,
        size.width * 0.6042714,
        size.height * 0.6566901);
    path13.cubicTo(
        size.width * 0.6062814,
        size.height * 0.6557512,
        size.width * 0.6084598,
        size.height * 0.6539519,
        size.width * 0.6092965,
        size.height * 0.6531690);
    path13.cubicTo(
        size.width * 0.6414573,
        size.height * 0.6461268,
        size.width * 0.6453090,
        size.height * 0.6443662,
        size.width * 0.6432161,
        size.height * 0.6443662);
    path13.cubicTo(
        size.width * 0.6708543,
        size.height * 0.6338028,
        size.width * 0.6645729,
        size.height * 0.6343897,
        size.width * 0.6645729,
        size.height * 0.6338028);
    path13.cubicTo(
        size.width * 0.6645729,
        size.height * 0.6333333,
        size.width * 0.6704347,
        size.height * 0.6312594,
        size.width * 0.6733668,
        size.height * 0.6302817);
    path13.cubicTo(
        size.width * 0.6763819,
        size.height * 0.6232394,
        size.width * 0.6779724,
        size.height * 0.6226526,
        size.width * 0.6783920,
        size.height * 0.6232394);
    path13.lineTo(size.width * 0.6896985, size.height * 0.6173709);
    path13.cubicTo(
        size.width * 0.6951432,
        size.height * 0.6163932,
        size.width * 0.7060302,
        size.height * 0.6143192,
        size.width * 0.7060302,
        size.height * 0.6138498);
    path13.cubicTo(
        size.width * 0.7060302,
        size.height * 0.6133803,
        size.width * 0.7093794,
        size.height * 0.6132629,
        size.width * 0.7110553,
        size.height * 0.6132629);
    path13.cubicTo(
        size.width * 0.7221106,
        size.height * 0.6127934,
        size.width * 0.7248744,
        size.height * 0.6115023,
        size.width * 0.7248744,
        size.height * 0.6109155);
    path13.cubicTo(
        size.width * 0.7278894,
        size.height * 0.6071596,
        size.width * 0.7311558,
        size.height * 0.6058298,
        size.width * 0.7324121,
        size.height * 0.6056338);
    path13.cubicTo(
        size.width * 0.7512563,
        size.height * 0.6021127,
        size.width * 0.7613065,
        size.height * 0.5991784,
        size.width * 0.7600503,
        size.height * 0.5985915);
    path13.cubicTo(
        size.width * 0.7590452,
        size.height * 0.5981221,
        size.width * 0.7604698,
        size.height * 0.5976138,
        size.width * 0.7613065,
        size.height * 0.5974178);
    path13.cubicTo(
        size.width * 0.7675879,
        size.height * 0.5980047,
        size.width * 0.7713568,
        size.height * 0.5956573,
        size.width * 0.7701005,
        size.height * 0.5956573);
    path13.cubicTo(
        size.width * 0.7690955,
        size.height * 0.5956573,
        size.width * 0.7713568,
        size.height * 0.5940927,
        size.width * 0.7726131,
        size.height * 0.5933099);
    path13.cubicTo(
        size.width * 0.7876884,
        size.height * 0.5933099,
        size.width * 0.7826633,
        size.height * 0.5927230,
        size.width * 0.7839196,
        size.height * 0.5927230);
    path13.cubicTo(
        size.width * 0.7851759,
        size.height * 0.5927230,
        size.width * 0.7839196,
        size.height * 0.5927230,
        size.width * 0.7851759,
        size.height * 0.5921362);
    path13.cubicTo(
        size.width * 0.7861809,
        size.height * 0.5916667,
        size.width * 0.7872688,
        size.height * 0.5915493,
        size.width * 0.7876884,
        size.height * 0.5915493);
    path13.cubicTo(
        size.width * 0.7964824,
        size.height * 0.5915493,
        size.width * 0.7977387,
        size.height * 0.5903756,
        size.width * 0.7964824,
        size.height * 0.5903756);
    path13.cubicTo(
        size.width * 0.7954774,
        size.height * 0.5903756,
        size.width * 0.7977387,
        size.height * 0.5895927,
        size.width * 0.7989950,
        size.height * 0.5892019);
    path13.cubicTo(
        size.width * 0.8040201,
        size.height * 0.5886150,
        size.width * 0.8128141,
        size.height * 0.5868545,
        size.width * 0.8115578,
        size.height * 0.5862676);
    path13.cubicTo(
        size.width * 0.8105528,
        size.height * 0.5857981,
        size.width * 0.8170025,
        size.height * 0.5856808,
        size.width * 0.8203518,
        size.height * 0.5856808);
    path13.cubicTo(
        size.width * 0.8233668,
        size.height * 0.5838028,
        size.width * 0.8249573,
        size.height * 0.5833333,
        size.width * 0.8253769,
        size.height * 0.5833333);
    path13.cubicTo(
        size.width * 0.8293970,
        size.height * 0.5823944,
        size.width * 0.8312387,
        size.height * 0.5813768,
        size.width * 0.8316583,
        size.height * 0.5809859);
    path13.cubicTo(
        size.width * 0.8336683,
        size.height * 0.5819249,
        size.width * 0.8375201,
        size.height * 0.5821596,
        size.width * 0.8391960,
        size.height * 0.5821596);
    path13.lineTo(size.width * 0.8417085, size.height * 0.5809859);
    path13.cubicTo(
        size.width * 0.8429648,
        size.height * 0.5803991,
        size.width * 0.8442211,
        size.height * 0.5809859,
        size.width * 0.8467337,
        size.height * 0.5809859);
    path13.cubicTo(
        size.width * 0.8487437,
        size.height * 0.5809859,
        size.width * 0.8525955,
        size.height * 0.5802031,
        size.width * 0.8542714,
        size.height * 0.5798122);
    path13.lineTo(size.width * 0.8542714, size.height * 0.5786385);
    path13.cubicTo(
        size.width * 0.8555276,
        size.height * 0.5786385,
        size.width * 0.8592965,
        size.height * 0.5774648,
        size.width * 0.8580402,
        size.height * 0.5774648);
    path13.cubicTo(
        size.width * 0.8570352,
        size.height * 0.5774648,
        size.width * 0.8618090,
        size.height * 0.5766819,
        size.width * 0.8643216,
        size.height * 0.5762911);
    path13.cubicTo(
        size.width * 0.8655779,
        size.height * 0.5762911,
        size.width * 0.8643216,
        size.height * 0.5757042,
        size.width * 0.8643216,
        size.height * 0.5751174);
    path13.cubicTo(
        size.width * 0.8643216,
        size.height * 0.5746479,
        size.width * 0.8676709,
        size.height * 0.5745305,
        size.width * 0.8693467,
        size.height * 0.5745305);
    path13.cubicTo(
        size.width * 0.8718593,
        size.height * 0.5739437,
        size.width * 0.8706030,
        size.height * 0.5739437,
        size.width * 0.8706030,
        size.height * 0.5733568);
    path13.cubicTo(
        size.width * 0.8706030,
        size.height * 0.5728873,
        size.width * 0.8747915,
        size.height * 0.5731608,
        size.width * 0.8768844,
        size.height * 0.5733568);
    path13.cubicTo(
        size.width * 0.8788945,
        size.height * 0.5719484,
        size.width * 0.8810729,
        size.height * 0.5715962,
        size.width * 0.8819095,
        size.height * 0.5715962);
    path13.cubicTo(
        size.width * 0.8819095,
        size.height * 0.5711268,
        size.width * 0.8902839,
        size.height * 0.5733568,
        size.width * 0.8944724,
        size.height * 0.5745305);
    path13.cubicTo(
        size.width * 0.8948920,
        size.height * 0.5749214,
        size.width * 0.8957286,
        size.height * 0.5758216,
        size.width * 0.8957286,
        size.height * 0.5762911);
    path13.cubicTo(
        size.width * 0.8957286,
        size.height * 0.5767606,
        size.width * 0.9024296,
        size.height * 0.5776608,
        size.width * 0.9057789,
        size.height * 0.5780516);
    path13.cubicTo(
        size.width * 0.9087940,
        size.height * 0.5771127,
        size.width * 0.9095477,
        size.height * 0.5772688,
        size.width * 0.9095477,
        size.height * 0.5774648);
    path13.cubicTo(
        size.width * 0.9115578,
        size.height * 0.5784038,
        size.width * 0.9288116,
        size.height * 0.5794214,
        size.width * 0.9371859,
        size.height * 0.5798122);
    path13.lineTo(size.width * 0.9497487, size.height * 0.5856808);
    path13.cubicTo(
        size.width * 0.9628141,
        size.height * 0.5870892,
        size.width * 0.9652437,
        size.height * 0.5897887,
        size.width * 0.9648241,
        size.height * 0.5909624);
    path13.lineTo(size.width * 0.9698492, size.height * 0.5897887);
    path13.cubicTo(
        size.width * 0.9723618,
        size.height * 0.5892019,
        size.width * 0.9723618,
        size.height * 0.5874413,
        size.width * 0.9723618,
        size.height * 0.5880282);
    path13.cubicTo(
        size.width * 0.9723618,
        size.height * 0.5884977,
        size.width * 0.9840879,
        size.height * 0.5904965,
        size.width * 0.9899497,
        size.height * 0.5914366);
    path13.lineTo(size.width * 0.9899497, size.height * 0.5093897);
    path13.cubicTo(
        size.width * 0.9878568,
        size.height * 0.5099765,
        size.width * 0.9834171,
        size.height * 0.5111502,
        size.width * 0.9824121,
        size.height * 0.5111502);
    path13.cubicTo(
        size.width * 0.9814070,
        size.height * 0.5111502,
        size.width * 0.9736181,
        size.height * 0.5131068,
        size.width * 0.9698492,
        size.height * 0.5140845);
    path13.cubicTo(
        size.width * 0.9681734,
        size.height * 0.5148674,
        size.width * 0.9643216,
        size.height * 0.5157277,
        size.width * 0.9623116,
        size.height * 0.5129108);
    path13.cubicTo(
        size.width * 0.9603015,
        size.height * 0.5100939,
        size.width * 0.9564497,
        size.height * 0.5097805,
        size.width * 0.9547739,
        size.height * 0.5099765);
    path13.cubicTo(
        size.width * 0.9487437,
        size.height * 0.5127934,
        size.width * 0.9455603,
        size.height * 0.5154542,
        size.width * 0.9447236,
        size.height * 0.5164319);
    path13.cubicTo(
        size.width * 0.9443040,
        size.height * 0.5168228,
        size.width * 0.9437186,
        size.height * 0.5172535,
        size.width * 0.9447236,
        size.height * 0.5158451);
    path13.cubicTo(
        size.width * 0.9457286,
        size.height * 0.5144366,
        size.width * 0.9359296,
        size.height * 0.5156491,
        size.width * 0.9309045,
        size.height * 0.5164319);
    path13.cubicTo(
        size.width * 0.9288116,
        size.height * 0.5176056,
        size.width * 0.9243719,
        size.height * 0.5198357,
        size.width * 0.9233668,
        size.height * 0.5193662);
    path13.cubicTo(
        size.width * 0.9223618,
        size.height * 0.5188967,
        size.width * 0.9137362,
        size.height * 0.5223005,
        size.width * 0.9095477,
        size.height * 0.5240610);
    path13.cubicTo(
        size.width * 0.8982412,
        size.height * 0.5258216,
        size.width * 0.8869347,
        size.height * 0.5252347,
        size.width * 0.8907035,
        size.height * 0.5234742);
    path13.cubicTo(
        size.width * 0.8937186,
        size.height * 0.5220657,
        size.width * 0.8919598,
        size.height * 0.5221045,
        size.width * 0.8907035,
        size.height * 0.5223005);
    path13.cubicTo(
        size.width * 0.8505025,
        size.height * 0.5316901,
        size.width * 0.8479899,
        size.height * 0.5346244,
        size.width * 0.8492462,
        size.height * 0.5363850);
    path13.cubicTo(
        size.width * 0.8502513,
        size.height * 0.5377934,
        size.width * 0.8496658,
        size.height * 0.5377547,
        size.width * 0.8492462,
        size.height * 0.5375587);
    path13.cubicTo(
        size.width * 0.8115578,
        size.height * 0.5252347,
        size.width * 0.8140704,
        size.height * 0.5281690,
        size.width * 0.8103015,
        size.height * 0.5269953);
    path13.cubicTo(
        size.width * 0.8065327,
        size.height * 0.5258216,
        size.width * 0.7826633,
        size.height * 0.5322770,
        size.width * 0.7776382,
        size.height * 0.5352113);
    path13.cubicTo(
        size.width * 0.7726131,
        size.height * 0.5381455,
        size.width * 0.7751256,
        size.height * 0.5375587,
        size.width * 0.7713568,
        size.height * 0.5381455);
    path13.cubicTo(
        size.width * 0.7675879,
        size.height * 0.5387324,
        size.width * 0.7449749,
        size.height * 0.5305164,
        size.width * 0.7412060,
        size.height * 0.5287559);
    path13.cubicTo(
        size.width * 0.7374372,
        size.height * 0.5269953,
        size.width * 0.7361809,
        size.height * 0.5264085,
        size.width * 0.7336683,
        size.height * 0.5269953);
    path13.cubicTo(
        size.width * 0.7316583,
        size.height * 0.5274648,
        size.width * 0.7269673,
        size.height * 0.5295387,
        size.width * 0.7248744,
        size.height * 0.5305164);
    path13.cubicTo(
        size.width * 0.6972362,
        size.height * 0.5463615,
        size.width * 0.6934673,
        size.height * 0.5498826,
        size.width * 0.6884422,
        size.height * 0.5487089);
    path13.cubicTo(
        size.width * 0.6834171,
        size.height * 0.5475352,
        size.width * 0.6520101,
        size.height * 0.5569249,
        size.width * 0.6557789,
        size.height * 0.5580986);
    path13.cubicTo(
        size.width * 0.6595477,
        size.height * 0.5592723,
        size.width * 0.6281407,
        size.height * 0.5575117,
        size.width * 0.6256281,
        size.height * 0.5569249);
    path13.cubicTo(
        size.width * 0.6231156,
        size.height * 0.5563380,
        size.width * 0.6180905,
        size.height * 0.5592723,
        size.width * 0.6193467,
        size.height * 0.5604460);
    path13.cubicTo(
        size.width * 0.6206030,
        size.height * 0.5616197,
        size.width * 0.6080402,
        size.height * 0.5610329,
        size.width * 0.6055276,
        size.height * 0.5604460);
    path13.cubicTo(
        size.width * 0.6035176,
        size.height * 0.5599765,
        size.width * 0.6063643,
        size.height * 0.5649448,
        size.width * 0.6080402,
        size.height * 0.5674883);
    path13.cubicTo(
        size.width * 0.6070352,
        size.height * 0.5684272,
        size.width * 0.6009221,
        size.height * 0.5670974,
        size.width * 0.5979899,
        size.height * 0.5663146);
    path13.cubicTo(
        size.width * 0.5942211,
        size.height * 0.5686620,
        size.width * 0.5804020,
        size.height * 0.5768779,
        size.width * 0.5829146,
        size.height * 0.5809859);
    path13.cubicTo(
        size.width * 0.5849246,
        size.height * 0.5842723,
        size.width * 0.5569523,
        size.height * 0.5823556,
        size.width * 0.5427136,
        size.height * 0.5809859);
    path13.cubicTo(
        size.width * 0.5330829,
        size.height * 0.5874413,
        size.width * 0.5145729,
        size.height * 0.5988263,
        size.width * 0.5175879,
        size.height * 0.5927230);
    path13.cubicTo(
        size.width * 0.5206030,
        size.height * 0.5866197,
        size.width * 0.4778065,
        size.height * 0.5901796,
        size.width * 0.4560302,
        size.height * 0.5927230);
    path13.cubicTo(
        size.width * 0.4434673,
        size.height * 0.5956573,
        size.width * 0.4175879,
        size.height * 0.6012911,
        size.width * 0.4145729,
        size.height * 0.6003521);
    path13.cubicTo(
        size.width * 0.4108040,
        size.height * 0.5991784,
        size.width * 0.3907035,
        size.height * 0.6138498,
        size.width * 0.3831658,
        size.height * 0.6138498);
    path13.cubicTo(
        size.width * 0.3771357,
        size.height * 0.6138498,
        size.width * 0.3756281,
        size.height * 0.6048509,
        size.width * 0.3756281,
        size.height * 0.6003521);
    path13.cubicTo(
        size.width * 0.3651583,
        size.height * 0.5980047,
        size.width * 0.3432161,
        size.height * 0.5924883,
        size.width * 0.3391960,
        size.height * 0.5892019);
    path13.cubicTo(
        size.width * 0.3341709,
        size.height * 0.5850939,
        size.width * 0.3090452,
        size.height * 0.5856808,
        size.width * 0.3065327,
        size.height * 0.5880282);
    path13.cubicTo(
        size.width * 0.3045226,
        size.height * 0.5899061,
        size.width * 0.3023442,
        size.height * 0.5903756,
        size.width * 0.3015075,
        size.height * 0.5903756);
    path13.cubicTo(
        size.width * 0.2977387,
        size.height * 0.5909624,
        size.width * 0.2663317,
        size.height * 0.5786385,
        size.width * 0.2663317,
        size.height * 0.5774648);
    path13.cubicTo(
        size.width * 0.2663317,
        size.height * 0.5765258,
        size.width * 0.2613065,
        size.height * 0.5759002,
        size.width * 0.2587940,
        size.height * 0.5757042);
    path13.cubicTo(
        size.width * 0.2547739,
        size.height * 0.5747653,
        size.width * 0.2336683,
        size.height * 0.5811819,
        size.width * 0.2236181,
        size.height * 0.5845070);
    path13.cubicTo(
        size.width * 0.2195980,
        size.height * 0.5854460,
        size.width * 0.2110553,
        size.height * 0.5798122,
        size.width * 0.2072864,
        size.height * 0.5768779);
    path13.cubicTo(
        size.width * 0.2148241,
        size.height * 0.5534038,
        size.width * 0.2097990,
        size.height * 0.5534038,
        size.width * 0.2072864,
        size.height * 0.5539906);
    path13.cubicTo(
        size.width * 0.2052764,
        size.height * 0.5544601,
        size.width * 0.2030987,
        size.height * 0.5541866,
        size.width * 0.2022613,
        size.height * 0.5539906);
    path13.cubicTo(
        size.width * 0.1982412,
        size.height * 0.5544601,
        size.width * 0.1746231,
        size.height * 0.5424495,
        size.width * 0.1633166,
        size.height * 0.5363850);
    path13.cubicTo(
        size.width * 0.1552764,
        size.height * 0.5345070,
        size.width * 0.1532663,
        size.height * 0.5336467,
        size.width * 0.1532663,
        size.height * 0.5334507);
    path13.cubicTo(
        size.width * 0.1528475,
        size.height * 0.5332547,
        size.width * 0.1520101,
        size.height * 0.5329812,
        size.width * 0.1520101,
        size.height * 0.5334507);
    path13.cubicTo(
        size.width * 0.1520101,
        size.height * 0.5339202,
        size.width * 0.1494975,
        size.height * 0.5359941,
        size.width * 0.1482412,
        size.height * 0.5369718);
    path13.cubicTo(
        size.width * 0.1462312,
        size.height * 0.5379108,
        size.width * 0.1407035,
        size.height * 0.5314941,
        size.width * 0.1381910,
        size.height * 0.5281690);
    path13.cubicTo(
        size.width * 0.1306533,
        size.height * 0.5271913,
        size.width * 0.1148241,
        size.height * 0.5258216,
        size.width * 0.1118090,
        size.height * 0.5281690);
    path13.cubicTo(
        size.width * 0.1087940,
        size.height * 0.5305164,
        size.width * 0.1005025,
        size.height * 0.5232782,
        size.width * 0.09673367,
        size.height * 0.5193662);
    path13.cubicTo(
        size.width * 0.08266332,
        size.height * 0.5165493,
        size.width * 0.07998317,
        size.height * 0.5201491,
        size.width * 0.08040201,
        size.height * 0.5223005);
    path13.cubicTo(
        size.width * 0.07939698,
        size.height * 0.5227700,
        size.width * 0.07830829,
        size.height * 0.5224965,
        size.width * 0.07788945,
        size.height * 0.5223005);
    path13.cubicTo(
        size.width * 0.07537688,
        size.height * 0.5228873,
        size.width * 0.05150754,
        size.height * 0.5052817,
        size.width * 0.05276382,
        size.height * 0.5035211);
    path13.cubicTo(
        size.width * 0.05376884,
        size.height * 0.5021127,
        size.width * 0.04313241,
        size.height * 0.5009777,
        size.width * 0.03768844,
        size.height * 0.5005869);
    path13.cubicTo(
        size.width * 0.03894472,
        size.height * 0.4982394,
        size.width * 0.03391960,
        size.height * 0.4953052,
        size.width * 0.03266332,
        size.height * 0.4958920);
    path13.cubicTo(
        size.width * 0.03140704,
        size.height * 0.4964789,
        size.width * 0.02135678,
        size.height * 0.4941315,
        size.width * 0.02135678,
        size.height * 0.4958920);
    path13.close();
    return path13;
  }

  static Paint path13Fill(Size size) {
    Paint paint13Fill = Paint()..style = PaintingStyle.fill;
    paint13Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.3172437, size.height * -39.79448),
        Offset(size.width * 0.2528241, size.height * 1.125853), [
      const Color(0xffE6E2E3).withOpacity(1),
      const Color(0xffE4E4E3).withOpacity(1),
      const Color(0xffDCD7DB).withOpacity(1),
      const Color(0xffF4F4F4).withOpacity(1)
    ], [
      0,
      0.160374,
      0.334099,
      0.751991
    ]);
    return paint13Fill;
  }

  static Path path14(Size size) {
    Path path14 = Path();
    path14.moveTo(size.width * -0.4005779, size.height * 0.02429014);
    path14.cubicTo(
        size.width * -0.4004824,
        size.height * 0.02438908,
        size.width * -0.4003794,
        size.height * 0.02449343,
        size.width * -0.4002714,
        size.height * 0.02460200);
    path14.cubicTo(
        size.width * -0.3989422,
        size.height * 0.02522606,
        size.width * -0.3947462,
        size.height * 0.02663357,
        size.width * -0.3922940,
        size.height * 0.02742394);
    path14.cubicTo(
        size.width * -0.3921884,
        size.height * 0.02789085,
        size.width * -0.3790101,
        size.height * 0.02657500,
        size.width * -0.3724347,
        size.height * 0.02585880);
    path14.cubicTo(
        size.width * -0.3702261,
        size.height * 0.02669448,
        size.width * -0.3652010,
        size.height * 0.02432347,
        size.width * -0.3629648,
        size.height * 0.02303345);
    path14.cubicTo(
        size.width * -0.3646080,
        size.height * 0.02134390,
        size.width * -0.3478417,
        size.height * 0.02288099,
        size.width * -0.3479724,
        size.height * 0.02229742);
    path14.cubicTo(
        size.width * -0.3480779,
        size.height * 0.02183052,
        size.width * -0.3369246,
        size.height * 0.02273850,
        size.width * -0.3313367,
        size.height * 0.02325082);
    path14.cubicTo(
        size.width * -0.3255050,
        size.height * 0.02296455,
        size.width * -0.3136734,
        size.height * 0.02202958,
        size.width * -0.3129899,
        size.height * 0.02057981);
    path14.cubicTo(
        size.width * -0.3123040,
        size.height * 0.01912993,
        size.width * -0.2932839,
        size.height * 0.02020235,
        size.width * -0.2838593,
        size.height * 0.02091984);
    path14.cubicTo(
        size.width * -0.2814925,
        size.height * 0.02021350,
        size.width * -0.2632111,
        size.height * 0.02285646,
        size.width * -0.2633442,
        size.height * 0.02227289);
    path14.cubicTo(
        size.width * -0.2634749,
        size.height * 0.02168920,
        size.width * -0.2499940,
        size.height * 0.01984718,
        size.width * -0.2476266,
        size.height * 0.01914085);
    path14.cubicTo(
        size.width * -0.2457327,
        size.height * 0.01857582,
        size.width * -0.2333354,
        size.height * 0.01902923,
        size.width * -0.2273736,
        size.height * 0.01932664);
    path14.cubicTo(
        size.width * -0.2274786,
        size.height * 0.01885974,
        size.width * -0.2007636,
        size.height * 0.01782347,
        size.width * -0.1873927,
        size.height * 0.01736362);
    path14.cubicTo(
        size.width * -0.1775515,
        size.height * 0.01806068,
        size.width * -0.1579739,
        size.height * 0.01898768,
        size.width * -0.1583940,
        size.height * 0.01712007);
    path14.cubicTo(
        size.width * -0.1589193,
        size.height * 0.01478545,
        size.width * -0.1253168,
        size.height * 0.01254554,
        size.width * -0.1243299,
        size.height * 0.01131697);
    path14.cubicTo(
        size.width * -0.1233432,
        size.height * 0.01008836,
        size.width * -0.09644925,
        size.height * 0.01171835,
        size.width * -0.09520000,
        size.height * 0.01165701);
    path14.cubicTo(
        size.width * -0.09395050,
        size.height * 0.01159566,
        size.width * -0.07619623,
        size.height * 0.01190411,
        size.width * -0.07507814,
        size.height * 0.01125915);
    path14.cubicTo(
        size.width * -0.07396005,
        size.height * 0.01061417,
        size.width * -0.04397462,
        size.height * 0.009141937,
        size.width * -0.04423719,
        size.height * 0.007974660);
    path14.cubicTo(
        size.width * -0.04444724,
        size.height * 0.007040833,
        size.width * -0.01749575,
        size.height * 0.007055106,
        size.width * -0.003993744,
        size.height * 0.007178967);
    path14.cubicTo(
        size.width * 0.007798643,
        size.height * 0.007190070,
        size.width * 0.03130452,
        size.height * 0.006862101,
        size.width * 0.03098945,
        size.height * 0.005461362);
    path14.cubicTo(
        size.width * 0.03067437,
        size.height * 0.004060622,
        size.width * 0.05786231,
        size.height * 0.005125446,
        size.width * 0.07149548,
        size.height * 0.005832946);
    path14.cubicTo(
        size.width * 0.07848794,
        size.height * 0.005096244,
        size.width * 0.09289372,
        size.height * 0.003248110,
        size.width * 0.09457739,
        size.height * 0.001749225);
    path14.cubicTo(
        size.width * 0.09668241,
        size.height * -0.0001243756,
        size.width * 0.1156183,
        size.height * 0.005436854,
        size.width * 0.1152244,
        size.height * 0.003685939);
    path14.cubicTo(
        size.width * 0.1148307,
        size.height * 0.001935023,
        size.width * 0.1302173,
        size.height * 0.002949824,
        size.width * 0.1324535,
        size.height * 0.001659859);
    path14.cubicTo(
        size.width * 0.1346897,
        size.height * 0.0003698932,
        size.width * 0.1710535,
        size.height * -0.0008254155,
        size.width * 0.1719090,
        size.height * -0.002637676);
    path14.cubicTo(
        size.width * 0.1727643,
        size.height * -0.004449941,
        size.width * 0.2120211,
        size.height * -0.004017007,
        size.width * 0.2130078,
        size.height * -0.005245634);
    path14.cubicTo(
        size.width * 0.2137972,
        size.height * -0.006228533,
        size.width * 0.2322741,
        size.height * -0.003831221,
        size.width * 0.2414138,
        size.height * -0.002509707);
    path14.cubicTo(
        size.width * 0.2560779,
        size.height * -0.002836279,
        size.width * 0.2856809,
        size.height * -0.003384965,
        size.width * 0.2867864,
        size.height * -0.002967136);
    path14.cubicTo(
        size.width * 0.2881658,
        size.height * -0.002444836,
        size.width * 0.3449824,
        size.height * -0.008184812,
        size.width * 0.3459698,
        size.height * -0.009413439);
    path14.cubicTo(
        size.width * 0.3469573,
        size.height * -0.01064205,
        size.width * 0.3905528,
        size.height * -0.01337265,
        size.width * 0.3904221,
        size.height * -0.01395634);
    path14.cubicTo(
        size.width * 0.3903166,
        size.height * -0.01442324,
        size.width * 0.4146206,
        size.height * -0.01494777,
        size.width * 0.4267864,
        size.height * -0.01515164);
    path14.cubicTo(
        size.width * 0.4420653,
        size.height * -0.01649190,
        size.width * 0.4728442,
        size.height * -0.01930129,
        size.width * 0.4737387,
        size.height * -0.01981725);
    path14.cubicTo(
        size.width * 0.4748568,
        size.height * -0.02046221,
        size.width * 0.5238467,
        size.height * -0.02168732,
        size.width * 0.5264749,
        size.height * -0.02122641);
    path14.cubicTo(
        size.width * 0.5285804,
        size.height * -0.02085763,
        size.width * 0.5414698,
        size.height * -0.02569977,
        size.width * 0.5476508,
        size.height * -0.02816690);
    path14.cubicTo(
        size.width * 0.5488618,
        size.height * -0.02728216,
        size.width * 0.5343015,
        size.height * -0.02200399,
        size.width * 0.5268693,
        size.height * -0.01947547);
    path14.cubicTo(
        size.width * 0.5270804,
        size.height * -0.01854167,
        size.width * 0.4922362,
        size.height * -0.01620153,
        size.width * 0.4747889,
        size.height * -0.01514812);
    path14.cubicTo(
        size.width * 0.4741332,
        size.height * -0.01375646,
        size.width * 0.4409447,
        size.height * -0.01174636,
        size.width * 0.4224472,
        size.height * -0.01080971);
    path14.cubicTo(
        size.width * 0.4256533,
        size.height * -0.008921984,
        size.width * 0.4260000,
        size.height * -0.002807617,
        size.width * 0.3806533,
        size.height * 0.005832946);
    path14.cubicTo(
        size.width * 0.3797990,
        size.height * 0.007645211,
        size.width * 0.2894171,
        size.height * 0.02276138,
        size.width * 0.2867864,
        size.height * 0.02230047);
    path14.cubicTo(
        size.width * 0.2841558,
        size.height * 0.02183955,
        size.width * 0.1973538,
        size.height * 0.02276138,
        size.width * 0.1947236,
        size.height * 0.02230047);
    path14.cubicTo(
        size.width * 0.1926196,
        size.height * 0.02193169,
        size.width * 0.1488907,
        size.height * 0.007343779,
        size.width * 0.1315304,
        size.height * 0.008786221);
    path14.cubicTo(
        size.width * 0.1205711,
        size.height * 0.008734214,
        size.width * 0.09817864,
        size.height * 0.008771479,
        size.width * 0.09628467,
        size.height * 0.009336538);
    path14.cubicTo(
        size.width * 0.09439070,
        size.height * 0.009901608,
        size.width * 0.07234849,
        size.height * 0.01149523,
        size.width * 0.06156407,
        size.height * 0.01222148);
    path14.cubicTo(
        size.width * 0.06166910,
        size.height * 0.01268838,
        size.width * 0.03477889,
        size.height * 0.01294648,
        size.width * 0.02132068,
        size.height * 0.01301714);
    path14.cubicTo(
        size.width * 0.02020259,
        size.height * 0.01366209,
        size.width * -0.01057093,
        size.height * 0.01163250,
        size.width * -0.01320103,
        size.height * 0.01117155);
    path14.cubicTo(
        size.width * -0.01530513,
        size.height * 0.01080278,
        size.width * -0.03433065,
        size.height * 0.01083210,
        size.width * -0.04358065,
        size.height * 0.01089286);
    path14.cubicTo(
        size.width * -0.05576809,
        size.height * 0.01286808,
        size.width * -0.08119548,
        size.height * 0.01663427,
        size.width * -0.08540352,
        size.height * 0.01589671);
    path14.cubicTo(
        size.width * -0.09066382,
        size.height * 0.01497477,
        size.width * -0.1356422,
        size.height * 0.01718322,
        size.width * -0.1363663,
        size.height * 0.01957911);
    path14.cubicTo(
        size.width * -0.1370905,
        size.height * 0.02197500,
        size.width * -0.1744412,
        size.height * 0.02439894,
        size.width * -0.1781892,
        size.height * 0.02458286);
    path14.cubicTo(
        size.width * -0.1819374,
        size.height * 0.02476690,
        size.width * -0.2139603,
        size.height * 0.02279871,
        size.width * -0.2163279,
        size.height * 0.02350505);
    path14.cubicTo(
        size.width * -0.2186952,
        size.height * 0.02421138,
        size.width * -0.2509171,
        size.height * 0.02697359,
        size.width * -0.2534171,
        size.height * 0.02709624);
    path14.cubicTo(
        size.width * -0.2559146,
        size.height * 0.02721890,
        size.width * -0.2720251,
        size.height * 0.02860000,
        size.width * -0.2757739,
        size.height * 0.02878404);
    path14.cubicTo(
        size.width * -0.2787714,
        size.height * 0.02893122,
        size.width * -0.2896055,
        size.height * 0.02906972,
        size.width * -0.2946457,
        size.height * 0.02912054);
    path14.cubicTo(
        size.width * -0.3007613,
        size.height * 0.03001092,
        size.width * -0.3134925,
        size.height * 0.03181620,
        size.width * -0.3154925,
        size.height * 0.03191432);
    path14.cubicTo(
        size.width * -0.3179899,
        size.height * 0.03203697,
        size.width * -0.3310101,
        size.height * 0.03031585,
        size.width * -0.3322588,
        size.height * 0.03037723);
    path14.cubicTo(
        size.width * -0.3332588,
        size.height * 0.03042629,
        size.width * -0.3396884,
        size.height * 0.02916843,
        size.width * -0.3427789,
        size.height * 0.02853333);
    path14.cubicTo(
        size.width * -0.3452789,
        size.height * 0.02865610,
        size.width * -0.3502236,
        size.height * 0.02913486,
        size.width * -0.3500126,
        size.height * 0.03006866);
    path14.cubicTo(
        size.width * -0.3498040,
        size.height * 0.03100258,
        size.width * -0.3675930,
        size.height * 0.03053838,
        size.width * -0.3765126,
        size.height * 0.03018967);
    path14.cubicTo(
        size.width * -0.3795126,
        size.height * 0.03033685,
        size.width * -0.3897739,
        size.height * 0.02926714,
        size.width * -0.3945302,
        size.height * 0.02871385);
    path14.cubicTo(
        size.width * -0.3953719,
        size.height * 0.02919965,
        size.width * -0.3985327,
        size.height * 0.02634754,
        size.width * -0.4002714,
        size.height * 0.02460200);
    path14.cubicTo(
        size.width * -0.4006658,
        size.height * 0.02441737,
        size.width * -0.4008065,
        size.height * 0.02430129,
        size.width * -0.4005779,
        size.height * 0.02429014);
    path14.close();
    return path14;
  }

  static Paint path14Fill(Size size) {
    Paint paint14Fill = Paint()..style = PaintingStyle.fill;
    paint14Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.1883372, size.height * -1.336937),
        Offset(size.width * 0.1936073, size.height * 0.009712512), [
      const Color(0xffE6E2E3).withOpacity(1),
      const Color(0xffE4E4E3).withOpacity(1),
      const Color(0xffDCD7DB).withOpacity(1),
      const Color(0xffEEEDEE).withOpacity(1)
    ], [
      0,
      0.160374,
      0.334099,
      0.751991
    ]);
    return paint14Fill;
  }
}
