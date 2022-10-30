package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DepartamentoDAO extends Conexion {

    public ArrayList<Departamento> mostrarDepartamento() {

        ArrayList<Departamento> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM departamento";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Departamento d = new Departamento();
                d.setIdDepartamento(rs.getInt(1));
                d.setNombre(rs.getString(2));
                lista.add(d);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
}
