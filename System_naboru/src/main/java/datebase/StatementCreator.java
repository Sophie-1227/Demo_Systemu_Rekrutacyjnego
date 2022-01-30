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
        String query = "SELECT * FROM pracownicylogi WHERE Login = ? and AES_DECRYPT(UNCOMPRESS(PracownicyLogi.securePass), 27) = ?;";

        PreparedStatement statement = datebase.prepareQuery(query);
        String[] answer;
        try {
            statement.setString(1, userName);
            statement.setString(2, password);
            if(datebase.executeQuery(statement)){
                datebase.scroll();
                answer = datebase.receiveRow(4);
                if(answer != null) return true;
            }
        } catch (SQLException e) {
            return false;
        }
        return false;
    }

    public boolean userRegister(String userLogin, String firstName, String lastname, String password, String PESEL, int czyOlimpiada){

        PreparedStatement statement = datebase.prepareQuery("set foreign_key_checks = 0");
        datebase.executeQuery(statement);

        String query;
        query = "insert into logkandydaci values ( ,?,?,0x30);";
        statement = datebase.prepareQuery(query);
        try{
            statement.setString(1, userLogin);
            statement.setString(2, password);
            datebase.executeQuery(statement);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        query = "insert into kandydaci values (, ?, ?, ?, 'Oczekuje na oplate', 0 , ?);";
        statement = datebase.prepareQuery(query);
        try{
            statement.setString(1, firstName);
            statement.setString(2, lastname);
            statement.setString(3, PESEL);
            statement.setInt(4,czyOlimpiada);
            datebase.executeQuery(statement);

            statement = datebase.prepareQuery("set foreign_key_checks = 1");
            datebase.executeQuery(statement);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }


        return true;
    }



    //public void search(String table, )
}
