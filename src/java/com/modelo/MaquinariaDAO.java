/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author bless
 */
public class MaquinariaDAO extends Conexion{
    public int insertarMaquinaria(Maquinaria c){
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO maquinaria(id_maquinaria, nombre, Stock) VALUES (?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, c.getNombre());
            pre.setInt(2, c.getStock());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        
        return res;
    }
    
    public ArrayList<Maquinaria> mostrarMaquinaria(){
        ArrayList<Maquinaria> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM maquinaria";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                Maquinaria c = new Maquinaria();
                c.setIdMaquinaria(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setStock(rs.getInt(3));
                
                lista.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public int modificarMaquinaria(Maquinaria c){
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE maquinaria SET nombre=?, stock=?, WHERE id_maquinaria=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, c.getNombre());
            pre.setInt(2, c.getStock());
            pre.setInt(3, c.getIdMaquinaria());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al Modificar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
    
    public int eliminarMaquinaria(Maquinaria c){
        int res = 0;
        try {
            this.conectar();
            String sql = " DELETE FROM maquinaria WHERE id_maquinaria=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, c.getIdMaquinaria());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al Eliminar "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
}
