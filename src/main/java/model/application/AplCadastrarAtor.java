package model.application;

import model.dao.DaoGeneric;

public class AplCadastrarAtor {
    private DaoGeneric dao = null;

    public AplCadastrarAtor() {
        dao = new DaoGeneric();
    }

    public String testeConexao(){
        return dao.teste();
    }

}
