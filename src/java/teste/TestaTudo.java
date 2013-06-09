/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author oddy
 */
public class TestaTudo {
    
    public static void main(String[] args) {
        
        Integer i;
        
        List<Object> o = new ArrayList();
        
        for (int j = 0; j < 4; j++) {
            
            Object ob = new Object();
            
            o.add(ob);
            
        }
        
        i = o.size();
        
        System.out.println(i);
        System.out.println(i.intValue());
        System.out.print(o.size());
        
        
    }
    
}
