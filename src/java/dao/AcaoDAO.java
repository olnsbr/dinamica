package dao;

import excecao.BDException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Acao;

public class AcaoDAO {

    private Connection connection;

    public AcaoDAO(Connection connection) {
        this.connection = connection;
    }

    public void inserir(Acao acao) throws BDException {
        String sql = "insert into acao (descricao,componente) values (?,?)";

        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {
            instrucao.setString(1, acao.getDescricao());
            instrucao.setString(2, acao.getComponente());
            instrucao.execute();
        } catch (SQLException e) {
            throw new BDException(e);
        }
    }

    public Acao consultar(Acao acao) throws BDException {
        Acao acaoResult = null;
        String sql = "SELECT * FROM acao WHERE acao.codigo = ?";
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {
            instrucao.setLong(1, acao.getCodigo());
            ResultSet result = instrucao.executeQuery();

            while (result.next()) {

                acaoResult = new Acao();
                acaoResult.setCodigo(result.getLong("acao.codigo"));
                acaoResult.setDescricao(result.getString("acao.descricao"));

            }

            return acaoResult;
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
        }

        return null;
    }

    public void alterar(Acao acao) throws BDException {

        String sql = "UPDATE acao SET descricao=?, componente=? WHERE codigo = ?";
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {

            instrucao.setString(1, acao.getDescricao());
            instrucao.setString(2, acao.getComponente());
            instrucao.setLong(5, acao.getCodigo());

            instrucao.executeUpdate();



        } catch (SQLException e) {
            System.out.println("Erro" + e.getMessage());
        }

    }

    public void excluir(Acao acao) throws BDException {

        String sql = "DELETE FROM acao WHERE codigo = ?";
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {


            instrucao.setLong(1, acao.getCodigo());

            instrucao.execute();
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
        }


    }

    public List<Acao> pesquisar(Acao acao) throws BDException {
        List<Acao> lista = new ArrayList<>();

        String sql = "SELECT * FROM acao WERE descricao like ?";
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {
            instrucao.setString(1, "%" + acao.getDescricao()+ "%");
            ResultSet rs = instrucao.executeQuery();
            Acao newAcao = new Acao();
            

            while (rs.next()) {
                newAcao.setCodigo(rs.getLong("acao.codigo"));
                newAcao.setDescricao(rs.getString("acao.descricao"));
                newAcao.setComponente(rs.getString("acao.componente"));
                lista.add(newAcao);
            }
        } catch (SQLException e) {
            throw new BDException(e);
        }
        return lista;
    }
}
