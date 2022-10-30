package com.modelo;

public class Empleado {

    private int id_empleado;
    private String dui;
    private String nombre;
    private String apellido;
    private double salario;
    private int estado;

    public Empleado() {
    }

    public Empleado(int id_empleado, String dui, String nombre, String apellido, double salario, int estado) {
        this.id_empleado = id_empleado;
        this.dui = dui;
        this.nombre = nombre;
        this.apellido = apellido;
        this.salario = salario;
        this.estado = estado;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getDui() {
        return dui;
    }

    public void setDui(String dui) {
        this.dui = dui;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

}
