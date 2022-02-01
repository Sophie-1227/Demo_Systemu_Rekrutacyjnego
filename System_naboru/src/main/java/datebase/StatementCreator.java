package datebase;

import dataStoragers.Field;
import windows.PreferencjeKandydata;

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
            datebase.scroll();
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

    public ArrayList<Field> getFieldsInfo(){
        ArrayList<Field> fieldsArray = new ArrayList<>();
        String query = "select IdKierunku, NazwaKierunku, KodWydzialu from kierunki;";
        PreparedStatement statement = datebase.prepareQuery(query);
        if(datebase.executeQuery(statement, true)){
            String[] tempTab;
            datebase.scroll();
            datebase.setAutoscroll(true);
            while( !datebase.isResultNull() && (tempTab = datebase.receiveRow(3)) != null){
                fieldsArray.add(new Field(Integer.parseInt(tempTab[0]),tempTab[1],tempTab[2]));
            }
            datebase.setAutoscroll(false);
            return fieldsArray;
        } else{
            return null;
        }
    }

    public boolean updatePreferences(int id, int preferenceNumber, int preference){
        String pref = "Preferencja"+preferenceNumber;
        String query = "update preferencjekandydata set "+pref+" = ? where IdKandydata = ?;";
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

    public String[] getPrefferedString(int idKandydata){
        ArrayList<Integer> prefferedInt = getPrefferedInfo(idKandydata);
        String[] prefferedStr = new String[prefferedInt.size()];
        String query = "select * from kierunki where IdKierunku = ?;";
        int i = 0;
        try{
            for(int prefId: prefferedInt){
                PreparedStatement statement = datebase.prepareQuery(query);
                statement.setInt(1, prefId);
                if(datebase.executeQuery(statement, true)){
                    datebase.scroll();
                    String[] row = datebase.receiveRow(6);
                    prefferedStr[i] = row[4] + " " + row[5];
                    i++;
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return prefferedStr;
    }

    public ArrayList<Integer> getPrefferedInfo(int idKandydata) {
        ArrayList<Integer> fieldsArray = new ArrayList<>();
        String query = "select * from preferencjekandydata where IdKandydata = ?;";
        PreparedStatement statement = datebase.prepareQuery(query);
        try {

            statement.setInt(1, idKandydata);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(datebase.executeQuery(statement, true)){
            String[] tempTab;
            datebase.scroll();
            datebase.setAutoscroll(true);
            if( !datebase.isResultNull() && (tempTab = datebase.receiveRow(7)) != null){
                for(int i = 1; i<= PreferencjeKandydata.max_fields_count; i++){
                    if( !tempTab[i].equals("null")) {
                        //System.out.println("Dodano "+tempTab[i]);
                        fieldsArray.add(Integer.parseInt(tempTab[i]));
                    }
                    else break;
                }
            }
            datebase.setAutoscroll(false);
            return fieldsArray;
        } else{
            return null;
        }
    }

    public ArrayList<Float> getPoints(int idKandydata) {
        ArrayList<Float> pointsArray = new ArrayList<>();
        String query = "select * from wskaznik where IdKandydata = ?;";
        PreparedStatement statement = datebase.prepareQuery(query);
        try {
            statement.setInt(1, idKandydata);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(datebase.executeQuery(statement, true)){
            String[] tempTab;
            datebase.scroll();
            datebase.setAutoscroll(true);
            if( !datebase.isResultNull() && (tempTab = datebase.receiveRow(7)) != null){
                for(int i = 1; i<= PreferencjeKandydata.max_fields_count; i++){
                    if( !tempTab[i].equals("null")) {
                        //System.out.println("Dodano "+tempTab[i]);
                        pointsArray.add(Float.parseFloat(tempTab[i]));
                    }
                    else break;
                }
            }
            datebase.setAutoscroll(false);
            return pointsArray;
        } else{
            return null;
        }
    }

    public String[] getMaturaResults(int idKandydata, int maturaCount){
        String query = "select * from wynikimatur where IdKandydata = ?;";
        PreparedStatement statement = datebase.prepareQuery(query);
        try {
            statement.setInt(1, idKandydata);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(datebase.executeQuery(statement, true)){
            datebase.scroll();
            return datebase.receiveRow(maturaCount+1);
        } else return null;
    }

    public boolean updateMaturaResults(int[] results, int idKandydata ){
        String query = "update wynikimatur set " +
                "PolskiPodstawa = ?, "+
                "MatematykaPodstawa = ?, "+
                "MatematykaRozszerzenie = ?, "+
                "JezykObcyNowozytnyPodstawa = ?, "+
                "JezykObcyNowozytnyRozszerzenie = ?, "+
                "FizykaRozszerzenie = ?, "+
                "ChemiaRozszezrenie = ?, "+
                "BiologiaRozszezrenie = ?, "+
                "InformatykaRozszerzenie = ?, "+
                "GeografiaRozszerzenie = ? "+
                "where IdKandydata = ?;";
        PreparedStatement statement = datebase.prepareQuery(query);
        try{
            for(int i = 0; i<10; i++){
                statement.setInt(i+1, results[i]);
            }
            statement.setInt(11, idKandydata);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return datebase.executeQuery(statement, false);
    }

    public String[] getMatchingCandidates(String registrationNumber, String fname, String sname , String PESEL){
        String query = "select * from kandydaci where Imie like ? and Nazwisko like ? and PESEL like ? and NrRejestracyjny like ?;";
        PreparedStatement statement = datebase.prepareQuery(query);
        try {
            statement.setString(1,fname += "%");
            statement.setString(2, sname += "%");
            statement.setString(3, PESEL += "%");
            statement.setString(4, registrationNumber + "%");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if(datebase.executeQuery(statement, true)){
            ArrayList<String[]> DBanswer = datebase.receiveAnswer(7);
            //System.out.println(DBanswer.size());
            String[] matchingList = new String[DBanswer.size()];
            int i = 0;
            for (String[] tab: DBanswer) {
                matchingList[i] = tab[0] + " "+tab[1]+" "+tab[2]+" - "+tab[3];
                //System.out.println(matchingList[i]);
                i++;
            }
            return matchingList;
        } else {
            System.out.println("Coś nie pykło");
            return null;
        }
    }

    public enum UserType{
        CANDIDATE,
        WORKER
    }

    //public void search(String table, )
}
