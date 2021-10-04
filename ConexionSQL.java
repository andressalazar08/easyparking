package persistencia;

import java.sql.*;

public class ConexionSQL {

    public Connection con = null;

    public static void main(String[] args) {
        var url = "jdbc:mysql://localhost:3306/easyparking?useSSL=false&useTimezone=true&serverTimezone=UTC&allowPublicKeyRetrieval=true";

        try {
            Connection conexion = DriverManager.getConnection(url, "root", "******");//cambiar los datos de usuario y contrasena
            System.out.println("CONEXION EXITOSA");
            Statement instruccion = conexion.createStatement();
            String sql = "SELECT idcajero, documentoCajero, nombre, apellido, nickname, password FROM cajero";
            ResultSet resultado = instruccion.executeQuery(sql);

            while (resultado.next()) {
                System.out.print("\n id Cajero: " + resultado.getInt("idcajero"));
                System.out.print(" documento cajero: " + resultado.getInt("documentoCajero"));
                System.out.print(" nombre: " + resultado.getString("nombre"));
                System.out.print(" apellido: " + resultado.getString("apellido"));
                System.out.print(" nickname: " + resultado.getString("nickname"));
            }
            
            resultado.close();
            instruccion.close();
            conexion.close();

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }

    }
}


