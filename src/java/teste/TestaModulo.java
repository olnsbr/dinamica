/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import dao.ModuloDAO;
import excecao.BDException;
import excecao.ConexaoException;
import modelo.Modulo;
import util.ControlaConexao;

/**
 *
 * @author Fran
 */
public class TestaModulo {
    public static void main(String[] args) throws ConexaoException, BDException {
        ControlaConexao controlaConexao = new ControlaConexao("config.txt");
        
        Modulo modulo = new Modulo();
        
//        modulo.setDescricao("Modulo 7");  
//                     
        ModuloDAO moduloDAO = new ModuloDAO(controlaConexao.getConexao());
//        
//        moduloDAO.inserir(modulo);
//        
//        List<Modulo> lista = new ArrayList<>();
//        
//        lista = moduloDAO.pesquisar(new Modulo(""));
//        
//        for (Modulo mod : lista) {
//            System.out.println(mod.getCodigo());
//            System.out.println(mod.getDescricao());
//        }
                
//        modulo.setCodigo(2L);
//        Modulo moduloConsult = moduloDAO.consultar(modulo);
//        
//        System.out.println(moduloConsult.getCodigo());
//        System.out.println(moduloConsult.getDescricao());           
        
//        modulo.setCodigo(6L);
//        modulo.setDescricao("Modulo 6");
//        moduloDAO.alterar(modulo);
        
        modulo.setCodigo(6L);
        moduloDAO.excluir(modulo); 
    }
}
