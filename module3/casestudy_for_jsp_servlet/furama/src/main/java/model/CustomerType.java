package model;

public class CustomerType {
    private Integer maLoaiKhach;
    private String tenLoaiKhachHang;

    public CustomerType(Integer maLoaiKhach, String tenLoaiKhachHang) {
        this.maLoaiKhach = maLoaiKhach;
        this.tenLoaiKhachHang = tenLoaiKhachHang;
    }

    public CustomerType() {
    }

    public Integer getMaLoaiKhach() {
        return maLoaiKhach;
    }

    public void setMaLoaiKhach(Integer maLoaiKhach) {
        this.maLoaiKhach = maLoaiKhach;
    }

    public String getTenLoaiKhachHang() {
        return tenLoaiKhachHang;
    }

    public void setTenLoaiKhachHang(String tenLoaiKhachHang) {
        this.tenLoaiKhachHang = tenLoaiKhachHang;
    }
}
