package model.dao;

import model.domain.DomAtor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class DaoGeneric {


    public DaoGeneric() {
    }

    public String teste(){
        StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("recursos.cfg.xml").build();
        Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
        SessionFactory factory = meta.getSessionFactoryBuilder().build();
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        session.save(new DomAtor("Ator 1"));
        t.commit();
        session.close();
        factory.close();
        ssr.close();

        return "entrou no banco";
    }
}
