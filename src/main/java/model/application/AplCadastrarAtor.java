package model.application;

import model.dao.DaoGeneric;
import model.domain.DomAtor;

import java.util.List;

public class AplCadastrarAtor {
    private DaoGeneric dao = null;

    public AplCadastrarAtor() {
        dao = new DaoGeneric();
    }

    public int addAtor(DomAtor ator) {
        return dao.addAtor(ator);
    }

    public int removeAtor(DomAtor ator) {
        return dao.removeAtor(ator);
    }

    public int editAtor(DomAtor ator) {
        return dao.editAtor(ator);
    }

    public List<DomAtor> getAtores() {
        return dao.getAtores();
    }


}
