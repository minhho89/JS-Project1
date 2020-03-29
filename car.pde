
  //Setup vẽ size Canvas & độ lớn đường đua
  var sizeCanvas_x = 1200;
  var sizeCanvas_y = 900;
  var sizeRideWay = 450;

  var sizeCo = 100; //size cỏ aka cạnh dưới đường đua tới mép dưới màn hình
  var RideWay_y1 = sizeCanvas_y - sizeCo - sizeRideWay; //cạnh trên đường đua
  var RideWay_y2 = sizeCanvas_y - sizeCo; //cạnh dưới đường đua

  // Vị trí bắt đầu các xe
  var xe1_x = 10;
  var xe2_x = 10;
  var xe3_x = 10;

  // var xe1_y = RideWay_y1 + sizeRideWay / 4;
  // var xe2_y = RideWay_y1 + sizeRideWay / 2;
  // var xe3_y = RideWay_y2 - sizeRideWay / 4;

  var xe1_y = random (RideWay_y1, RideWay_y1 + sizeRideWay / 4);
  var xe2_y = random (xe1_y + 30, RideWay_y1 + sizeRideWay / 2);
  var xe3_y = random (xe2_y + 30, RideWay_y2 - sizeRideWay / 4);

  //Tốc độ các xe
  var speedXe1 = random (4,6);
  var speedXe2 = random (4,6);
  var speedXe3 = random (4,6);

  //Chuyển lane
  var ChuyenLaneXe1 = random (-1,1);
  var ChuyenLaneXe2 = random (-1,1);
  var ChuyenLaneXe3 = random (-1,1);

//Kích thước xe
/*
  Kích thước
  W_đầu_xe =  W_thân_xe * 0.7;
  H_đầu_xe = w_thân_xe * 0.3;
  H_thân_xe = w_thân_xe * 0.286;

  W_bánh = W_thân_xe * 0.24;
  H_bánh = H_thân_xe * 0.6;
*/
  //Set kích thước thân xe
  var w_than_xe1 = random (90,140);
  var w_than_xe2 = random (90,140);
  var w_than_xe3 = random (90,140);
  //Đặt biến phụ thuộc đầu xe và bánh xe
  var w_dau_xe1 = w_than_xe1 * 0.7;
  var w_dau_xe2 = w_than_xe2 * 0.7;
  var w_dau_xe3 = w_than_xe3 * 0.7;

  var h_dau_xe1 = w_than_xe1 * 0.3;
  var h_dau_xe2 = w_than_xe2 * 0.3;
  var h_dau_xe3 = w_than_xe3 * 0.3;

  var h_than_xe1 = w_than_xe1 * 0.286;
  var h_than_xe2 = w_than_xe2 * 0.286;
  var h_than_xe3 = w_than_xe3 * 0.286;

  var w_banh_xe1 = w_than_xe1 * 0.24;
  var w_banh_xe2 = w_than_xe2 * 0.24;
  var w_banh_xe3 = w_than_xe3 * 0.24;

  /*Vị trí:
   x_đầu_xe = w_đầu_xe/2.8 - 10 <=>số hạn để lấy giá trị x xuất phát bân đầu cộng vào

   x_bánh_xe_trái = w_thân_xe/4;
   x_bánh_xe_phải = w_than_xe * 0.75;

   y_bánh_xe_trái = y_thân_xe + 0.11 * w_thân_xe;
  */
  var x_dau_xe1 = (w_dau_xe1 / 2.8) - 10;
  var x_dau_xe2 = (w_dau_xe2 / 2.8) - 10;
  var x_dau_xe3 = (w_dau_xe3 / 2.8) - 10;

  var x_banh_trai_xe1 = (w_than_xe1 / 4);
  var x_banh_phai_xe1 = (w_than_xe1 * 0.75);

  var x_banh_trai_xe2 = (w_than_xe2 / 4);
  var x_banh_phai_xe2 = (w_than_xe2 * 0.75);

  var x_banh_trai_xe3 = (w_than_xe3 / 4);
  var x_banh_phai_xe3 = (w_than_xe3 * 0.75);

//Biến vẽ đường xuất phát và kết thúc
  var row = 0;
  var col = 0;

//biến chèn hình ảnh
  var i = 0;
  var j = 0;
  PImage rock; //tạo biến viên đá để load hình vào trong setup()
  PImage duongDua; //biến nền đườn đua
  PImage thamCo; //biến thảm cỏ
  PImage mepCo; //biến mép cỏ
  PImage buiCay; //biến bụi cây
  PImage may; PImage may2; //vẽ mây
  PImage mario; //vẽ Mario
  PImage nui; // vẽ núi

  //viên đá
  var soluong_rock = round (random (1, 4));//tạo ngẫu nhiên số lượng các viên đá
  var x_rock_arr = [random (120, sizeCanvas_x - 30)];
  var y_rock_arr = [random (RideWay_y1, RideWay_y2)];
  var size_rock_arr = [random ( 30, 50)];

  //dùng vòng lập đưa giá trị vào các arr của viên đá//
  var drawRock = function () {
      while (i < soluong_rock) {
      x_rock_arr.push (random (120, sizeCanvas_x - 30));
      y_rock_arr.push (random (RideWay_y1, RideWay_y2));
      size_rock_arr.push (random (30, 50));
      i ++;
      };
    };
  //end viên đá

  //vẽ nền đường đua
  var sizeDuongDua = 60;
  var veDuongDua = function() {
    // vẽ nền
    for (i = 0; i < sizeCanvas_x; i += sizeDuongDua) {
      for (j = RideWay_y1; j < RideWay_y2; j += sizeDuongDua) {
        image (duongDua, i, j, sizeDuongDua, sizeDuongDua);
      }
    }
  };

   // vẽ nền cỏ
  var veCo = function() {
    //cỏ dưới
    for (i = 0; i < sizeCanvas_x; i += sizeCo) {
      for (j = RideWay_y2 + 50; j < sizeCanvas_y; j += sizeCo) {
        image (thamCo, i, j, sizeCo, sizeCo);
      }
    }
    //cỏ trên
    for (i = 0; i < sizeCanvas_x; i += sizeCo / 2) {
      for (j = RideWay_y1 - (sizeCo /2 ); i < sizeCanvas_x; i += sizeCo / 2) {
        image (thamCo, i, j, sizeCo / 2, sizeCo / 2);
      }
    }
  }

  //vẽ bụi cây trên nền cỏ
    var soluong_buiCay_duoi = round (random (8, 15));
    var x_buiCay_duoi_arr = [random (0, sizeCanvas_x)];
    var y_buiCay_duoi_arr = [random (RideWay_y2 + 10, sizeCanvas_y - 20)];
    var size_buiCay_duoi_arr = [random (60, 100)];

    var soluong_buiCay_tren = round (random (10, 15));
    var x_buiCay_tren_arr = [random (0, sizeCanvas_x)];
    var y_buiCay_tren_arr = [random (RideWay_y1 - sizeCo / 2 + 10, RideWay_y1 - 50)];
    var size_buiCay_tren_arr = [random (20, 50)];

    var taoBuiCay = function() {
       //thảm cỏ dưới
       i = 0;
       while (i < soluong_buiCay_duoi) {
         x_buiCay_duoi_arr.push (random (0, sizeCanvas_x));
         y_buiCay_duoi_arr.push (random (RideWay_y2 + 10, sizeCanvas_y  - 20));
         size_buiCay_duoi_arr.push (random (60, 100));
         i ++;
       }
       //thảm cỏ trên
       i = 0;
       while (i < soluong_buiCay_tren) {
         x_buiCay_tren_arr.push (random (0, sizeCanvas_x));
         y_buiCay_tren_arr.push (random (RideWay_y1 - sizeCo / 2 + 10, RideWay_y1 - 50));
         size_buiCay_tren_arr.push (random (20, 50));
         i ++;
       }
    };


  //vẽ mép cỏ
  var sizeMepCo = 40;
  var veMepCo = function() {
    //mép dưới
    for (i = 0; i < sizeCanvas_x; i += sizeMepCo) {
        image (mepCo, i, RideWay_y2 + 50 - sizeMepCo, sizeMepCo, sizeMepCo);// mép cỏ dưới
      }
    //mép trên
    for (i = 0; i < sizeCanvas_x; i += sizeMepCo) {
        image (mepCo, i, RideWay_y1 - (sizeCo /2 ) - 20, sizeMepCo, sizeMepCo);// mép cỏ dưới
      }
  };
  // Vẽ vạch caro
  var veVachCaro = function () {
    //Vạch Caro xuất phát
      fill (0, 0, 0);//đen
      rect (0, RideWay_y1, 25, sizeRideWay + 50);// vẽ nền thanh đen
      fill (255, 255,255);//trắng
      rect (25, RideWay_y1, 25, sizeRideWay + 50);// vẽ nền thanh trắng

      //sọc trắng
      for (col = RideWay_y1; col < RideWay_y2 + 50; col += 50) {
        for (row = 0; row < 25; row += 25) {
          fill(255, 255, 255);
          rect(row, col, 25, 25);
        }
      }

      //sọc đen
      for (col = RideWay_y1; col < RideWay_y2 + 50; col += 50) {
        for (row = 25; row < 30; row+=25) {
          fill(0, 0, 0);
          rect(row, col, 25, 25);
        }
      }
      //End Vạch Caro xuát phát

      //Vạch Caro kết thúc
      fill (255, 255, 255);//trắng
      rect (sizeCanvas_x - 100, RideWay_y1, 25, 500);// vẽ nền thanh trắng
      fill (0, 0, 0);//đen
      rect (sizeCanvas_x - 100 + 25, RideWay_y1, 25, 500);;// vẽ nền thanh đen
      for (col = RideWay_y1; col < RideWay_y2 + 50; col += 50) {
        for (row = sizeCanvas_x - 100; row < sizeCanvas_x - 100 + 50; row += 25) {
          fill(0,0,0);
          rect(row, col, 25, 25);
        }
      }
      for (col = RideWay_y1; col < RideWay_y2 + 50; col += 50) {
        for (row = sizeCanvas_x - 100 + 25; row < sizeCanvas_x - 100 + 50; row+=25) {
          fill(255,255,255);
          rect(row, col, 25, 25);
        }
      }
    }
  //End Vạch Caro kết thúc
    // Xử lý các biến hiện bảng thông báo
    var bangThongBao_w = 800;
    var bangThongBao_h = 100;
    var bangThongBao_x = sizeCanvas_x / 2 - bangThongBao_w / 2;
    var bangThongBao_y = RideWay_y1 * 1/3;
    var XeThang = 0;
    // Thông báo xe số x thắng
    var thongbao_Thang = function (XeThang) {
      fill (255, 153, 51);
      stroke (0, 0, 0);
      rect (bangThongBao_x, bangThongBao_y, bangThongBao_w, bangThongBao_h);
      textSize (30);
      fill (255, 255, 204);
      textAlign(CENTER, CENTER);
      text ("XIN CHÚC MỪNG, XE SỐ " + XeThang + " LÀ NHÀ VÔ ĐỊCH!!", bangThongBao_x + bangThongBao_w / 2, bangThongBao_y + bangThongBao_h / 2);
    }
    // Thông báo 3 xe đều bị loại
    var thongbao_Loai = function () {
      fill (255, 0, 0);
      stroke (0, 0, 0);
      rect (bangThongBao_x, bangThongBao_y, bangThongBao_w, bangThongBao_h);
      textSize (30);
      fill (255, 255, 0);
      textAlign(CENTER, CENTER);
      text ("RẤT TIẾC, CẢ 3 XE ĐỀU BỊ LOẠI KHỎI CUỘC CHƠI.", bangThongBao_x + bangThongBao_w / 2, bangThongBao_y + bangThongBao_h / 2);
    }

  // Vẽ lane đường
  var veLanDuong = function () {
    fill (192, 192, 192) ;
     for (i = 0; i < sizeCanvas_x; i += 200){
       rect(i, RideWay_y1 + sizeRideWay / 4, 100, 20); //lane trên đứt khúc
       rect(i, RideWay_y1 + sizeRideWay / 2, sizeCanvas_x, 20); //lane giữa liền
       rect(i + 100, RideWay_y2 - sizeRideWay / 4, 100, 20);//lane dưới đứt khúc lệch lane trên
     }
   }
  //Vẽ các thông tin hỗ trợ
  var veToaDo = function() {
      fill (0,204,0);
      i = 0;// Trục x
      while (i < sizeCanvas_x) {
        text (i, i, 10);
        i += 50;
      }
      i = 0; //Trục y
      while (i < sizeCanvas_y) {
        text(i, 10, i);
        i += 50;
      }
    };
   var veDuongToaDo = function () {
     i = 0;
     while (i < sizeCanvas_x) {
       stroke(126);
       line (i, 0 ,i , 800);
       i += 50;
     }
     i = 0;
     while (i <  sizeCanvas_y) {
       stroke(126);
       line (0, i, 1000 , i);
       i += 50;
     }
   };

  var inManHinhThongTin = function () {
   fill (0, 0, 0);
    //Tốc độ xe
    text ("tốc độ xe 1 Red = " + speedXe1.toFixed(2), 30, 30);
    text ("tốc độ xe 2 Blue = " + speedXe2.toFixed(2), 30, 50);
    text ("tốc độ xe 3 Yellow = " + speedXe3.toFixed(2), 30, 70);
    //Thông số chuyển lane
    text ("ChuyenLaneXe1 = " + ChuyenLaneXe1.toFixed(2), 200, 30);
    text ("ChuyenLaneXe2 = " + ChuyenLaneXe2.toFixed(2), 200, 50);
    text ("ChuyenLaneXe3 = " + ChuyenLaneXe3.toFixed(2), 200, 70);
    //Tọa đố xe
    text ("toa do xe 1 = " + xe1_x.toFixed(2) + "; " + xe1_y.toFixed(2), 400, 30);
    text ("toa do xe 2 = " + xe2_x.toFixed(2) + "; " + xe2_y.toFixed(2), 400, 50);
    text ("toa do xe 3 = " + xe3_x.toFixed(2) + "; " + xe3_y.toFixed(2), 400, 70);
    //Số lượng đá
    text("Số lượng đá =" + soluong_rock, 30, 90);
    //Tọa độ các mốc
    text("size cỏ ="  + sizeCo, 30, 110);
    text("RideWay_y1 = " + RideWay_y1, 30, 130);
    text("RideWay_y2 = " + RideWay_y2, 30, 150);
 };
var xe1_vacham = function () {
  speedXe1 = 0;
  ChuyenLaneXe1 = 0;
  fill (255, 0, 0);
  ellipse (xe1_x + 50, xe1_y - 50, 30, 30);
};
var xe2_vacham = function () {
  speedXe2 = 0;
  ChuyenLaneXe2 = 0;
  fill (255, 0, 0);
  ellipse (xe2_x + 50, xe2_y - 50, 30, 30);
};
var xe3_vacham = function () {
  speedXe3 = 0;
  ChuyenLaneXe3 = 0;
  fill (255, 0, 0);
  ellipse (xe3_x + 50, xe3_y - 50, 30, 30);
};


void setup () {
  size(sizeCanvas_x, sizeCanvas_y);
  background(125);
  //Load hình ảnh vào các biến
  rock = loadImage("img/rock.png");
  duongDua = loadImage("img/duong_dua.png");
  thamCo = loadImage("img/grass.png");
  mepCo = loadImage("img/mep_co.png");
  buiCay = loadImage("img/bui-cay.png");
  may = loadImage("img/cloud.png");
  may2 = loadImage("img/cloud2.png");
  mario = loadImage("img/mario.png");
  nui = loadImage("img/nui2.png");

  drawRock();// truyền giá trị ngẫu nhiên vào cho các viên đá
  taoBuiCay();// truyền giá trị ngẫu nhiên vào cho các bụi cây
};

  //Vẽ bụi cây
  var veBuiCay = function () {
    i = 0;
    while (i < soluong_buiCay_duoi) {
      image (buiCay, x_buiCay_duoi_arr[i], y_buiCay_duoi_arr[i], size_buiCay_duoi_arr[i], size_buiCay_duoi_arr[i]);
      i++;
    }
    i = 0;
    while (i < soluong_buiCay_tren) {
      image (buiCay, x_buiCay_tren_arr[i], y_buiCay_tren_arr[i], size_buiCay_tren_arr[i], size_buiCay_tren_arr[i]);
      i++;
    }
  }

  //Vẽ mây
  var veMay = function () {
     i = 10;
     //mây trên tỷ lệ mây 2.65 * 1
     while (i < sizeCanvas_x) {
     image (may, i, 50, 150, 56.6);
     i += 400;
    }
    //mây dưới tỷ lệ mây 1 * 1.02
    i = 200;
    while (i < sizeCanvas_x) {
    image (may2, i, 120, 100, 102);
    i += 400;
   }
  };

  //Biến về Mario
  var x_mario = random (1, sizeCanvas_x);
  var y_mario = RideWay_y1 - 5;
  var w_marrio = 50;
  var h_mario = 49.4;
  mario_delta_y = -1;

  //Biến vẽ núi h: 1 * w: 2.6
  var w_nui = sizeCanvas_x;
  var h_nui = sizeCanvas_x / 2.67;
  var x_nui = 0;
  var y_nui = RideWay_y1 - h_nui;
  var veNui = function() {
    image (nui, x_nui, y_nui, w_nui, h_nui);
  }

draw = function() {
    // all lines of code inside here will be run repeatedly
    //ranh giới 2 biên đường đua y1 = 450, y2 = 900
    // background(151, 244, 247);
    noStroke();
    background(102, 205, 205);
    veNui();
    veMay();

    // inManHinhThongTin();
      //Mario nhảy
    image (mario, x_mario, y_mario, w_marrio, h_mario);
    y_mario += 3 * mario_delta_y;

    if (y_mario < RideWay_y1 -200 || y_mario > RideWay_y1) {
    mario_delta_y = -1 * mario_delta_y ;
    }

    veDuongDua(); //vẽ nền đường đua
    veLanDuong (); // vẽ lane
    veVachCaro(); // vẽ vạch caro xuất phát và về đích
    veCo(); //Vẽ cỏ
    //vẽ đá
    i = 0;
    while (i < soluong_rock) {
      image (rock, x_rock_arr[i], y_rock_arr[i], size_rock_arr[i], size_rock_arr[i]);
      i++;
    }
    //End Mario nhảy
    veMepCo(); //Vẽ mép cỏ
    veBuiCay(); //Vẽ bụi cây
      // stroke(126);
      // veToaDo();

      //VẼ XE
      // Start red car xe1
        // draw the red car body
      fill(255, 0, 115);
      rect(xe1_x, xe1_y, w_than_xe1, h_than_xe1); //thân xe
      rect(xe1_x + x_dau_xe1, xe1_y-h_dau_xe1 + 2, w_dau_xe1, h_dau_xe1); //đầu xe
      text ("1", xe1_x + 2,xe1_y - 2);
      // draw the red car wheels
      fill(255, 255, 255);
      ellipse(xe1_x + x_banh_trai_xe1, (xe1_y + h_than_xe1 + 0.05 * h_than_xe1), w_banh_xe1, w_banh_xe1); //bánh trái
      ellipse(xe1_x + x_banh_phai_xe1, (xe1_y + h_than_xe1 + 0.05 * h_than_xe1), w_banh_xe1, w_banh_xe1); // bánh phải
      // End red car

      // Start blue car xe2
        // draw the blue car body
      fill(0, 51, 255);
      rect(xe2_x, xe2_y, w_than_xe2, h_than_xe2); //thân xe
      rect(xe2_x + x_dau_xe2, xe2_y-h_dau_xe2 + 2, w_dau_xe2, h_dau_xe2); //đầu xe
      text ("2", xe2_x + 2,xe2_y - 2);
      // draw the red car wheels
      // draw the blue car wheels
      fill(0, 0, 0);
      ellipse(xe2_x + x_banh_trai_xe2,(xe2_y + h_than_xe2 + 0.05 * h_than_xe2), w_banh_xe2, w_banh_xe2); //bánh trái
      ellipse(xe2_x + x_banh_phai_xe2,(xe2_y + h_than_xe2 + 0.05 * h_than_xe2), w_banh_xe2, w_banh_xe2); // bánh phải
      // End blue car

      // Start yellow car xe3
        // draw the yellow car body
      fill(255, 255, 0);
      rect(xe3_x, xe3_y, w_than_xe3, h_than_xe3); //thân xe
      rect(xe3_x + x_dau_xe3, xe3_y-h_dau_xe3 + 2, w_dau_xe3, h_dau_xe3); //đầu xe
      text ("3", xe3_x + 2,xe3_y - 2);
      // draw the yellow car wheels
      fill(208, 208, 208);
      ellipse(xe3_x + x_banh_trai_xe3,(xe3_y + h_than_xe3 + 0.05 * h_than_xe3), w_banh_xe3, w_banh_xe3); //bánh trái
      ellipse(xe3_x + x_banh_phai_xe3,(xe3_y + h_than_xe3 + 0.05 * h_than_xe3), w_banh_xe3, w_banh_xe3); // bánh phải
      // End yellow car

//------------------------------------- XỬ LÝ VA CHAM--------------------------------------//

      // Xử lý với xe 1 - đối với xe 2
        //Xe 1 bên trái trên xe 2
        if (xe1_x < xe2_x && xe2_x < xe1_x + w_than_xe1 ) {
            if (xe1_y < xe2_y && xe2_y < xe1_y + h_than_xe1) {
              xe1_vacham();
              xe2_vacham();
            }
        }
        //Xe 1 bên phải trên xe 2
        if (xe1_x < xe2_x + w_than_xe2 &&  xe2_x < xe1_x + w_than_xe1) {
          if (xe2_y < xe1_y && xe1_y < xe2_y + h_than_xe2) {
            xe1_vacham();
            xe2_vacham();
          }
        }
        //Xe 1 bên trái dưới xe 2
        if (xe1_x < xe2_x && xe2_x < xe1_x + h_than_xe1) {
          if (xe1_y < xe2_y + h_than_xe2 && xe2_y + h_than_xe2 < xe1_y + h_than_xe1 ) {
            xe1_vacham();
            xe2_vacham();
          }
        }
        //Xe 1 bên phải dưới xe 2
        if (xe1_x < xe2_x + w_than_xe2 && xe2_x + w_than_xe2 < xe1_x + h_than_xe1) {
          if (xe1_y < xe2_y + h_than_xe2 && xe2_y + h_than_xe2 < xe1_y + h_than_xe1) {;
            xe1_vacham();
            xe2_vacham();
          }
        }

      // Xử lý với xe 1 - đối với xe 3
      //Xe 1 bên trái trên xe 3
      if (xe1_x < xe3_x && xe3_x < xe1_x + w_than_xe1 ) {
          if (xe1_y < xe3_y && xe3_y < xe1_y + h_than_xe1) {
            xe1_vacham();
            xe3_vacham();
          }
      }
      //Xe 1 bên phải trên xe 3
      if (xe1_x < xe3_x + w_than_xe3 &&  xe3_x < xe1_x + w_than_xe1) {
        if (xe3_y < xe1_y && xe1_y < xe3_y + h_than_xe3) {
          xe1_vacham();
          xe3_vacham();
        }
      }
      //Xe 1 bên trái dưới xe 3
      if (xe1_x < xe3_x && xe3_x < xe1_x + h_than_xe1) {
        if (xe1_y < xe3_y + h_than_xe3 && xe3_y + h_than_xe3 < xe1_y + h_than_xe1 ) {
          xe1_vacham();
          xe3_vacham();
        }
      }
      //Xe 1 bên phải dưới xe 3
      if (xe1_x < xe3_x + w_than_xe3 && xe3_x + w_than_xe3 < xe1_x + h_than_xe1) {
        if (xe1_y < xe3_y + h_than_xe3 && xe3_y + h_than_xe3 < xe1_y + h_than_xe1) {
          xe1_vacham();
          xe3_vacham();
        }
      }
      // Xử lý với xe 2 - đối với xe 3
      //Xe 2 bên trái trên xe 3
      if (xe2_x < xe3_x && xe3_x < xe2_x + w_than_xe2 ) {
        if (xe2_y < xe3_y && xe3_y < xe2_y + h_than_xe2) {
          xe2_vacham();
          xe3_vacham();
        }
      }
      //Xe 2 bên phải trên xe 3
      if (xe2_x < xe3_x + w_than_xe3 &&  xe3_x < xe2_x + w_than_xe2) {
        if (xe3_y < xe2_y && xe2_y < xe3_y + h_than_xe3) {
          xe2_vacham();
          xe3_vacham();
        }
      }
      //Xe 2 bên trái dưới xe 3
      if (xe2_x < xe3_x && xe3_x < xe2_x + h_than_xe2) {
        if (xe2_y < xe3_y + h_than_xe3 && xe3_y + h_than_xe3 < xe2_y + h_than_xe2 ) {
          xe2_vacham();
          xe3_vacham();
        }
      }
      //Xe 2 bên phải dưới xe 3
      if (xe2_x < xe3_x + w_than_xe3 && xe3_x + w_than_xe3 < xe2_x + h_than_xe2) {
        if (xe2_y < xe3_y + h_than_xe3 && xe3_y + h_than_xe3 < xe2_y + h_than_xe2) {
          xe2_vacham();
          xe3_vacham();
        }
      }

    // Xử lý với xe 2 - đối với xe 1
      //Xe 2 bên trái trên xe 1
      if (xe2_x < xe1_x && xe1_x < xe2_x + w_than_xe2 ) {
        if (xe2_y < xe1_y && xe1_y < xe2_y + h_than_xe2) {
          xe2_vacham();
          xe1_vacham();
        }
      }
      //Xe 2 bên phải trên xe 1
      if (xe2_x < xe1_x + w_than_xe1 &&  xe1_x < xe2_x + w_than_xe2) {
        if (xe1_y < xe2_y && xe2_y < xe1_y + h_than_xe1) {
          xe2_vacham();
          xe1_vacham();
        }
      }
      //Xe 2 bên trái dưới xe 1
      if (xe2_x < xe1_x && xe1_x < xe2_x + h_than_xe2) {
        if (xe2_y < xe1_y + h_than_xe1 && xe1_y + h_than_xe1 < xe2_y + h_than_xe2 ) {
          xe2_vacham();
          xe1_vacham();
        }
      }
      //Xe 2 bên phải dưới xe 1
      if (xe2_x < xe1_x + w_than_xe1 && xe1_x + w_than_xe1 < xe2_x + h_than_xe2) {
        if (xe2_y < xe1_y + h_than_xe1 && xe1_y + h_than_xe1 < xe2_y + h_than_xe2) {
          xe2_vacham();
          xe1_vacham();
        }
      }

  // Xử lý với xe 3 - đối với xe 1
    //Xe 3 bên trái trên xe 1
    if (xe3_x < xe1_x && xe1_x < xe3_x + w_than_xe3 ) {
      if (xe3_y < xe1_y && xe1_y < xe3_y + h_than_xe3) {
        xe3_vacham();
        xe1_vacham();
      }
    }
    //Xe 3 bên phải trên xe 1
    if (xe3_x < xe1_x + w_than_xe1 &&  xe1_x < xe3_x + w_than_xe3) {
      if (xe1_y < xe3_y && xe3_y < xe1_y + h_than_xe1) {
        xe3_vacham();
        xe1_vacham();
      }
    }
    //Xe 3 bên trái dưới xe 1
    if (xe3_x < xe1_x && xe1_x < xe3_x + h_than_xe3) {
      if (xe3_y < xe1_y + h_than_xe1 && xe1_y + h_than_xe1 < xe3_y + h_than_xe3 ) {
        xe3_vacham();
        xe1_vacham();
      }
    }
    //Xe 3 bên phải dưới xe 1
    if (xe3_x < xe1_x + w_than_xe1 && xe1_x + w_than_xe1 < xe3_x + h_than_xe3) {
      if (xe3_y < xe1_y + h_than_xe1 && xe1_y + h_than_xe1 < xe3_y + h_than_xe3) {
        xe3_vacham();
        xe1_vacham();
      }
    }

    // Xử lý với xe 3 - đối với xe 1
      //Xe 3 bên trái trên xe 1
      if (xe3_x < xe1_x && xe1_x < xe3_x + w_than_xe3 ) {
        if (xe3_y < xe1_y && xe1_y < xe3_y + h_than_xe3) {
          xe3_vacham();
          xe1_vacham();
        }
      }
      //Xe 3 bên phải trên xe 1
      if (xe3_x < xe1_x + w_than_xe1 &&  xe1_x < xe3_x + w_than_xe3) {
        if (xe1_y < xe3_y && xe3_y < xe1_y + h_than_xe1) {
          xe3_vacham();
          xe1_vacham();
        }
      }
      //Xe 3 bên trái dưới xe 1
      if (xe3_x < xe1_x && xe1_x < xe3_x + h_than_xe3) {
        if (xe3_y < xe1_y + h_than_xe1 && xe1_y + h_than_xe1 < xe3_y + h_than_xe3 ) {
          xe3_vacham();
          xe1_vacham();
        }
      }
      //Xe 3 bên phải dưới xe 1
      if (xe3_x < xe1_x + w_than_xe1 && xe1_x + w_than_xe1 < xe3_x + h_than_xe3) {
        if (xe3_y < xe1_y + h_than_xe1 && xe1_y + h_than_xe1 < xe3_y + h_than_xe3) {
          xe3_vacham();
          xe1_vacham();
        }
      }

    // Xử lý với xe 3 - đối với xe 2
      //Xe 3 bên trái trên xe 2
      if (xe3_x < xe2_x && xe2_x < xe3_x + w_than_xe3 ) {
        if (xe3_y < xe2_y && xe2_y < xe3_y + h_than_xe3) {
          xe3_vacham();
          xe2_vacham();
        }
      }
      //Xe 3 bên phải trên xe 2
      if (xe3_x < xe2_x + w_than_xe2 &&  xe2_x < xe3_x + w_than_xe3) {
        if (xe2_y < xe3_y && xe3_y < xe2_y + h_than_xe2) {
          xe3_vacham();
          xe2_vacham();
        }
      }
      //Xe 3 bên trái dưới xe 2
      if (xe3_x < xe2_x && xe2_x < xe3_x + h_than_xe3) {
        if (xe3_y < xe2_y + h_than_xe2 && xe2_y + h_than_xe2 < xe3_y + h_than_xe3 ) {
          xe3_vacham();
          xe2_vacham();
        }
      }
      //Xe 3 bên phải dưới xe 2
      if (xe3_x < xe2_x + w_than_xe2 && xe2_x + w_than_xe2 < xe3_x + h_than_xe3) {
        if (xe3_y < xe2_y + h_than_xe2 && xe2_y + h_than_xe2 < xe3_y + h_than_xe3) {
          xe3_vacham();
          xe2_vacham();
        }
      }


//------------- Xử lý va chạm với đá --------------------------//
  //Xe va chạm từ trên trái xuống
  i = 0;
  while(i < soluong_rock) {
    //xe 1
    if(xe1_x < x_rock_arr[i] + 1 && x_rock_arr[i] < xe1_x + w_than_xe1) {
      if(y_rock_arr[i] < xe1_y + h_than_xe1 && xe1_y + h_than_xe1 < y_rock_arr[i] + size_rock_arr[i]) {
        xe1_vacham ();
      }
    }
    //xe 2
    if(xe2_x < x_rock_arr[i] + 1 && x_rock_arr[i] < xe2_x + w_than_xe2) {
      if(y_rock_arr[i] < xe2_y + h_than_xe2 && xe2_y + h_than_xe2 < y_rock_arr[i] + size_rock_arr[i]) {
        xe2_vacham ();
      }
    }
    //Xe 3
    if(xe3_x < x_rock_arr[i] + 1 && x_rock_arr[i] < xe3_x + w_than_xe3) {
      if(y_rock_arr[i] < xe3_y + h_than_xe3 && xe3_y + h_than_xe3 < y_rock_arr[i] + size_rock_arr[i]) {
        xe3_vacham ();
      }
    }
    //Xe va chạm từ dưới phải lên
    //Xe 1
    if(xe1_x < x_rock_arr[i] &&  x_rock_arr[i] < xe1_x + w_than_xe1) {
      if(xe1_y < y_rock_arr[i] + size_rock_arr[i] && y_rock_arr[i] + size_rock_arr[i] < xe1_y + h_than_xe1){
        xe1_vacham ();
      }
    }
    //Xe 2
    if(xe2_x < x_rock_arr[i] &&  x_rock_arr[i] < xe2_x + w_than_xe2) {
      if(xe2_y < y_rock_arr[i] + size_rock_arr[i] && y_rock_arr[i] + size_rock_arr[i] < xe2_y + h_than_xe2){
        xe2_vacham ();
      }
    }
    //Xe 3
    if(xe3_x < x_rock_arr[i] &&  x_rock_arr[i] < xe3_x + w_than_xe3) {
      if(xe3_y < y_rock_arr[i] + size_rock_arr[i] && y_rock_arr[i] + size_rock_arr[i] < xe3_y + h_than_xe3){
        xe3_vacham ();
        }
      }
      i++;
    }
//End xử lý va chạm với đá
//------------------END XỬ LÝ VA CHẠM -----------------------------------------------------//
//----------------- XỬ LÝ DI CHUYỂN ------------------------------------------------------//
      //Xe dừng khi tới vạch
      //Xử lý ra kết quả
      if (xe1_x + w_than_xe1> sizeCanvas_x - 100) {
        speedXe1 = 0;
        ChuyenLaneXe1 = 0;
        thongbao_Thang (1);
        // textSize(15);
        // fill(255, 0, 0);
        // text ("XIN CHÚC MỪNG, XE SỐ 1 LÀ NHÀ VÔ ĐỊCH!!", 300, 240);
        noloop();
      }
      if (xe2_x + w_than_xe2 > sizeCanvas_x - 100) {
        speedXe2 = 0;
        ChuyenLaneXe2 = 0;
        thongbao_Thang (2);
        // textSize(15);
        // fill(255, 0, 0);
        // text ("XIN CHÚC MỪNG, XE SỐ 2 LÀ NHÀ VÔ ĐỊCH!!", 300, 240);
        noloop();
      }
      if (xe3_x + w_than_xe3 > sizeCanvas_x - 100) {
        speedXe3 = 0;
        ChuyenLaneXe3 = 0;
        thongbao_Thang (3);
        // textSize(15);
        // fill(255, 0, 0);
        // text ("XIN CHÚC MỪNG, XE SỐ 3 LÀ NHÀ VÔ ĐỊCH!!", 300, 240);
        noloop();
      }
      //End game khi cả 3 xe đêu dừng
      if (speedXe1 === 0 && speedXe2 === 0 && speedXe3 === 0) {
        thongbao_Loai();
        noloop();
      }
    // Xe di chuyển
    xe1_x += speedXe1;
    xe2_x += speedXe2;
    xe3_x += speedXe3;

    xe1_y += ChuyenLaneXe1;
    xe2_y += ChuyenLaneXe2;
    xe3_y += ChuyenLaneXe3;

  //Chạm lane đổi dấu ChuyenLaneXe để xe bật lên hoặc xuống
  /* Chú thích
  sizeCanvas_y - sizeCo - sizeRideWay = cạnh trên đường đua
  sizeCanvas_y - sizeCo = cạnh dưới đường đua
  */
  if (xe1_y < RideWay_y1 || xe1_y > RideWay_y2) {
    ChuyenLaneXe1 =  -1 * ChuyenLaneXe1;
  }
  if (xe2_y < RideWay_y1 || xe2_y > RideWay_y2) {
    ChuyenLaneXe2 =  -1 * ChuyenLaneXe2;
  }
  if (xe3_y < RideWay_y1 || xe3_y > RideWay_y2) {
    ChuyenLaneXe3 =  -1 * ChuyenLaneXe3;
  }
};
// March 28 2020 by MinhHo (FX03283)
