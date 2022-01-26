package datebase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConcreteDatebase implements DatebaseInterface {

    final String dbUrl = "jdbc:mysql://localhost:3306/lista_3_db";
    final String user = "root";
    final String pass = "";
    Connection dbConnection;
        //connecting to a database
    try{
       Connection dbConnection = DriverManager.getConnection(dbUrl, user, pass);

    }
}
