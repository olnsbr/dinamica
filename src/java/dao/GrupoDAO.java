/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import excecao.BDException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Grupo;
/**
 *
 * @author oddy
 */
public class GrupoDAO {
    
    private Connection connection;

    public GrupoDAO(Connection connection) {
        this.connection = connection;
    }
    
    public void inserir(Grupo grupo) throws BDException {
        String sql = "insert into grupo (nome) values (?)";

        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {
            instrucao.setString(1, grupo.getNome());
            instrucao.execute();
        } catch (SQLException e) {
            throw new BDException(e);
        }
    }
    
     public Grupo consultarPorCodigo(Grupo grupo) throws BDException {
        Grupo grupoResult = null;
        String sql = "SELECT * FROM grupo WHERE grupo.codigo = ?";
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {
            instrucao.setLong(1, grupo.getCodigo());
            ResultSet result = instrucao.executeQuery();

            while (result.next()) {

                grupoResult = new Grupo();
                grupoResult.setCodigo(result.getLong("grupo.codigo"));
                grupoResult.setNome(result.getString("grupo.nome"));

            }

            return grupoResult;
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
        }

        return null;
    }
     
     public Grupo consultarPorNome(Grupo grupo) throws BDException {
        Grupo grupoResult = null;
        String sql = "SELECT * FROM grupo WHERE grupo.nome like ?";
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {
            instrucao.setString(1, "%" + grupo.getNome() + "%");
            ResultSet result = instrucao.executeQuery();

            while (result.next()) {

                grupoResult = new Grupo();
                grupoResult.setCodigo(result.getLong("grupo.codigo"));
                grupoResult.setNome(result.getString("grupo.nome"));

            }

            return grupoResult;
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
        }

        return null;
    }
     
      public void alterar(Grupo grupo) throws BDException {

        String sql = "UPDATE grupo SET nome=? WHERE codigo = ?";
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {

            instrucao.setString(1, grupo.getNome());
            instrucao.setLong(6, grupo.getCodigo());

            instrucao.executeUpdate();



        } catch (SQLException e) {
            System.out.println("Erro" + e.getMessage());
        }
        
        

    }
      
      public void excluir(Grupo grupo) throws BDException {

        String sql = "DELETE FROM grupo WHERE codigo = ?";
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {


            instrucao.setLong(1, grupo.getCodigo());

            instrucao.execute();
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
        }


    }
      
      public List<Grupo> pesquisar(Grupo grupo) throws BDException {
        List<Grupo> lista = new ArrayList<>();

        String sql = "SELECT * FROM grupo WHERE nome like ?";
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {
            instrucao.setString(1, "%" + grupo.getNome() + "%");
            ResultSet rs = instrucao.executeQuery();
            Grupo newGrupo = new Grupo();
            

            while (rs.next()) {
                newGrupo.setCodigo(rs.getLong("grupo.codigo"));
                newGrupo.setNome(rs.getString("grupo.nome"));
                lista.add(newGrupo);
            }
        } catch (SQLException e) {
            throw new BDException(e);
        }
        return lista;
    }
    
}
