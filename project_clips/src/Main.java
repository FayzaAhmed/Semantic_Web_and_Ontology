import net.sf.clipsrules.jni.CLIPSException;
import net.sf.clipsrules.jni.Environment;
import net.sf.clipsrules.jni.FactAddressValue;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class Main
{
    public static Environment environment = new Environment();
    public static JFrame createFrame(String str) {
    JFrame frame = new JFrame(str);
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setSize(1000,1000);
    frame.setResizable(false);
    frame.setVisible(true);
    return frame;
    }
    public static void callingQuery(String input, int queryNum) throws CLIPSException {
    JFrame frame = createFrame("Result");
    JPanel panel = new JPanel();
    JLabel label = new JLabel("Result");
    String query = "";
    String queryFact = "";
    String querySlot = "";
    if (queryNum == 1) {
        query = "(department_name " + input + ")";
        queryFact = "Query1Fact";
        querySlot = "query1Slot";
    }
    else if (queryNum == 2) {
        query = "(student_name \"" + input + "\")";
        queryFact = "Query2Fact";
        querySlot = "query2Slot";
    }
    else if (queryNum == 3){
        query = "(faculty_name \"" + input + "\")";
        queryFact = "Query3Fact";
        querySlot = "query3Slot";
    }
    else if (queryNum == 4){
        query = "(faculty_name2 \"" + input + "\")";
        queryFact = "Query4Fact";
        querySlot = "query4Slot";
    }
    else if (queryNum == 5){
        query = "(university_name \"" + input + "\")";
        queryFact = "Query5Fact";
        querySlot = "query5Slot";
    }
    System.out.println(query);
    environment.reset();
    environment.assertString(query);
    environment.run();
    String queryResult = "";
    List <FactAddressValue> facts = environment.findAllFacts(queryFact);
    for (FactAddressValue fact : facts)
    {
        queryResult += fact.getSlotValue(querySlot).getValue()+"\n";
    }
    JTextArea textArea = new JTextArea(queryResult);
    label.setBounds(30 , 100 , 300 , 50);
    label.setFont(new Font("Arial", Font.PLAIN, 20));


    textArea.setFont(new Font("Arial", Font.PLAIN, 20));
    textArea.setBounds(300 , 100 , 400 , 400);
    textArea.setLineWrap(true);
    textArea.setWrapStyleWord(true);
    JButton button = new JButton("ok");

    button.addActionListener( new ActionListener()
    {
        public void actionPerformed(ActionEvent e) {
            // To close the current window(frame)
            frame.dispose();
        }
    });

    button.setBounds(350, 650, 150, 100);
    button.setPreferredSize(new Dimension(150, 100));
    button.setFont(new Font("Arial", Font.PLAIN, 20));
    panel.setLayout(null);
    panel.add(label);
    panel.add(textArea);
    panel.add(button);
    frame.add(panel);
    }
    public static void clickingButton(String frameName, String labelName, int queryNum) {
    JFrame frame = createFrame(frameName);
    JPanel panel = new JPanel();
    JLabel label1 = new JLabel(labelName);
    JTextField textField1 = new JTextField();

    label1.setBounds(30 , 100 , 300 , 50);
    label1.setFont(new Font("Arial", Font.PLAIN, 20));
    textField1.setBounds(350 , 100 , 400 , 50);
    textField1.setFont(new Font("Arial", Font.PLAIN, 20));

    JButton button = new JButton("Search");
    button.addActionListener( new ActionListener()
    {
        public void actionPerformed(ActionEvent e)
        {
            String input = textField1.getText();
            try {
                if (queryNum == 1)  callingQuery(input, queryNum);
                else if (queryNum == 2)  callingQuery(input, queryNum);
                else if (queryNum == 3)  callingQuery(input, queryNum);
                else if (queryNum == 4)  callingQuery(input, queryNum);
                else if (queryNum == 5)  callingQuery(input, queryNum);

            } catch (CLIPSException clipsException) {
                clipsException.printStackTrace();
            }
            // To close the current window(frame)
            frame.dispose();
        }
    });

    button.setBounds(350, 300, 150, 100);
    button.setPreferredSize(new Dimension(150, 100));
    button.setFont(new Font("Arial", Font.PLAIN, 20));

    panel.setLayout(null);
    panel.add(label1);
    panel.add(textField1);
    panel.add(button);
    frame.add(panel);

    }
    public static void main(String[] args) throws CLIPSException {
    environment.load("project_clips.clps");
    environment.reset();

    JFrame frame = createFrame("Clips Program");
    JPanel panel = new JPanel();
    panel.setLayout(null);

    JButton button1 = new JButton("Get all TAs belonging to a department ?");
    button1.addActionListener( new ActionListener()
    {
        public void actionPerformed(ActionEvent e)
        {
            clickingButton("Query1", "Enter Department Name", 1);
        }
    });

    button1.setBounds(200, 100, 600, 100);
    button1.setPreferredSize(new Dimension(200, 100));
    button1.setFont(new Font("Arial", Font.PLAIN, 20));

    ///////////////////////////////////////////////////////////////////////////////////////////////////
    JButton button2 = new JButton("Get the courses a student is currently studying ?");
    button2.addActionListener( new ActionListener()
    {
        public void actionPerformed(ActionEvent e)
        {
            clickingButton("Query2", "Enter Student Name", 2);
        }
    });

    button2.setBounds(200, 230, 600, 100);
    button2.setPreferredSize(new Dimension(200, 100));
    button2.setFont(new Font("Arial", Font.PLAIN, 20));

    ///////////////////////////////////////////////////////////////////////////////////////////////////

    JButton button3 = new JButton("Get all the courses offered by a certain faculty ?");
    button3.addActionListener( new ActionListener()
    {
        public void actionPerformed(ActionEvent e)
        {
            clickingButton("Query3", "Enter Faculty Name", 3);
        }
    });

    button3.setBounds(200, 360, 600, 100);
    button3.setPreferredSize(new Dimension(200, 100));
    button3.setFont(new Font("Arial", Font.PLAIN, 20));

    ///////////////////////////////////////////////////////////////////////////////////////////////////

    JButton button4 = new JButton("Get Lecturers of a faculty ?");
    button4.addActionListener( new ActionListener()
    {
        public void actionPerformed(ActionEvent e)
        {
            clickingButton("Query4", "Enter Faculty Name", 4);
        }
    });

    button4.setBounds(200, 490, 600, 100);
    button4.setPreferredSize(new Dimension(200, 100));
    button4.setFont(new Font("Arial", Font.PLAIN, 20));

    ///////////////////////////////////////////////////////////////////////////////////////////////////

    JButton button5 = new JButton("Get all faculties of a university ?");
    button5.addActionListener( new ActionListener()
    {
        public void actionPerformed(ActionEvent e)
        {
            clickingButton("Query5", "Enter University Name", 5);
        }
    });

    button5.setBounds(200, 620, 600, 100);
    button5.setPreferredSize(new Dimension(200, 100));
    button5.setFont(new Font("Arial", Font.PLAIN, 20));

    panel.add(button1);
    panel.add(button2);
    panel.add(button3);
    panel.add(button4);
    panel.add(button5);
    frame.add(panel);
    }
}