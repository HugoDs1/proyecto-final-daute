package com.modelo;

import java.io.InputStream;

public class Usuario {

    private int idUsuario;
    private String username;
    private String password;
    private int nivel;

    public Usuario() {
    }

    public Usuario(int idUsuario, String username, String password, int nivel) {
        this.idUsuario = idUsuario;
        this.username = username;
        this.password = password;
        this.nivel = nivel;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }
}
