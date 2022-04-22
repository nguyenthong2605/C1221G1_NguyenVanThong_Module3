package model;
//ma_dich_vu int primary key auto_increment,
//        ten_dich_vu varchar(45) not null,
//        dien_tich int,
//        chi_phi_thue double,
//        so_nguoi_toi_da int,
//        tieu_chuan_phong varchar(45),
//        mo_ta_tien_nghi_khac varchar(45),
//        dien_tich_ho_boi double,
//        so_tang int,
//        ma_kieu_thue int, foreign key(ma_kieu_thue) references kieu_thue(ma_kieu_thue),
//        ma_loai_dich_vu int, foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
//        );
public class Service {
    private Integer maDichVu;
    private String tenDichVu;
    private Integer dienTich;
    private Double chiPhiThue;
    private Integer soNguoiToiDa;
    private String tieuChuanPhong;
    private String moTaTienNghiKhac;
    private Double dienTichHoBoi;
    private Integer soTang;
    private Integer maKieuThue;
    private Integer maLoaiDichVu;

    public Service(Integer maDichVu, String tenDichVu, Integer dienTich, Double chiPhiThue, Integer soNguoiToiDa, String tieuChuanPhong, String moTaTienNghiKhac, Double dienTichHoBoi, Integer soTang, Integer maKieuThue, Integer maLoaiDichVu) {
        this.maDichVu = maDichVu;
        this.tenDichVu = tenDichVu;
        this.dienTich = dienTich;
        this.chiPhiThue = chiPhiThue;
        this.soNguoiToiDa = soNguoiToiDa;
        this.tieuChuanPhong = tieuChuanPhong;
        this.moTaTienNghiKhac = moTaTienNghiKhac;
        this.dienTichHoBoi = dienTichHoBoi;
        this.soTang = soTang;
        this.maKieuThue = maKieuThue;
        this.maLoaiDichVu = maLoaiDichVu;
    }

    public Service() {
    }

    public Integer getMaDichVu() {
        return maDichVu;
    }

    public void setMaDichVu(Integer maDichVu) {
        this.maDichVu = maDichVu;
    }

    public String getTenDichVu() {
        return tenDichVu;
    }

    public void setTenDichVu(String tenDichVu) {
        this.tenDichVu = tenDichVu;
    }

    public Integer getDienTich() {
        return dienTich;
    }

    public void setDienTich(Integer dienTich) {
        this.dienTich = dienTich;
    }

    public Double getChiPhiThue() {
        return chiPhiThue;
    }

    public void setChiPhiThue(Double chiPhiThue) {
        this.chiPhiThue = chiPhiThue;
    }

    public Integer getSoNguoiToiDa() {
        return soNguoiToiDa;
    }

    public void setSoNguoiToiDa(Integer soNguoiToiDa) {
        this.soNguoiToiDa = soNguoiToiDa;
    }

    public String getTieuChuanPhong() {
        return tieuChuanPhong;
    }

    public void setTieuChuanPhong(String tieuChuanPhong) {
        this.tieuChuanPhong = tieuChuanPhong;
    }

    public String getMoTaTienNghiKhac() {
        return moTaTienNghiKhac;
    }

    public void setMoTaTienNghiKhac(String moTaTienNghiKhac) {
        this.moTaTienNghiKhac = moTaTienNghiKhac;
    }

    public Double getDienTichHoBoi() {
        return dienTichHoBoi;
    }

    public void setDienTichHoBoi(Double dienTichHoBoi) {
        this.dienTichHoBoi = dienTichHoBoi;
    }

    public Integer getSoTang() {
        return soTang;
    }

    public void setSoTang(Integer soTang) {
        this.soTang = soTang;
    }

    public Integer getMaKieuThue() {
        return maKieuThue;
    }

    public void setMaKieuThue(Integer maKieuThue) {
        this.maKieuThue = maKieuThue;
    }

    public Integer getMaLoaiDichVu() {
        return maLoaiDichVu;
    }

    public void setMaLoaiDichVu(Integer maLoaiDichVu) {
        this.maLoaiDichVu = maLoaiDichVu;
    }
}
