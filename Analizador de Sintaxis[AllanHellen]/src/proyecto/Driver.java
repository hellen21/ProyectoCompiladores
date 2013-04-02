/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto;

import editor.EditorFrame;
import java.io.IOException;

import java.io.StringReader;
import java_cup.runtime.Symbol;
import javax.swing.JTable;

/**
 *
 * @author Allan
 */
public class Driver {

    EditorFrame ef;
    Scanner  sc ;
    private boolean error = false;
    private String msg_error = "";
    private int index = 0;
    private Symbol token_actual;
   
    
    public Driver(EditorFrame frame) {
        ef = frame;
    }

    public void Scan(String source) throws IOException {
        
        StringReader er = new StringReader(source);
        proyecto.Scanner s = new proyecto.Scanner(er,ef);
        sc = s;
        toEditor(ef.TablePane);
       
    }
    
    public void toEditor(JTable jTable1) throws IOException
    {
       
          try {
            token_actual = sc.next_token();
            while(token_actual.value!=null)
            {
            
            jTable1.setValueAt(token_actual.left, index, 0);
            jTable1.setValueAt(token_actual.right, index, 1);
            jTable1.setValueAt(token_actual.value, index, 2);
            jTable1.setValueAt(token_actual.sym, index, 3);
            
            index = index + 1;
            token_actual = sc.next_token();
           }
            if(error == true){
            ef.reportMessage(msg_error);
            
            }
          }
          catch (Exception e) {
            try{
            error = true;
            msg_error = "Hay un error identificado en:  Fila:  " +   token_actual.left+"\n"+
                                                       "Columna: " + token_actual.right ;
                        
            // jLabel1.setText(e.getMessage());
            }
            catch(Exception ex){
                
            }
        }
    }
    
}
