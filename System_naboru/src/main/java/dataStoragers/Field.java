package dataStoragers;

public class Field {
    int id;
    String nazwa;
    String kod;
    String wydzialKod;



    public Field(int id, String nazwa, String wydzial, String kod){
        this.id = id;
        this.nazwa = nazwa;
        this.wydzialKod = wydzial;
        this.kod = kod;
    }

    @Override
    public String toString(){
        return nazwa+ " - "+wydzialKod;
    }

    public String getKod() {
        return kod;
    }

    public int getId() {
        return id;
    }

    public String getNazwa() {
        return nazwa;
    }

    public String getWydzialKod() {
        return wydzialKod;
    }
}
