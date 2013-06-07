/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import dao.AcaoDAO;
import excecao.BDException;
import excecao.ConexaoException;
import java.util.ArrayList;
import java.util.List;
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
        acao.setDescricao("Sell Produto");
        aDAO.alterar(acao);
        
        acao.setDescricao("");
        
        List<Acao> acoes = new ArrayList<>();
        
        acoes = aDAO.pesquisar(acao);
        
        for (Acao acao1 : acoes) {
            
            System.out.println(acao1.getDescricao());
            
        }
        
      
        
    }
    
    
}
