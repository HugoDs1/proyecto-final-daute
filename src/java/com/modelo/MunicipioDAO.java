package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MunicipioDAO extends Conexion {

    public ArrayList<Municipio> mostrarMunicipio() {
        ArrayList<Municipio> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM municipio";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Municipio m = new Municipio();
                m.setIdMunicipio(rs.getInt(1));
                m.setNombreMunicipio(rs.getString(2));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
}
