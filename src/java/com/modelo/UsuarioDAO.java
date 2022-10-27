package com.modelo;

import com.conexion.Conexion;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.modelo.Usuario;

public class UsuarioDAO extends Conexion {

    public int insertar(Usuario u) throws FileNotFoundException {
        int res = 0;
        File foto = new File(u.getFotografia());
        try {
            this.conectar();
            FileInputStream fotoConverted = new FileInputStream(foto);
            String sql = "INSERT INTO usuario(username, password, fotografia) VALUES(?, ?, ?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, u.getUsername());
            pre.setString(2, u.getPassword());
            pre.setBlob(3, fotoConverted, foto.length());
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
                u.setFotografia(rs.getString(4));
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
            String sql = "UPDATE usuario SET username = ?, password = ?, fotografia = ? WHERE id_usuario = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, u.getUsername());
            pre.setString(2, u.getPassword());
            pre.setString(3, u.getFotografia());
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
            String sql = "SELECT username FROM usuario WHERE username = ? AND password = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, usuario);
            pre.setString(2, password);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setUsername(rs.getString(1));
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
