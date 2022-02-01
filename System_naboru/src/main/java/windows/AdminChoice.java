package windows;

import datebase.DatebaseInterface;
import datebase.StatementCreator;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class AdminChoice {


    DatebaseInterface datebase;
    StatementCreator creator;

    private Frame adminChoiceFrame;
    private Label adminChoiceHeaderLabel;
    private Panel adminChoicePanel;

    public AdminChoice(DatebaseInterface datebase, StatementCreator creator) {
        this.datebase = datebase;
        this.creator = creator;
        prepareGUI();
        setGridBagLayout();

    }

    private void prepareGUI(){
        adminChoiceFrame = new Frame("Admin Choice");
        adminChoiceFrame.setSize(700, 500);
        adminChoiceFrame.setLayout(new GridLayout(2, 1));
        adminChoiceFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });
        Font font = new Font("Modern Love", Font.BOLD&Font.ITALIC, 30);

        adminChoiceHeaderLabel = new Label();
        adminChoiceHeaderLabel.setAlignment(Label.CENTER);
        adminChoiceHeaderLabel.setFont(font);

        adminChoicePanel = new Panel();
        adminChoicePanel.setLayout(new FlowLayout());

        adminChoiceFrame.add(adminChoiceHeaderLabel);
        adminChoiceFrame.add(adminChoicePanel);
        adminChoiceFrame.setVisible(true);


    }

    public void setGridBagLayout(){
        adminChoiceHeaderLabel.setText("Co chcesz dzisiaj zrobić?");

        Panel panel = new Panel();
        panel.setSize(new Dimension(300, 100));
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.gridheight = 20;
        JButton search = new JButton("Wyszukać kandydata");
        panel.add(search, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 0;
        gbc.gridheight = 20;
        JButton searchWorker = new JButton("Wyszukać pracownika");
        panel.add(searchWorker, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 2;
        gbc.gridy = 0;
        gbc.gridheight = 20;
        JButton kierunki = new JButton("Edytować kierunki");
        panel.add(kierunki, gbc);

        //Możliwe jak nam się uda aka będzie chciało
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 3;
        gbc.gridy = 0;
        gbc.gridheight = 20;
        JButton list = new JButton("Stworzyć listę");
        panel.add(list, gbc);

        search.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        new SearchEnginePracownika(datebase, creator);
                        adminChoiceFrame.dispose();
                    }
                }
        );

        searchWorker.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                new SearchEngineAdmin(datebase, creator);
            }
        });

        list.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                new ListAdmin(datebase, creator);
            }
        });

        adminChoicePanel.add(panel);
        adminChoiceFrame.setVisible(true);
    }

}
