package datebase;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public interface DatebaseInterface {
    PreparedStatement prepareQuery(String query);
    boolean executeQuery(PreparedStatement query, boolean shouldReturnResult);
    ArrayList<String[]> receiveAnswer(int colNo);
    String[] receiveCol(String colName);
    String[] receiveCol(int colInd);
    String[] receiveRow(int colNo);
    void closeQuery(PreparedStatement query);
    void startConnection(String user) throws SQLException;
    void startConnection(String user, String pass) throws SQLException;
    void closeConnection() throws SQLException;
    void scroll();
    void setAutoscroll(boolean on);
    boolean isResultNull();


}
