package com.modelo;

public class Proyecto {

    private int idProyecto;
    private int departamentoId;
    private String departamento;
    private int muninicipioId;
    private String municipio;
    private int usuarioId;
    private String usuario;
    private String nombre;
    private int estado;
    private double valor;

    public Proyecto() {
    }

    public Proyecto(int idProyecto, int muninicipioId, int usuarioId, String nombre, int estado, double valor) {
        this.idProyecto = idProyecto;
        this.muninicipioId = muninicipioId;
        this.usuarioId = usuarioId;
        this.nombre = nombre;
        this.estado = estado;
        this.valor = valor;
    }

    public int getIdProyecto() {
        return idProyecto;
    }

    public void setIdProyecto(int idProyecto) {
        this.idProyecto = idProyecto;
    }

    public int getDepartamentoId() {
        return departamentoId;
    }

    public void setDepartamentoId(int departamentoId) {
        this.departamentoId = departamentoId;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public int getMuninicipioId() {
        return muninicipioId;
    }

    public void setMuninicipioId(int muninicipioId) {
        this.muninicipioId = muninicipioId;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getNombreEstado(int idEstado) {
        String estadoFinal = "";
        switch (idEstado) {
            case 1:
                estadoFinal = "Ingresado";
                break;
            case 2:
                estadoFinal = "Confirmado";
                break;
            case 3:
                estadoFinal = "Entregado";
                break;
            case 4:
                estadoFinal = "Cancelado";
                break;
        }
        return estadoFinal;
    }

}
