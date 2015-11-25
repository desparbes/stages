import java.io.BufferedReader;
 
import java.io.File;
import java.io.FileReader;
 
import java.sql.SQLException;
import java.sql.Statement;
 
public class Parser {
    public static void parseSQLFile(String s, Statement st) throws SQLException	{
	StringBuffer sb = new StringBuffer();
	try {

	    // Attention : dans un premier temps, l'elimination des caracteres n'est pas prise en compte.
	    FileReader fr = new FileReader(new File(s));
	    
	    BufferedReader br = new BufferedReader(fr);
 
	    while ((s = br.readLine()) != null)	{
		sb.append(s);
	    }
	    br.close();
 
	    // On découpe la chaine du fichier en plusieurs chaines correspondant aux differentes requetes.
	    String[] inst = sb.toString().split(";");
 
	    for(int i = 0; i < inst.length; i++) {
		// On n'analyse pas les chaines vides.
		if(!inst[i].trim().equals("")) {
		    st.executeUpdate(inst[i]);
		    System.out.println(">>" + inst[i] + ";");
		}
	    }
	} catch(Exception e) {
	    e.printStackTrace();
	}
    }
}
