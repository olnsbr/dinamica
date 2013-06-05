/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.Calendar;

/**
 *
 * @author oddy
 */
public class Acesso {
    
    private Usuario user;
    private Acao acao;
    private Calendar dataHora;
    private String rede;

    public Acesso() {
    }

    public Usuario getUser() {
        return user;
    }

    public void setUser(Usuario user) {
        this.user = user;
    }

    public Acao getAcao() {
        return acao;
    }

    public void setAcao(Acao acao) {
        this.acao = acao;
    }

    public Calendar getDataHora() {
        return dataHora;
    }

    public void setDataHora(Calendar dataHora) {
        this.dataHora = dataHora;
    }

    public String getRede() {
        return rede;
    }

    public void setRede(String rede) {
        this.rede = rede;
    }
    
    public void acesso(Usuario user, Acao acao, Calendar dataH){
        
        System.out.println("Não implementado ainda!");
    
}
    
}
