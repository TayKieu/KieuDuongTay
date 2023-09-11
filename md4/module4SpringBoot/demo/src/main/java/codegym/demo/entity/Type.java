package codegym.demo.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Entity
@Getter
@Setter
public class Type {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer typeId;

    String typeName;

    @OneToMany(mappedBy = "type")
    Set<Product> products;
}
