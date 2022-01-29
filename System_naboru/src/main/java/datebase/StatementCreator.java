package datebase;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StatementCreator {
    DatebaseInterface datebase;

    public enum UserType{
        CANDIDATE,
        WORKER
    }

    public StatementCreator(DatebaseInterface datebase){
        this.datebase = datebase;
    }

    public boolean userCheck(String userName, String password, UserType type){
        String typeStr = "";
        if(type == UserType.CANDIDATE ) typeStr = "logkandydaci";
        else if (type == UserType.WORKER) typeStr = "pracownicylogi";
        //UWAGA: póki co sprawdza tylko i wyłącznie login, bo nie wiem do końca jak z tymi hasłami zrobić
        String query = "SELECT * FROM "+typeStr+" WHERE Login =?;";

        PreparedStatement statement = datebase.prepareQuery(query);
        String[] answer;
        try {
            statement.setString(1, userName);
            datebase.executeQuery(statement);
            answer = datebase.receiveRow(4);
        } catch (SQLException e) {
            return false;
        }

        return (answer == null);
    }



    //public void search(String table, )
}
