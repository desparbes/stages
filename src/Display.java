import java.sql.*;
import oracle.jdbc.pool.OracleDataSource;

public class Display {
    public void displayQueryResult(ResultSet result, int width) throws SQLException {
	try {
	    ResultSetMetaData resultMeta = result.getMetaData();
	    int nbStars = width * resultMeta.getColumnCount();
	    String s;
	    
	    s = "";         
	    for (int i = 0; i < nbStars; i++)
		s = s.concat("*");
	    System.out.println(s);
	    
	    //On affiche le nom des colonnes
	    for(int i = 1; i <= resultMeta.getColumnCount(); i++) {
		s = resultMeta.getColumnName(i).toUpperCase();
		int length = s.length();
		if (length > width - 2)
		    s = s.substring(0, width - 1);
		else {
		    for (int j = length; j < width - 1; j++)
			s = s.concat(" ");
		}
		s = s.concat("*");
		System.out.print(s);
	    }
	    
	    s = "\n";
	    for(int i = 0; i < nbStars; i++)
		s = s.concat("*");
	    System.out.println(s);

	    //On affiche les donnees
	    while(result.next()){         
		for(int i = 1; i <= resultMeta.getColumnCount(); i++) {
		    Object o = result.getObject(i);
		    if (o == null)
			s = "";
		    else
			s = o.toString();
		    int length = s.length();
		    if (length > width - 2)
			s = s.substring(0, width - 1);
		    else {
			for (int j = length; j < width - 1; j++)
			    s = s.concat(" ");
		    }
		    s = s.concat("|");
		    System.out.print(s);
		}
	    
		s = "\n";
		for(int i = 0; i < nbStars; i++)
		    s = s.concat("-");
		System.out.println(s);
	    }
	} catch (SQLException e) {
	    e.printStackTrace();
	} finally {
	    result.close();
	}
    }
}
