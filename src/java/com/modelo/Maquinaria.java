package com.modelo;

public class Maquinaria {

    private int idMaquinaria;
    private String nombre;
    private int Stock;
    private String descripcion;

    public Maquinaria() {
    }

    public Maquinaria(int idMaquinaria, String nombre, int Stock, String descripcion) {
        this.idMaquinaria = idMaquinaria;
        this.nombre = nombre;
        this.Stock = Stock;
        this.descripcion = descripcion;
    }

    public int getIdMaquinaria() {
        return idMaquinaria;
    }

    public void setIdMaquinaria(int idMaquinaria) {
        this.idMaquinaria = idMaquinaria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getStock() {
        return Stock;
    }

    public void setStock(int Stock) {
        this.Stock = Stock;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
