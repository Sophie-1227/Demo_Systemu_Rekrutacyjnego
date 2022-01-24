package windows;

import java.awt.*;

public class PreferencjeKandydata {
    private Frame preferencjeKandydatFrame;
    private Label headerLabelPreferencjekandydata;
    private Panel preferencjeKandydataPanel;

    public PreferencjeKandydata(){
        prepareGUI();
    }

    public void prepareGUI(){
        preferencjeKandydatFrame = new Frame("Wybór preferencji");
        preferencjeKandydatFrame.setSize(700, 500);
        preferencjeKandydatFrame.setLayout(new GridLayout(3, 1));
    }
}
