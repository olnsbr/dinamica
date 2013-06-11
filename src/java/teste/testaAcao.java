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
        Acao acao = new Acao("");

        ControlaConexao controla = new ControlaConexao("config.txt");

        AcaoDAO aDAO = new AcaoDAO(controla.getConexao());

        List<Acao> acoes = new ArrayList<>();

        acoes = aDAO.pesquisar(acao);
        
        System.out.println("Todas as Acoes:");
        for (Acao acao1 : acoes) {

            System.out.println(acao1.getDescricao());


        }

        System.out.println("\n");

        Grupo grup = new Grupo();
        grup.setCodigo(1l);


        List<Acao> acoesG = new ArrayList<>();
        acoesG = aDAO.pesquisarAcaoGrupo(grup);
        
        System.out.println("Acoe do Grupo:");
        for (Acao acao1 : acoesG) {

            System.out.println(acao1.getDescricao());

        }

        System.out.println("\n");

        acoes.removeAll(acoesG);
        
        System.out.println("Acoes que o Grupo nao tem:");
        for (Acao acao1 : acoes) {
            
            System.out.println(acao1.getDescricao());
            
        }


    }
}
