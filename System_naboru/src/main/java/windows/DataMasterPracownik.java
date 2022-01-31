package windows;

import datebase.DatebaseInterface;
import datebase.StatementCreator;
import main.java.SearchEnginePracownika;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.SQLException;
import java.util.Date;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;
import static javax.swing.JOptionPane.showMessageDialog;

public class DataMasterPracownik {
    private Frame pracownikDataFrame;
    private Label headerLabelPracownikData;
    private Panel pracownikDataPanel;
    DatebaseInterface datebase;
    StatementCreator creator;

    public DataMasterPracownik(DatebaseInterface datebase){
        prepareGUI();
        this.datebase = datebase;
    }

    private void prepareGUI(){
        pracownikDataFrame = new Frame("Okno logowania");
        pracownikDataFrame.setSize(700, 500);
        //pracownikDataFrame.setLayout(new GridLayout(3, 1));
        pracownikDataFrame.setLayout(new BorderLayout());
        pracownikDataFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });
        Font font = new Font("Modern Love", BOLD & ITALIC, 30);
        headerLabelPracownikData = new Label();
        headerLabelPracownikData.setAlignment(Label.CENTER);
        headerLabelPracownikData.setFont(font);
        headerLabelPracownikData.setSize(700, 200);

        pracownikDataPanel = new Panel();
        pracownikDataPanel.setLayout(new BorderLayout());
        pracownikDataPanel.setSize(700, 500);

        pracownikDataFrame.add(headerLabelPracownikData, BorderLayout.NORTH);
        pracownikDataFrame.add(pracownikDataPanel, BorderLayout.CENTER);
        pracownikDataFrame.setVisible(true);
    }

    public void setGridBagDataLayout(){
        headerLabelPracownikData.setText("Tutaj możesz dokonać zmian w danych kandydata");

        Panel panel = new Panel();
        panel.setSize(700, 100);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;
        JTextField name = new JTextField("Imię");
        //name.setPreferredSize(new Dimension(120, 20));
        panel.add(name, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 0;
        JTextField sname data = new JTextField("Nazwisko");
        panel.add(sname, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 2;
        gbc.gridy = 0;
        Choice status = new Choice();
        status.add("Oczekuje na oplate");
        status.add("Zlozono dokumenty");
        status.add("Przyjety");
        status.add("Odrzucony");
        status.add("Nieprzyjety");
        status.add("Wniesiono oplate");
        status.add("Zakwalifikowany do przyjecia");
        //type.setPreferredSize(new Dimension(70, 40));
        panel.add(status, gbc);

        /*gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 4;
        gbc.gridy = 0;
        JTextField ewidencja data = new JTextField("Ewidencja");
        panel.add(ewidencja, gbc);*/

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 3;
        gbc.gridy = 0;
        Choice olipm = new Choice();
        olimp.add("TAK");
        olimp.add("NIE");
        panel.add(olimp, gbc);


        pracownikDataPanel.add(panel, BorderLayout.NORTH);
        pracownikDataFrame.setVisible(true);

    }

}
