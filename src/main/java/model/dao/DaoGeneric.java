package model.dao;

import model.domain.DomAtor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class DaoGeneric {

    private SessionFactory sessionFactory;

    // Construtor para inicializar o SessionFactory
    public DaoGeneric() {
        // Carrega o SessionFactory a partir do arquivo hibernate.cfg.xml
        sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
    }

    public String teste() {
        // Abre uma nova sessão a partir do SessionFactory
        Session session = sessionFactory.openSession();

        // Inicia uma transação
        Transaction transaction = session.beginTransaction();

        // Salva uma nova entidade DomAtor
        session.save(new DomAtor("Ator 1"));

        // Comita a transação
        transaction.commit();

        // Fecha a sessão
        session.close();

        return "entrou no banco";
    }

    // Método para fechar o SessionFactory quando não for mais necessário
    public void close() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
}
