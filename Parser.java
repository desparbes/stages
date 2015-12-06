import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;


 
public class Parser {    
    public static String[] parseSQLFile(String s) throws IOException {
	StringBuffer sb = new StringBuffer();
	try {
	    FileReader fr = new FileReader(new File(s));
	    
	    BufferedReader br = new BufferedReader(fr);
	    // Elimination des commentaires
	    while ((s = br.readLine()) != null)	{
		sb.append(s.split("--")[0]);
	    }
	    br.close();
 
	    // On decoupe la chaine du fichier en plusieurs chaines correspondant aux differentes requetes.
	    String[] inst = sb.toString().split(";");
	    List<String> result = new ArrayList<String>();
 
	    for(int i = 0; i < inst.length; i++) {
		// On elimine les chaines vides.
		if(!inst[i].trim().equals(""))
		    result.add(inst[i]);
	    }
	    String[] simpleArray = new String[result.size()];
	    result.toArray(simpleArray);
	    return simpleArray;
	} catch(IOException e) {
	    e.printStackTrace();
	}
	return null;
    }
}
