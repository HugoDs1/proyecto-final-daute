package com.modelo;

public class Usuario {

    private Integer idUsuario;
    private String username;
    private String password;
    private String fotografia;

    public Usuario() {
    }

    public Usuario(Integer idUsuario, String username, String password, String fotografia) {
        this.idUsuario = idUsuario;
        this.username = username;
        this.password = password;
        this.fotografia = fotografia;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
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

    public String getFotografia() {
        return fotografia;
    }

    public void setFotografia(String fotografia) {
        this.fotografia = fotografia;
    }
}
