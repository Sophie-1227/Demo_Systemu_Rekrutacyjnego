package windows;

import javax.swing.*;
import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class PreferencjeKandydata {
    private Frame preferencjeKandydatFrame;
    private Label headerLabelPreferencjekandydata;
    private JTabbedPane preferencjeKandydataPane;
    private Panel Preferencje; //ewentualna zmiana na component w zaleznosci od reakcji javy
    private Panel Dane;
    private Panel Matura;

    public PreferencjeKandydata(){
        prepareGUI();
    }

    public void prepareGUI(){
        preferencjeKandydatFrame = new Frame("Wybór preferencji");
        preferencjeKandydatFrame.setSize(700, 500);
        preferencjeKandydatFrame.setLayout(new GridLayout(3, 1));
        preferencjeKandydatFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });
        Font font = new Font("Modern Love", Font.BOLD&Font.ITALIC, 30);
        headerLabelPreferencjekandydata = new Label();
        headerLabelPreferencjekandydata.setAlignment((int) Label.TOP_ALIGNMENT);
        headerLabelPreferencjekandydata.setFont(font);

        preferencjeKandydataPane = new JTabbedPane(SwingConstants.LEFT);
        preferencjeKandydataPane.setLayout(new FlowLayout());

        preferencjeKandydataPane.addTab("Dane Osobowe", Dane);
        preferencjeKandydataPane.addTab("Preferencje", Preferencje);
        preferencjeKandydataPane.addTab("Wyniki Matur", Matura);

        preferencjeKandydatFrame.add(headerLabelPreferencjekandydata);
        preferencjeKandydatFrame.add(preferencjeKandydataPane);
        preferencjeKandydatFrame.setVisible(true);

    }
}
