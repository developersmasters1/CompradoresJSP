package modelo;

import java.time.LocalDate;

public class Comprador {
    private int id;
    private String nombres;
    private String apellidos;
    private String tipoDocumento;
    private String numeroDocumento;
    private LocalDate fechaNacimiento;

    public void setId(int id) {
        this.id = id;
    }
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }
    public void setNumeroDocumento(String numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }
    public void setFechaNacimiento(LocalDate fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }
    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    private String correo;
    private String contrasena;
    private String departamento;
    private String ciudad;
    private String direccion;

    public Comprador(int id, String nombres, String apellidos, String tipoDocumento, String numeroDocumento,
                     LocalDate fechaNacimiento, String correo, String contrasena,
                     String departamento, String ciudad, String direccion) {
        this.id = id;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.tipoDocumento = tipoDocumento;
        this.numeroDocumento = numeroDocumento;
        this.fechaNacimiento = fechaNacimiento;
        this.correo = correo;
        this.contrasena = contrasena;
        this.departamento = departamento;
        this.ciudad = ciudad;
        this.direccion = direccion;
    }

    public int getId() { return id; }
    public String getNombres() { return nombres; }
    public String getApellidos() { return apellidos; }
    public String getTipoDocumento() { return tipoDocumento; }
    public String getNumeroDocumento() { return numeroDocumento; }
    public LocalDate getFechaNacimiento() { return fechaNacimiento; }
    public String getCorreo() { return correo; }
    public String getContrasena() { return contrasena; }
    public String getDepartamento() { return departamento; }
    public String getCiudad() { return ciudad; }
    public String getDireccion() { return direccion; }
}

