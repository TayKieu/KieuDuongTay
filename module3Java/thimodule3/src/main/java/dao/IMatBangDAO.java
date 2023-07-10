package dao;

import model.MatBang;

import java.util.List;

public interface IMatBangDAO {
List<MatBang> layHetMatBang();
boolean xoa(String ma);
MatBang themMatBang(MatBang matBang);
List<MatBang> timMatBang(int maLoaiMatBang);
}
