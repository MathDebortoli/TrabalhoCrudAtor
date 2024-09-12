package model.domain;


import javax.persistence.*;

@Entity
public class DomAtor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "nome", nullable = false, length = 25)
    private String nome;

    public DomAtor() {
    }

    public DomAtor(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
