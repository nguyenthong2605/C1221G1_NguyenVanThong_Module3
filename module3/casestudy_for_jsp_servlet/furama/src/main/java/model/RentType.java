package model;

public class RentType {
    private Integer maKieuThue;

    private String tenKieuThue;

    public RentType(Integer maKieuThue, String tenKieuThue) {
        this.maKieuThue = maKieuThue;
        this.tenKieuThue = tenKieuThue;
    }

    public RentType() {
    }

    public Integer getMaKieuThue() {
        return maKieuThue;
    }

    public void setMaKieuThue(Integer maKieuThue) {
        this.maKieuThue = maKieuThue;
    }

    public String getTenKieuThue() {
        return tenKieuThue;
    }

    public void setTenKieuThue(String tenKieuThue) {
        this.tenKieuThue = tenKieuThue;
    }
}
