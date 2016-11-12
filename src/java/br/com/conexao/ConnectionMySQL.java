package br.com.conexao;

import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author jonat_000
 */
public class ConnectionMySQL {

    public static Connection connect;
    public static Statement statement;
    public static ResultSet resultSet;
    public static ResultSetMetaData metaData;

    public static ConnectionMySQL connection = new ConnectionMySQL();

    public ConnectionMySQL() {
        connectBank();
    }
    
    public static Connection connectBank() {
         if (connect != null) {
            return connect;
        } else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connect = DriverManager.getConnection("jdbc:mysql://localhost/username","root","masterkey");
                System.out.println("Connected!");
                return connect;
            } catch (ClassNotFoundException ex) {
                System.out.println("Drive not found");
                ex.printStackTrace();
                return null;
            } catch (SQLException ex) {
                System.out.println("Error connecting to the data source");
                ex.printStackTrace();
                return null;
            }
        }
    }
    
    

    public void runSQL(String comSQL) {
        try {
            statement = connect.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultSet = statement.executeQuery(comSQL);

        } catch (SQLException sqlEx) {
            JOptionPane.showMessageDialog(null, "error to find the record" + sqlEx);
            System.out.println(comSQL);
        }
        try {
            metaData = resultSet.getMetaData();
        } catch (SQLException sqlEx) {
            sqlEx.printStackTrace();

        }
    }

    public static void includeSQL(String comSQL) {
        try {
            statement = connect.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultSet = statement.executeQuery(comSQL);

        } catch (SQLException sqlEx) {
            if (sqlEx.getErrorCode() == 00001) {
                JOptionPane.showMessageDialog(null, "this record is already included");
            } else {
                JOptionPane.showMessageDialog(null, "error include " + sqlEx);
            }
            System.out.println(comSQL);
        }
    }

    public void deleteSQL(String comSQL) {
        try {
            statement = connect.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultSet = statement.executeQuery(comSQL);
        } catch (SQLException sqlEx) {
            JOptionPane.showMessageDialog(null, "it was not possible deleteing" + sqlEx);
            System.out.println(comSQL);
        }
    }

    public void updateSQL(String comSQL) {
        try {
            statement = connect.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultSet = statement.executeQuery(comSQL);
        } catch (Exception sqlEx) {
            JOptionPane.showMessageDialog(null, "It was not possible to perform the update" + sqlEx);
            System.out.println(comSQL);
        }
    }

    public void quitBank() {
        try {
            connect.close();            
        } catch (Exception sqlEx) {
            JOptionPane.showMessageDialog(null, "bank can not be closed" + sqlEx);
        }
    }

    public String autoIncrement(String field, String table) {
        try {
            statement = connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultSet = statement.executeQuery("SELECT COALESCE (MAX (" + field + "), 0) + 1 AS LAST FROM " + table);
            resultSet.first();
            return resultSet.getString("LAST");
        } catch (SQLException exSQL) {
            System.out.println("could not execute the following command" + exSQL);
            return null;
        }
    }
}
