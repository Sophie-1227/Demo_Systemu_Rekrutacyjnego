package windows;

import dataStoragers.Field;
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
import static javax.swing.JOptionPane.showMessageDialog;

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
    public final static int max_fields_count = 6;

    DatebaseInterface datebase;
    StatementCreator creator;

    private Frame preferencjeKandydatFrame;
    private Label headerLabelPreferencjekandydata;
    private JTabbedPane preferencjeKandydataPane;
    private JPanel Preferencje; //ewentualna zmiana na component w zaleznosci od reakcji javy
    private Panel Dane;
    private Panel Matura;
    JButton addButton;
    JButton removeButton;
    private JList listaKierunkow; //lista kierunków dostepnych, z ktorych mozemy wybierac
    private JList listaPreferencji; //lista preferencji konkretnego kandydata, czyli kierunki, ktore wybral
    private SortedListModel listaKierunkowModel;
    private SortedListModel listaPreferencjiModel;
    ArrayList<Field> allFields;
    ArrayList<Integer> prefferedFields;

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
        setGridBagMaturyLayout();
        setGridBagPreferencjeLayout();
        prefferedFields = creator.getPrefferedInfo(idKandydata);
        addSourceElements(getFields() );
        addDestinationElements(getPrefferedFields());
    }

    private String[] getPrefferedFields() {
        String[] tab = new String[prefferedFields.size()];
        for(int i=0; i<prefferedFields.size(); i++){
            tab[i] = getFieldWithDBInd(prefferedFields.get(i)).toString();
        }
        return tab;
    }

    private String[] getFields() {
        allFields = creator.getFieldsInfo();
        if(allFields == null){
            showMessageDialog(preferencjeKandydatFrame, "Nie udało się pobrać danych o kierunkach");
            return null;
        }
        String[] result = new String[allFields.size() - prefferedFields.size()];
        int j = 0;
        for (Field f : allFields) {
            if (!prefferedFields.contains(f.getId())) {
                result[j] = f.toString();
                j++;
            }
        }
        return result;
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



    private void fillListModel(SortedListModel model, ListModel newValues) {
        int size = newValues.getSize();
        for (int i = 0; i < size; i++) {
            model.add(newValues.getElementAt(i));
        }
    }

    public void addSourceElements(Object newValue[]) {
        if (newValue != null){
            fillListModel(listaKierunkowModel, newValue);

        }
    }

    public void setSourceElements(Object newValue[]) {
        clearlistaKierunkowModel();
        addSourceElements(newValue);
    }

    public void addDestinationElements(ListModel newValue) {
        fillListModel(listaPreferencjiModel, newValue);
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
        preferencjeKandydatFrame.setSize(900, 600);
        preferencjeKandydatFrame.setBackground(new Color(219, 238, 255, 255));
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
        Preferencje = new JPanel();
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

        Preferencje.setLayout(new BorderLayout(1,1));

        //Do dodania Jlist dual http://www.java2s.com/Tutorials/Java/Swing/JList/Create_a_dual_JList_component_in_Java.htm
        JPanel leftPanel = new JPanel(new BorderLayout());
        leftPanel.add(new JLabel("Dostepne kierunki: "), BorderLayout.NORTH);
        leftPanel.add(new JScrollPane(listaKierunkow), BorderLayout.CENTER);
        addButton = new JButton(">>");
        addButton.setPreferredSize(new Dimension(370,40));
        addButton.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent actionEvent) {
                        Object selected = listaKierunkow.getSelectedValue();
                        Object[] obj = {selected};
                        if(listaPreferencjiModel.getSize() < max_fields_count){
                            addDestinationElements(obj);
                        } else{
                            showMessageDialog(preferencjeKandydatFrame, "Przekroczono maksymalną ilość kierunków");
                        }
                        clearSourceSelected();
                    }
                }
        );
        leftPanel.add(addButton, BorderLayout.SOUTH);
        Preferencje.add(leftPanel, BorderLayout.WEST);

        JPanel rightPanel = new JPanel(new BorderLayout());
        rightPanel.add(new JLabel("Wybrane kierunki: "), BorderLayout.NORTH);
        rightPanel.add(new JScrollPane(listaPreferencji), BorderLayout.CENTER);
        removeButton = new JButton("<<");
        removeButton.setPreferredSize(new Dimension(360,40));
        removeButton.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent actionEvent) {
                        Object[] selected = listaPreferencji.getSelectedValues();
                        addSourceElements(selected);
                        clearDestinationSelected();
                    }
                }
        );
        rightPanel.add(removeButton, BorderLayout.SOUTH);
        Preferencje.add(rightPanel, BorderLayout.EAST);

        JButton confirm = new JButton("Zatwierdz");
        confirm.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent actionEvent) {
                        int fieldsCount = listaPreferencjiModel.getSize();
                        if(fieldsCount == 0) return;
                        boolean succeeded = true;
                        for(int i = 1; i<= fieldsCount; i++){
                            String fieldStr = (String) listaPreferencjiModel.getElementAt(i-1);
                            for (Field field : allFields) {
                                if (fieldStr.equals(field.toString())) {
                                    if(creator.updatePreferences(idKandydata, i, field.getId())){
                                        break;
                                    } else {
                                        succeeded = false;
                                        showMessageDialog(preferencjeKandydatFrame, "Nie udało się dodać "+field.getNazwa()+ " do listy preferencji");
                                    }
                                }
                            }
                        }
                        if(succeeded) showMessageDialog(preferencjeKandydatFrame, "Poprawnie zaktualizowano preferencje kandydata");
                    }
                }
        );
        Preferencje.add(confirm, BorderLayout.SOUTH);

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
        String[] maturaResults = creator.getMaturaResults(idKandydata, 11);

        //Do dodania pola tekstowe + label do każdego przedmiotu
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady=smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 0;
        JLabel polski = new JLabel("J.Polski Podstawowy");
        panel.add(polski, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 0;
        JTextField polskiWynik = new JTextField(maturaResults[1]);
        panel.add(polskiWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 1;
        JLabel matPodstawa = new JLabel("Matematyka Podstawowa");
        panel.add(matPodstawa, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 1;
        JTextField matPodstWynik = new JTextField(maturaResults[2]);
        panel.add(matPodstWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 2;
        JLabel matRozszerzenie = new JLabel("Matematyka Rozszerzenie");
        panel.add(matRozszerzenie, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 2;
        JTextField matRozWynik = new JTextField(maturaResults[3]);
        panel.add(matRozWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 3;
        JLabel jezykPodstawa = new JLabel("J.Obcy Podstawowy");
        panel.add(jezykPodstawa, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 3;
        JTextField jezykPodstWynik = new JTextField(maturaResults[4]);
        panel.add(jezykPodstWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 4;
        JLabel jezykRozszerzenie = new JLabel("J.Obcy Rozszerzenie");
        panel.add(jezykRozszerzenie, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 4;
        JTextField jezykRozWynik = new JTextField(maturaResults[5]);
        panel.add(jezykRozWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 5;
        JLabel fizyka = new JLabel("Fizyka");
        panel.add(fizyka, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 5;
        JTextField fizykaWynik = new JTextField(maturaResults[6]);
        panel.add(fizykaWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 6;
        JLabel chemia = new JLabel("Chemia");
        panel.add(chemia, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 6;
        JTextField chemiaWynik = new JTextField(maturaResults[7]);
        panel.add(chemiaWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 7;
        JLabel biologia = new JLabel("Biologia");
        panel.add(biologia, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 7;
        JTextField biologiaWynik = new JTextField(maturaResults[8]);
        panel.add(biologiaWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 8;
        JLabel inf = new JLabel("Informatyka");
        panel.add(inf, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 8;
        JTextField infWynik = new JTextField(maturaResults[9]);
        panel.add(infWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 9;
        JLabel geo = new JLabel("Geografia");
        panel.add(geo, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 9;
        JTextField geoWynik = new JTextField(maturaResults[10]);
        panel.add(geoWynik, gbc);

        gbc.fill = GridBagConstraints.SOUTH;
        gbc.ipady = smallPaddingY;
        gbc.gridy = 10;
        JButton confirm = new JButton("Zatwierdz");
        confirm.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent actionEvent) {
                        //Przeslanie wpisanych wartosci do bazy danych
                        int[] results = new int[10];
                        results[0] = Integer.parseInt(polskiWynik.getText());
                        results[1] = Integer.parseInt(matPodstWynik.getText());
                        results[2] = Integer.parseInt(matRozWynik.getText());
                        results[3] = Integer.parseInt(jezykPodstWynik.getText());
                        results[4] = Integer.parseInt(jezykRozWynik.getText());
                        results[5] = Integer.parseInt(fizykaWynik.getText());
                        results[6] = Integer.parseInt(chemiaWynik.getText());
                        results[7] = Integer.parseInt(biologiaWynik.getText());
                        results[8] = Integer.parseInt(infWynik.getText());
                        results[9] = Integer.parseInt(geoWynik.getText());
                        if(creator.updateMaturaResults(results, idKandydata)){
                            showMessageDialog(preferencjeKandydatFrame, "Poprawnie zaktualizowano wyniki matur");
                        } else{
                          showMessageDialog(preferencjeKandydatFrame, "Wystąpił błąd podczas aktualizacji wyników matur");
                        }
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

    public Field getFieldWithDBInd(int dbInd){
        for(Field f: allFields){
            if(f.getId() == dbInd) return f;
        }
        return null;
    }
}
