package ca.uqam.data.translator.propertiestordf;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;

public class PROPERTIES2RDF {

    public static void main(String[] args) {
        String pred = args[0];
        Properties prop = new Properties();
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        try {
            prop.load(br);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        System.out.println(prop.get(pred));    }
}
