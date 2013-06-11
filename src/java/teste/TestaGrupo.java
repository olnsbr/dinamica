/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import com.sun.xml.internal.ws.encoding.soap.SOAP12Constants;
import dao.GrupoDAO;
import excecao.BDException;
import excecao.ConexaoException;
import java.util.ArrayList;
import java.util.List;
import modelo.Grupo;
import util.ControlaConexao;

/**
 *
 * @author Fran
 */
public class TestaGrupo {
    public static void main(String[] args) throws ConexaoException, BDException {
        ControlaConexao controlaConexao = new ControlaConexao("config.txt");
        
        Grupo grupo = new Grupo();
        
        GrupoDAO grupoDAO = new GrupoDAO(controlaConexao.getConexao());
        
//        List<Grupo> lista = new ArrayList<>();
//        
//        lista = grupoDAO.pesquisar(new Grupo(""));
//        
//        for (Grupo grup : lista) {
//            
//            System.out.println(grup.getCodigo());           
//            System.out.println(grup.getNome());           
//        }
        grupo.setCodigo(2L);
        grupo = grupoDAO.consultarPorCodigo(grupo);
        
        System.out.println(grupo.getNome());
        System.out.println(grupo.getCodigo());
    }
}
