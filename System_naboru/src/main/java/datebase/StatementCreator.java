package datebase;

import org.w3c.dom.CDATASection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class StatementCreator {
    DatebaseInterface datebase;


    public StatementCreator(DatebaseInterface datebase){
        this.datebase = datebase;
    }

    public boolean userCheck(String userName, String password, UserType type){
        String typeStr = "";
        if(type == UserType.CANDIDATE ) typeStr = "logkandydaci";
        else if (type == UserType.WORKER) typeStr = "pracownicylogi";
        //UWAGA: póki co sprawdza tylko i wyłącznie login, bo nie wiem do końca jak z tymi hasłami zrobić
        String query = "SELECT * FROM "+typeStr+" WHERE Login = ? and AES_DECRYPT(UNCOMPRESS(securePass), 27) = ?;";

        PreparedStatement statement = datebase.prepareQuery(query);
        String[] answer;
        try {
            statement.setString(1, userName);
            statement.setString(2, password);
            if(datebase.executeQuery(statement, true) && !datebase.isResultNull()){
                datebase.scroll();
                if(datebase.isResultNull()) return false;
                answer = datebase.receiveRow(4);
                if(answer != null) return true;
            }
        } catch (SQLException e) {
            return false;
        }
        return false;
    }

    public boolean userRegister(String userLogin, String firstName, String lastname, String password, String PESEL, int czyOlimpiada){
        /*
        PreparedStatement statement = datebase.prepareQuery("set foreign_key_checks = 0");
        datebase.executeQuery(statement);

         */

        String query;
        query = "insert into kandydaci (Imie, Nazwisko, PESEL, Status, CzyOlimpijczyk) values (?, ?, ?, 'Oczekuje na oplate', ?);";
        PreparedStatement statement = datebase.prepareQuery(query);
        try{
            statement.setString(1, firstName);
            statement.setString(2, lastname);
            statement.setString(3, PESEL);
            statement.setInt(4,czyOlimpiada);
            datebase.executeQuery(statement, false);
            /*
            statement = datebase.prepareQuery("set foreign_key_checks = 1");
            datebase.executeQuery(statement);

             */
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        query = "update logkandydaci set Login=?, Haslo=? where IdKandydata = (select NrRejestracyjny from kandydaci k where k.PESEL = ?) ;";
        statement = datebase.prepareQuery(query);
        try{
            statement.setString(1, userLogin);
            statement.setString(2, password);
            statement.setString(3, PESEL);
            datebase.executeQuery(statement, false);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    public int getUserId(String name, String sname, String pesel) {

        String query = "select NrRejestracyjny from kandydaci where Imie=? and Nazwisko = ? and PESEL = ?;";
        PreparedStatement statement = datebase.prepareQuery(query);
        try {
            statement.setString(1, name);
            statement.setString(2, sname);
            statement.setString(3, pesel);
            datebase.executeQuery(statement, true);
            return Integer.parseInt(datebase.receiveCol(1)[0]);
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public int getUserId(String login){
        String query = "select IdKandydata from logkandydaci where Login = ?;";
        PreparedStatement statement = datebase.prepareQuery(query);
        try {
            statement.setString(1, login);
            datebase.executeQuery(statement, true);
            datebase.scroll();
            return Integer.parseInt(datebase.receiveCol(1)[0]);
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public String[] getUserInfo(int Id){
        String query = "select * from kandydaci where NrRejestracyjny = ?;";
        PreparedStatement statement = datebase.prepareQuery(query);
        try {
            statement.setInt(1, Id);
            datebase.executeQuery(statement, true);
            datebase.scroll();
            return datebase.receiveRow(7);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<String[]> getFieldsInfo(){
        String query = "select NazwaKierunku, KodWydzialu from kierunki";
        PreparedStatement statement = datebase.prepareQuery(query);
        if(datebase.executeQuery(statement, true)){
            return datebase.receiveAnswer(2);
        } else{
            return null;
        }

    }

    public boolean updatePreferences(int id, int preferenceNumber, int preference){
        String pref = "Preferencja"+String.valueOf(preferenceNumber);
        String query = "update preferencje kandydata set "+pref+" = ? where IdKandydata = ?";
        PreparedStatement statement = datebase.prepareQuery(query);
        try {
            statement.setInt(1, preference);
            statement.setInt(2, id);
            return datebase.executeQuery(statement, false);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public enum UserType{
        CANDIDATE,
        WORKER
    }

    //public void search(String table, )
}
