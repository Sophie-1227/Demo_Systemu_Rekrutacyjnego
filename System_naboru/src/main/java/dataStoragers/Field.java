package dataStoragers;

public class Field {
    int id;
    String nazwa;
    String wydzial;

    public Field(int id, String nazwa, String wydzial){
        this.id = id;
        this.nazwa = nazwa;
        this.wydzial = wydzial;
    }

    @Override
    public String toString(){
        return nazwa+ " - "+wydzial;
    }

    public int getId() {
        return id;
    }

    public String getNazwa() {
        return nazwa;
    }

    public String getWydzial() {
        return wydzial;
    }
}
