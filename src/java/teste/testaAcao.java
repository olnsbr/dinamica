/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import dao.AcaoDAO;
import excecao.BDException;
import excecao.ConexaoException;
import modelo.Acao;
import modelo.Grupo;
import modelo.Modulo;
import util.ControlaConexao;

/**
 *
 * @author oddy
 */
public class testaAcao {
    
    public static void main(String[] args) throws ConexaoException, BDException {
        Acao acao = new Acao();
        
        ControlaConexao controla = new ControlaConexao("config.txt");
        
        AcaoDAO aDAO = new AcaoDAO(controla.getConexao());
        
        acao.setCodigo(1L);
        
        Grupo grupo = new Grupo();
        
        Modulo mod = new Modulo();
        
        grupo.setCodigo(1L);
        
        aDAO.adicionarGrupo(acao, grupo);        
        
      
        
    }
    
    
}
