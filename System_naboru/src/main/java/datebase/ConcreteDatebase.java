package datebase;

import java.sql.*;

public class ConcreteDatebase implements DatebaseInterface {



    final String dbUrl = "jdbc:mysql://localhost:3306/lista_3_db";
    Connection dbConnection;
    ResultSet currentResult;
    boolean autoscroll = true;


    @Override
    public PreparedStatement prepareQuery(String query) {
        PreparedStatement statement = null;
        try {
            statement = dbConnection.prepareStatement(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return statement;
    }

    @Override
    public boolean executeQuery(PreparedStatement query) {
        try {
            currentResult = query.executeQuery();
            query.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public String[][] receiveAnswer(int colNo) {
        String[][] table = new String[colNo][];
        boolean temp = autoscroll;
        autoscroll = true;
        for(int i=1; i<=colNo; i++){
            table[i] = receiveRow(i);
        }
        autoscroll = temp;
        return table;
    }

    @Override
    public String[] receiveCol(String colName) {
        try {
            return receiveCol(currentResult.findColumn(colName));
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public String[] receiveRow(int colNo){
        StringBuilder rowStr = new StringBuilder();
        for(int i=1; i<=colNo; i++){
            try {
                rowStr.append(currentResult.getString(i));
                rowStr.append(";;");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(autoscroll){
            try {
                if( !currentResult.next()){
                    currentResult.close();
                    currentResult = null;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rowStr.toString().split(";;");
    }

    @Override
    public String[] receiveCol(int colInd) {
        if(currentResult == null) return null;
        StringBuilder colStr = new StringBuilder();
        try {
            colStr.append(currentResult.getString(colInd));
            colStr.append(";;");
            while(currentResult.next()){
                colStr.append(currentResult.getString(colInd));
                colStr.append( ";;");
                currentResult.next();
            }
            currentResult.close();
            currentResult = null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return colStr.toString().split(";;");
    }

    public void scroll(){
        try {
            if(!currentResult.next()){
                currentResult.close();
                currentResult = null;
            }
        } catch (SQLException e) {
            System.out.println("End of answer or another problem");
        }
    }

    public void setAutoscroll(boolean on){
        autoscroll = on;
    }


    public void startConnection(String user, String pass) throws SQLException {
        closeConnection();
        dbConnection = DriverManager.getConnection(dbUrl, user, pass);
    }
    public void startConnection(String user) throws SQLException {
        closeConnection();
        User u = switch (user) {
            case "root" -> User.root;
            case "worker" -> User.worker;
            case "candidate" -> User.candidate;
            default -> null;
        };
        dbConnection = DriverManager.getConnection(dbUrl, u.getName(), u.getPass());
    }

    public void closeConnection() throws SQLException {

        if(dbConnection != null) dbConnection.close();
    }

    private static class User{
        final static User root = new User("root", "");
        final static User candidate = new User("Candidate", "PinkiePieIsTheBest");
        final static User worker = new User("Worker", "TylkoJednoWGlowieMam");

        String name;
        String pass;

        User(String name, String pass){
            this.name = name;
            this.pass = pass;
        }

        public String getName() {
            return name;
        }

        public String getPass() {
            return pass;
        }
    }
}
