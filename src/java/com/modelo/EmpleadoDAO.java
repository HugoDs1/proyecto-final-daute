package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmpleadoDAO extends Conexion {

    public int insertarEmpleado(Empleado e) {
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO empleado(dui, nombre, apellido, salario, estado) VALUES(?,?,?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, e.getDui());
            pre.setString(2, e.getNombre());
            pre.setString(3, e.getApellido());
            pre.setDouble(4, e.getSalario());
            pre.setInt(5, e.getEstado());
            res = pre.executeUpdate();
        } catch (SQLException er) {
            System.out.println("Error al insertar: " + er.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public ArrayList<Empleado> mostrarEmpleados() {
        ArrayList<Empleado> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM empleado";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                Empleado e = new Empleado();
                e.setId_empleado(rs.getInt(1));
                e.setDui(rs.getString(2));
                e.setNombre(rs.getString(3));
                e.setApellido(rs.getString(4));
                e.setSalario(rs.getDouble(5));
                e.setEstado(rs.getInt(6));
                lista.add(e);
            }
        } catch (SQLException er) {
            System.out.println("Error al mostrar: " + er.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public int modificarEmpleado(Empleado e) {
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE empleado SET  dui = ?, nombre = ?, apellido = ?, salario = ?, estado = ?  WHERE id_empleado=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, e.getDui());
            pre.setString(2, e.getNombre());
            pre.setString(3, e.getApellido());
            pre.setDouble(4, e.getSalario());
            pre.setInt(5, e.getEstado());
            pre.setInt(6, e.getId_empleado());
            res = pre.executeUpdate();
        } catch (SQLException er) {
            System.out.println("Error al modificar: " + er.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public int eliminarEmpleado(Empleado e) {
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM empleado WHERE id_empleado = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, e.getId_empleado());
            res = pre.executeUpdate();
        } catch (SQLException er) {
            System.out.println("Error al eliminar: " + er.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

}
