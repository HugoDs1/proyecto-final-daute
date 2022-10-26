/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

/**
 *
 * @author bless
 */
public class Maquinaria {
    private int idMaquinaria;
    private String nombre;
    private int Stock;

    public Maquinaria() {
    }

    public Maquinaria(int idMaquinaria, String nombre, int Stock) {
        this.idMaquinaria = idMaquinaria;
        this.nombre = nombre;
        this.Stock = Stock;
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
}
