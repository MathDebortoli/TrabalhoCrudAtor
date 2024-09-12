package model.dao;

import model.domain.DomAtor;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

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

            System.out.println("julio");

            // Remove uma entidade DomAtor
            session.remove(ator);

            // Comita a transação
            transaction.commit();

            System.out.println("salve");


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
        try (Session session = sessionFactory.openSession()) {
            // Busca todos os atores
            return session.createQuery("from DomAtor", DomAtor.class).list();
        } catch (HibernateException e) {
            System.err.println("Erro ao buscar atores: " + e.getMessage());
            e.printStackTrace();
            return null; // Retorna nulo ou uma lista vazia em caso de erro
        }
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
