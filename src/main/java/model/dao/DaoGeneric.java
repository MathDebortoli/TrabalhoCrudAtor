package model.dao;

import model.domain.DomAtor;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

public class DaoGeneric {

    private SessionFactory sessionFactory = null;

    // Construtor para inicializar o SessionFactory
    public DaoGeneric() {
        try {
            // Carrega o SessionFactory a partir do arquivo hibernate.cfg.xml
            sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        } catch (HibernateException e) {
            System.err.println("Erro ao criar SessionFactory: " + e.getMessage());
            System.out.println("Erro ao criar SessionFactory: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public int addAtor(DomAtor ator) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            // Inicia uma transação
            transaction = session.beginTransaction();

            // Salva uma nova entidade DomAtor
            session.save(ator);

            // Comita a transação
            transaction.commit();


            return 1;
        } catch (HibernateException e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("Erro ao adicionar ator: " + e.getMessage());
            e.printStackTrace();
            return -1; // Código de erro
        }
    }

    public int removeAtor(DomAtor ator) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            // Inicia uma transação
            transaction = session.beginTransaction();

            // Remove uma entidade DomAtor
            session.remove(ator);

            // Comita a transação
            transaction.commit();

            return 1;
        } catch (HibernateException e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("Erro ao remover ator: " + e.getMessage());
            System.out.println("Erro ao criar SessionFactory: " + e.getMessage());

            e.printStackTrace();
            return -1; // Código de erro
        }
    }

    public int editAtor(DomAtor ator) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            // Inicia uma transação
            transaction = session.beginTransaction();

            // Atualiza uma entidade DomAtor
            session.update(ator);

            // Comita a transação
            transaction.commit();
            return 1;
        } catch (HibernateException e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("Erro ao editar ator: " + e.getMessage());
            e.printStackTrace();
            return -1; // Código de erro
        }
    }

    public List<DomAtor> getAtores() {
        List lista = new ArrayList<DomAtor>();
        Query query = null;

        try (Session session = sessionFactory.openSession()){
            query = session.createQuery("from DomAtor ");
            lista = query.getResultList();
            session.close();
        } catch (HibernateException e) {
            System.err.println("Erro ao editar ator: " + e.getMessage());
            e.printStackTrace();
        }
        return lista;
    }

    // Método para fechar o SessionFactory quando não for mais necessário
    public void close() {
        if (sessionFactory != null) {
            try {
                sessionFactory.close();
            } catch (HibernateException e) {
                System.err.println("Erro ao fechar o SessionFactory: " + e.getMessage());
                e.printStackTrace();
            }
        }
    }
}
