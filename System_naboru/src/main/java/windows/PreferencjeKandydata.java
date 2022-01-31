package windows;

import datebase.DatebaseInterface;
import datebase.StatementCreator;

import javax.swing.*;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.*;

class SortedListModel extends AbstractListModel {
    SortedSet<Object> model;

    public SortedListModel() {
        model = new TreeSet<Object>();
    }

    public int getSize() {
        return model.size();
    }

    public Object getElementAt(int index) {
        return model.toArray()[index];
    }

    public void add(Object element) {
        if (model.add(element)) {
            fireContentsChanged(this, 0, getSize());
        }
    }

    public void addAll(Object elements[]) {
        Collection<Object> c = Arrays.asList(elements);
        model.addAll(c);
        fireContentsChanged(this, 0, getSize());
    }

    public void clear() {
        model.clear();
        fireContentsChanged(this, 0, getSize());
    }

    public boolean contains(Object element) {
        return model.contains(element);
    }

    public Object firstElement() {
        return model.first();
    }

    public Iterator iterator() {
        return model.iterator();
    }

    public Object lastElement() {
        return model.last();
    }

    public boolean removeElement(Object element) {
        boolean removed = model.remove(element);
        if (removed) {
            fireContentsChanged(this, 0, getSize());
        }
        return removed;
    }
}


public class PreferencjeKandydata implements ChangeListener {

    final int smallPaddingX = 0;
    final int smallPaddingY = 15;
    final int idKandydata;

    DatebaseInterface datebase;
    StatementCreator creator;

    private Frame preferencjeKandydatFrame;
    private Label headerLabelPreferencjekandydata;
    private JTabbedPane preferencjeKandydataPane;
    private Panel Preferencje; //ewentualna zmiana na component w zaleznosci od reakcji javy
    private Panel Dane;
    private Panel Matura;
    JButton addButton;
    JButton removeButton;
    private JList listaKierunkow; //lista kierunków dostepnych, z ktorych mozemy wybierac
    private JList listaPreferencji; //lista preferencji konkretnego kandydata, czyli kierunki, ktore wybral
    private SortedListModel listaKierunkowModel;
    private SortedListModel listaPreferencjiModel;

    public PreferencjeKandydata(DatebaseInterface datebase, StatementCreator creator, int IdKandydata){
        this.idKandydata = IdKandydata;
        this.datebase = datebase;
        this.creator = creator;
        listaKierunkowModel = new SortedListModel();
        listaPreferencjiModel = new SortedListModel();
        listaKierunkow = new JList(listaKierunkowModel);
        listaPreferencji = new JList(listaPreferencjiModel);
        prepareGUI();
        setGridBagDaneLayout();
        //setGridBagMaturyLayout();
        setGridBagPreferencjeLayout();
        addSourceElements(new String[] {"Tu", "Beda", "Wypisane", "Kierunki"});
    }

    public void clearlistaKierunkowModel() {
        listaKierunkowModel.clear();
    }

    public void clearlistaPreferencjiModel() {
        listaPreferencjiModel.clear();
    }

    public void addSourceElements(ListModel newValue) {
        fillListModel(listaKierunkowModel, newValue);
    }

    public void setSourceElements(ListModel newValue) {
        clearlistaKierunkowModel();
        addSourceElements(newValue);
    }

    public void addDestinationElements(ListModel newValue) {
        fillListModel(listaPreferencjiModel, newValue);
    }

    private void fillListModel(SortedListModel model, ListModel newValues) {
        int size = newValues.getSize();
        for (int i = 0; i < size; i++) {
            model.add(newValues.getElementAt(i));
        }
    }

    public void addSourceElements(Object newValue[]) {
        fillListModel(listaKierunkowModel, newValue);
    }

    public void setSourceElements(Object newValue[]) {
        clearlistaKierunkowModel();
        addSourceElements(newValue);
    }

    public void addDestinationElements(Object newValue[]) {
        fillListModel(listaPreferencjiModel, newValue);
    }

    private void fillListModel(SortedListModel model, Object newValues[]) {
        model.addAll(newValues);
    }

    private void clearSourceSelected() {
        Object selected[] = listaKierunkow.getSelectedValues();
        for (int i = selected.length - 1; i >= 0; --i) {
            listaKierunkowModel.removeElement(selected[i]);
        }
        listaKierunkow.getSelectionModel().clearSelection();
    }

    private void clearDestinationSelected() {
        Object selected[] = listaPreferencji.getSelectedValues();
        for (int i = selected.length - 1; i >= 0; --i) {
            listaPreferencjiModel.removeElement(selected[i]);
        }
        listaPreferencji.getSelectionModel().clearSelection();
    }

    public void prepareGUI(){
        preferencjeKandydatFrame = new Frame("Wybór preferencji");
        preferencjeKandydatFrame.setSize(700, 500);
        //preferencjeKandydatFrame.setLayout(new GridLayout(3, 1));
        preferencjeKandydatFrame.setLayout(new BorderLayout());
        preferencjeKandydatFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });
        Font font = new Font("Modern Love", Font.BOLD&Font.ITALIC, 30);
        headerLabelPreferencjekandydata = new Label();
        headerLabelPreferencjekandydata.setAlignment((int) Label.TOP_ALIGNMENT);
        headerLabelPreferencjekandydata.setFont(font);
        headerLabelPreferencjekandydata.setSize(700,200);

        preferencjeKandydataPane = new JTabbedPane(SwingConstants.LEFT);
        preferencjeKandydataPane.addChangeListener(this);
        preferencjeKandydataPane.setSize(700,500);
        //preferencjeKandydataPane.setLayout(new FlowLayout());

        Dane = new Panel();
        Preferencje = new Panel();
        Matura = new Panel();

        preferencjeKandydataPane.addTab("Dane Osobowe", Dane);
        preferencjeKandydataPane.addTab("Preferencje", Preferencje);
        preferencjeKandydataPane.addTab("Wyniki Matur", Matura);

        preferencjeKandydatFrame.add(headerLabelPreferencjekandydata, BorderLayout.NORTH);
        preferencjeKandydatFrame.add(preferencjeKandydataPane, BorderLayout.CENTER);
        preferencjeKandydatFrame.setVisible(true);

    }

    public void setGridBagDaneLayout(){
        //Wyświetlanie danych z wykorzystaniem prepared statment
        String[] dane = creator.getUserInfo(idKandydata);

        headerLabelPreferencjekandydata.setText("Twoje dane osobowe");

        Panel panel = new Panel();
        panel.setSize(500, 300);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        //Imię
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;
        JLabel name = new JLabel("Imię:");
        name.setPreferredSize(new Dimension(100, 40));
        panel.add(name, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipadx = smallPaddingX;
        gbc.gridx = 1;
        gbc.gridy = 0;
        JLabel nameData = new JLabel(dane[1]);
        nameData.setPreferredSize(new Dimension(100, 40));
        panel.add(nameData, gbc);

        //Nazwisko
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 1;
        JLabel sname = new JLabel("Nazwisko:");
        panel.add(sname, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipadx = smallPaddingX;
        gbc.gridx = 1;
        gbc.gridy = 1;
        JLabel snameData = new JLabel(dane[2]);
        panel.add(snameData, gbc);

        //PESEL
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 2;
        JLabel pesel = new JLabel("PESEL:");
        panel.add(pesel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipadx = smallPaddingX;
        gbc.gridx = 1;
        gbc.gridy = 2;
        JLabel peselData = new JLabel(dane[3]);
        panel.add(peselData, gbc);

        //Status
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 3;
        JLabel status = new JLabel("Status:");
        panel.add(status, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipadx = smallPaddingX;
        gbc.gridx = 1;
        gbc.gridy = 3;
        JLabel statusData = new JLabel(dane[4]);
        panel.add(statusData, gbc);

        //CzyOlimpijczyk
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 4;
        JLabel olimp = new JLabel("Czy olimpijczyk:");
        panel.add(olimp, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipadx = smallPaddingX;
        gbc.gridx = 1;
        gbc.gridy = 4;
        JLabel olimpData = new JLabel();
        if(dane[6].equals("0")) olimpData.setText("Nie");
        else olimpData.setText("Tak");
        panel.add(olimpData, gbc);

        Dane.add(panel);
        preferencjeKandydatFrame.setVisible(true);

    }

    public void setGridBagPreferencjeLayout(){
        //Wybór preferencji kandydata
        headerLabelPreferencjekandydata.setText("Wybierz kierunki, którymi jesteś zainteresowany");

        Panel panel = new Panel();
        panel.setSize(500, 300);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;
        //Do dodania Jlist dual http://www.java2s.com/Tutorials/Java/Swing/JList/Create_a_dual_JList_component_in_Java.htm
        JPanel leftPanel = new JPanel(new BorderLayout());
        leftPanel.add(new JLabel("Dostepne kierunki: "), BorderLayout.NORTH);
        leftPanel.add(new JScrollPane(listaKierunkow), BorderLayout.CENTER);
        addButton = new JButton();
        addButton.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent actionEvent) {
                        Object selected[] = (Object[]) listaKierunkow.getSelectedValue();
                        addDestinationElements(selected);
                        clearSourceSelected();
                    }
                }
        );
        leftPanel.add(addButton, BorderLayout.SOUTH);
        panel.add(leftPanel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 0;
        JPanel rightPanel = new JPanel(new BorderLayout());
        rightPanel.add(new JLabel("Wybrane kierunki: "), BorderLayout.NORTH);
        rightPanel.add(new JScrollPane(listaPreferencji), BorderLayout.CENTER);
        removeButton = new JButton();
        removeButton.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent actionEvent) {
                        Object selected[] = listaPreferencji.getSelectedValues();
                        addSourceElements(selected);
                        clearDestinationSelected();
                    }
                }
        );
        rightPanel.add(removeButton, BorderLayout.SOUTH);
        panel.add(rightPanel, gbc);

        gbc.fill = GridBagConstraints.SOUTH;
        JButton confirm = new JButton("Zatwierdz");
        confirm.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent actionEvent) {
                        //Przeslij wprowadzone dane do bazy danych
                    }
                }
        );
        panel.add(confirm, gbc);

        Preferencje.add(panel);
        preferencjeKandydatFrame.setVisible(true);

    }

    public void setGridBagMaturyLayout(){
        //Uzupełnienie wyników matur
        headerLabelPreferencjekandydata.setText("Przejrzyj i/lub uzupełnij wyniki matur");

        Panel panel = new Panel();
        panel.setSize(500, 300);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        //Do dodania pola tekstowe + label do każdego przedmiotu
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;
        JLabel polski = new JLabel("J.Polski Podstawowy");
        panel.add(polski, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 0;
        JTextField polskiWynik = new JTextField();
        panel.add(polskiWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 1;
        JLabel matPodstawa = new JLabel("Matematyka Podstawowa");
        panel.add(matPodstawa, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 1;
        gbc.gridy = 1;
        JTextField matPodstWynik = new JTextField();
        panel.add(matPodstWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 2;
        JLabel matRozszerzenie = new JLabel("Matematyka Rozszerzenie");
        panel.add(matRozszerzenie, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 1;
        gbc.gridy = 2;
        JTextField matRozWynik = new JTextField();
        panel.add(matRozWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 3;
        JLabel jezykPodstawa = new JLabel("J.Obcy Podstawowy");
        panel.add(jezykPodstawa, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 1;
        gbc.gridy = 3;
        JTextField jezykPodstWynik = new JTextField();
        panel.add(jezykPodstWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 4;
        JLabel jezykRozszerzenie = new JLabel("J.Obcy Rozszerzenie");
        panel.add(jezykRozszerzenie, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 1;
        gbc.gridy = 4;
        JTextField jezykRozWynik = new JTextField();
        panel.add(jezykRozWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 5;
        JLabel fizyka = new JLabel("Fizyka");
        panel.add(fizyka, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 1;
        gbc.gridy = 5;
        JTextField fizykaWynik = new JTextField();
        panel.add(fizykaWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 6;
        JLabel chemia = new JLabel("Chemia");
        panel.add(chemia, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 1;
        gbc.gridy = 6;
        JTextField chemiaWynik = new JTextField();
        panel.add(chemiaWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 7;
        JLabel biologia = new JLabel("Biologia");
        panel.add(biologia, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 1;
        gbc.gridy = 7;
        JTextField biologiaWynik = new JTextField();
        panel.add(biologiaWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 8;
        JLabel inf = new JLabel("Informatyka");
        panel.add(inf, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 1;
        gbc.gridy = 8;
        JTextField infWynik = new JTextField();
        panel.add(infWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 9;
        JLabel geo = new JLabel("Geografia");
        panel.add(geo, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 1;
        gbc.gridy = 9;
        JTextField geoWynik = new JTextField();
        panel.add(geoWynik, gbc);

        gbc.fill = GridBagConstraints.SOUTH;
        gbc.ipady = smallPaddingY;
        JButton confirm = new JButton("Zatwierdz");
        confirm.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent actionEvent) {
                        //Przeslanie wpisanych wartosci do bazy danych
                    }
                }
        );
        panel.add(confirm, gbc);


        Matura.add(panel);
        preferencjeKandydatFrame.setVisible(true);

    }

    @Override
    public void stateChanged(ChangeEvent e) {
        int ind = preferencjeKandydataPane.getSelectedIndex();
        headerLabelPreferencjekandydata.setText(getMessageForInd(ind));
    }

    public String getMessageForInd(int index){
        return switch (index) {
            case 0 -> "Twoje dane osobowe";
            case 1 -> "Wybierz kierunki, którymi jesteś zainteresowany";
            case 2 -> "Przejrzyj i/lub uzupełnij wyniki matur";
            default -> "Error 404";
        };
    }
}
