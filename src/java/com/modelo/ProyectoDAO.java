package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.modelo.Proyecto;
import java.util.ArrayList;

/**
 *
 * @author bless
 */
public class ProyectoDAO extends Conexion {

    public int insertarProyecto(Proyecto p) {
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO proyecto(id_proyecto,municipio_id,usuario_id,nombre, valor,estado) VALUES (?,?,?,?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, p.getIdProyecto());
            pre.setInt(2, p.getMuninicipioId());
            pre.setInt(3, p.getUsuarioId());
            pre.setString(4, p.getNombre());
            pre.setDouble(5, p.getValor());
            pre.setInt(6, p.getEstado());
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar " + e.getMessage());
        } finally {
            this.desconectar();
        }

        return res;
    }

    public ArrayList<Proyecto> mostrarProyecto() {
        ArrayList<Proyecto> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM proyecto p INNER JOIN usuario u on p.usuario_id = u.id_usuario INNER JOIN municipio m on p.municipio_id = m.id_municipio INNER JOIN departamento d ON m.departamento_id = d.id_departamento";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                Proyecto p = new Proyecto();
                p.setIdProyecto(rs.getInt(1));
                p.setMuninicipioId(rs.getInt(2));
                p.setUsuarioId(rs.getInt(3));
                p.setNombre(rs.getString(4));
                p.setValor(rs.getInt(5));
                p.setEstado(rs.getInt(6));
                p.setUsuario(rs.getString(8));
                p.setMunicipio(rs.getString(12));
                p.setDepartamentoId(rs.getInt(13));
                p.setDepartamento(rs.getString(15));
                lista.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public int modificarProyecto(Proyecto p) {
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE proyecto SET municipio_id = ?, usuario_id = ?, nombre = ?, valor = ?, estado = ? WHERE id_proyecto = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, p.getMuninicipioId());
            pre.setInt(2, p.getUsuarioId());
            pre.setString(3, p.getNombre());
            pre.setDouble(4, p.getValor());
            pre.setInt(5, p.getEstado());
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al Modificar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public int eliminarProyecto(Proyecto p) {
        int res = 0;
        try {
            this.conectar();
            String sql = " DELETE FROM proyecto WHERE id_proyecto = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, p.getIdProyecto());
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al Eliminar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public ArrayList<Municipio> mostarMunicipios(int codigo) {
        ArrayList<Municipio> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM municipios WHERE departamento_id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, codigo);
            ResultSet rs;

            rs = pre.executeQuery();
            while (rs.next()) {
                Municipio m = new Municipio();
                m.setIdMunicipio(rs.getInt(1));
                m.setNombreMunicipio(rs.getString(2));
                lista.add(m);
            }

        } catch (SQLException e) {
            System.out.println("Error al mostrar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
}
