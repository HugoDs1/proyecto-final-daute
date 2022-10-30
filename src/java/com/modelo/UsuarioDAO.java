package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.modelo.Usuario;

public class UsuarioDAO extends Conexion {

    public int insertar(Usuario u) {
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO usuario(username, password, nivel) VALUES(?, ?, ?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, u.getUsername());
            pre.setString(2, u.getPassword());
            pre.setInt(3, u.getNivel());
            res = pre.executeUpdate();
        } catch (SQLException error) {
            System.out.println("Error al insertar: " + error.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public ArrayList<Usuario> mostrar() {
        ArrayList<Usuario> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM usuario";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setIdUsuario(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setNivel(rs.getInt(4));
                lista.add(u);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public int modificar(Usuario u) {
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE usuario SET username = ?, password = ?, nivel = ? WHERE id_usuario = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, u.getUsername());
            pre.setString(2, u.getPassword());
            pre.setInt(3, u.getNivel());
            pre.setInt(4, u.getIdUsuario());
            res = pre.executeUpdate();
        } catch (SQLException error) {
            System.out.println("Error al modificar: " + error.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public int eliminar(Usuario u) {
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM usuario WHERE id_usuario = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, u.getIdUsuario());
            res = pre.executeUpdate();
        } catch (SQLException error) {
            System.out.println("Error al eliminar: " + error.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public ArrayList<Usuario> iniciarSesion(String usuario, String password) {
        ArrayList<Usuario> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT username, nivel FROM usuario WHERE username = ? AND password = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, usuario);
            pre.setString(2, password);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setUsername(rs.getString(1));
                u.setNivel(rs.getInt(2));
                lista.add(u);
            }
        } catch (SQLException e) {
            System.out.println("Error al extraer sesion " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
}
